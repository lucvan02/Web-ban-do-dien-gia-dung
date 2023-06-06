package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.LoaiSanPhamEntity;
import ptithcm.Entity.SanPhamEntity;

@Transactional
@Repository
public class SanPhamDaoImpl implements SanPhamDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public SanPhamEntity laySanPham(String maSp) {
		SanPhamEntity sanPham = (SanPhamEntity)sessionFactory.getCurrentSession().get(SanPhamEntity.class, maSp);
		return sanPham;
	}

	@Override
	public List<SanPhamEntity> laySanPhamTheoMa(String key) {
	    Session session = sessionFactory.getCurrentSession();

	    String hql = "FROM SanPhamEntity sp WHERE sp.maSP LIKE :key " +
	                 "OR sp.tenSanPham LIKE :key " +
	                 "OR sp.thuongHieu.tenThuongHieu LIKE :key " +
	                 "OR sp.loaiSanPham.maLoai LIKE :key";
	    Query query = session.createQuery(hql);
	    query.setParameter("key", "%" + key + "%");
	    return query.list();
	   
	}
	
	@Override
	public List<SanPhamEntity> LaySanPhamMotTrang(String loai, int page, int pageSize) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai and trangThai=True ";
		Query query = session.createQuery(hql).setParameter("loai", loai);

		int offset = page * pageSize;
		List<SanPhamEntity> list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		return list;
	}
	
	@Override
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai and trangThai=True ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		query.setMaxResults(6);
		List<SanPhamEntity> list = query.list();
		return list;
	}

	@Override
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp) {
	    Session session = sessionFactory.getCurrentSession();
	    SanPhamEntity sp = (SanPhamEntity) session.get(SanPhamEntity.class, maSp);
	    LoaiSanPhamEntity loai = sp.getLoaiSanPham();
	    String hql = "FROM SanPhamEntity WHERE loaiSanPham = :loai AND maSP != :maSp and trangThai=True";
	    Query query = session.createQuery(hql);
	    query.setParameter("loai", loai);
	    query.setParameter("maSp", maSp);
	    query.setMaxResults(3);
	    List<SanPhamEntity> sanPhamCungLoai = query.list();
	    return sanPhamCungLoai;
	}
	
	@Override
	public List<SanPhamEntity> laySanPhamNgauNhien() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity where trangThai=True ORDER BY NEWID()";
		Query query = session.createQuery(hql);
		query.setMaxResults(6);
		List<SanPhamEntity> listNgauNhien = query.list();
		return listNgauNhien;
	}

	@Override
	public List<SanPhamEntity> laySanPhamMoi() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity where trangThai=True ORDER BY NGAYTHEM DESC";		//String hql = "FROM SanPhamEntity ORDER BY id DESC";
	    Query query = session.createQuery(hql);
	    query.setMaxResults(6);
	    List<SanPhamEntity> danhSachSanPham = query.list();
	    return danhSachSanPham;
	}
	
	
	@Override
	public List<SanPhamEntity> locSanPhamTheoThuongHieuVaGia(String loai, List<String> brandsList, int minPrice, int maxPrice){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai and trangThai=True ";
	    if (brandsList != null && !brandsList.isEmpty()) {
	        hql += "AND sp.thuongHieu.tenThuongHieu IN :brandsList ";
	    }
	    if (minPrice >= 0 && maxPrice >=0) {
	        hql += "AND sp.donGia >= :minPrice AND sp.donGia <= :maxPrice ";
	    }
	    
	    Query query = session.createQuery(hql).setParameter("loai", loai);
	    if (brandsList != null && !brandsList.isEmpty()) {
	        query.setParameterList("brandsList", brandsList);
	    }
	    if (minPrice >=0 && maxPrice >=0) {
	        query.setParameter("minPrice", minPrice).setParameter("maxPrice", maxPrice);
	    }
	    List<SanPhamEntity> categoryList = query.list();	   
	    return categoryList;
	
	}
	

	@Override
	public float tinhSoSaoTB(SanPhamEntity sanPham) {
		Session session = sessionFactory.getCurrentSession();

	    // Tính trung bình số sao đánh giá
	    Query query = session.createQuery("SELECT AVG(soSao) FROM DanhGiaEntity WHERE sanPham = :sanPham");
	    query.setParameter("sanPham", sanPham);
	    Double avg = (Double) query.uniqueResult();
	    if (avg == null) {
	        return 0; // hoặc giá trị mặc định khác tùy ý
	    }
	    
	    Float avgFloat = avg.floatValue();
	    
	    
	    // Làm tròn đến 1 chữ số thập phân
	    return  (float) (Math.round(avgFloat * 10.0) / 10.0);
	}

	@Override
	public List<SanPhamEntity> layAllSanPham() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity where trangThai=True ORDER BY NGAYTHEM DESC";
	    Query query = session.createQuery(hql);
	    List<SanPhamEntity> danhSachSanPham = query.list();
	    return danhSachSanPham;
	}

	@Override
	public List<SanPhamEntity> layAllSanPhamDaNgungBan() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity where trangThai=False ORDER BY NGAYTHEM DESC";
	    Query query = session.createQuery(hql);
	    List<SanPhamEntity> danhSachSanPham = query.list();
	    return danhSachSanPham;
	}

	@Override
	public void themSanPham(SanPhamEntity sanPham) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(sanPham);
			t.commit();
		
		} catch (Exception ex) {
			t.rollback();
			System.out.print("loi");

		} finally {
			session.close();
		}
	}
	
	@Override
	public void updateSanPham(SanPhamEntity sanPham) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(sanPham);
			t.commit();
		
		} catch (Exception ex) {
			t.rollback();
			System.out.print("loi");

		} finally {
			session.close();
		}
	}

	@Override
	public void xoaSanPham(SanPhamEntity sanPham) {
		sessionFactory.getCurrentSession().delete(sanPham);		
	}

	@Override
	public List<SanPhamEntity> layAllSanPhamTheoLoai(String loai) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai and trangThai=True ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		List<SanPhamEntity> list = query.list();
		return list;
	}



}
