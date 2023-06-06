package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.DonHangEntity;
import ptithcm.Entity.GioHangEntity;

@Repository

public class DonHangDaoImpl implements DonHangDAO {

	@Autowired
	private SessionFactory factory;

	@Override
	public void luuDonHang(DonHangEntity donHang) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(donHang);
			t.commit();

		} catch (Exception ex) {
			t.rollback();

		} finally {
			session.close();

		}

	}

	@Override
	public void updateDonHang(DonHangEntity donHang) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(donHang);
			t.commit();

		} catch (Exception ex) {
			t.rollback();

		} finally {
			session.close();

		}

	}

	@Override
	public List<DonHangEntity> timDonHangCuaUserTheoTrangThai(int maNd, int trangThai) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DonHangEntity where nguoiDung.maNd=:maNd and trangThai=:trangThai order by ngayTao DESC";

		Query query = session.createQuery(hql);
		query.setParameter("maNd", maNd);
		query.setParameter("trangThai", trangThai);
		List<DonHangEntity> donHangList = query.list();

		return donHangList;

	}

	@Override
	public DonHangEntity timDonHangTheoMa(int maDh) {

		Session session = factory.getCurrentSession();
		String hql = "FROM DonHangEntity where maDh=:maDh";

		Query query = session.createQuery(hql);
		query.setParameter("maDh", maDh);
		DonHangEntity donHang = (DonHangEntity) query.uniqueResult();

		return donHang;
	}

	@Override
	public List<DonHangEntity> layAllDonHang(){
		Session session = factory.getCurrentSession();
		String hql = "FROM DonHangEntity ORDER BY ngayTao DESC";
	    Query query = session.createQuery(hql);
	    List<DonHangEntity> listDonHang = query.list();
	    return listDonHang;
	}
	
	@Override
	public List<DonHangEntity> layDonHangTheoTrangThai(int trangThai) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM DonHangEntity WHERE trangThai = :trangThai";
	    Query query = session.createQuery(hql);
	    query.setParameter("trangThai", trangThai);
	    List<DonHangEntity> listDonHang = query.list();
	    return listDonHang;
	}

	@Override
	public long tinhTongDoanhThuTheoThang(int thang) {
	    Session session = factory.getCurrentSession();
	    String hql = "SELECT SUM(dh.tongTien) FROM DonHangEntity dh WHERE MONTH(dh.ngayTao) = :thang AND YEAR(dh.ngayTao) = YEAR(CURRENT_DATE()) AND dh.trangThai = 3";
	    Query query = session.createQuery(hql);
	    query.setParameter("thang", thang);
	    Long totalRevenue = (Long) query.uniqueResult();
	    return (totalRevenue != null) ? totalRevenue : 0L;
	}





}