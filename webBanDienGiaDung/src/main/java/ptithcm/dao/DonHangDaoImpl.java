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

}