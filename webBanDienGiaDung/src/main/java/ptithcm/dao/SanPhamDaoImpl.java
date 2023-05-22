package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.LoaiSanPhamEntity;
import ptithcm.Entity.SanPhamEntity;

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
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void xoaSanPham(String maSp) {
		SanPhamEntity sanPham = (SanPhamEntity)sessionFactory.getCurrentSession().get(SanPhamEntity.class, maSp);
		sessionFactory.getCurrentSession().delete(sanPham);
		
	}

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
	public void updateSanPham(SanPhamEntity sanPham) {
		sessionFactory.getCurrentSession().update(sanPham);
		
	}


}
