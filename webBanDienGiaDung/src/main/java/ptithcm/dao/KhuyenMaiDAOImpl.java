package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import ptithcm.Entity.KhuyenMaiEntity;

@Repository
public class KhuyenMaiDAOImpl implements KhuyenMaiDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<KhuyenMaiEntity> khuyenMailist() {
//		
//		 Session session = sessionFactory.getCurrentSession(); Query<KhuyenMaiEntity>
//		 query = session.createQuery("from KhuyenMaiEntity", KhuyenMaiEntity.class);
//		 List<KhuyenMaiEntity> khuyenMaiList = query.getResultList(); return
//		 khuyenMaiList;
		 
		Session session = sessionFactory.getCurrentSession();
		String sql = "FROM KhuyenMaiEntity";
		Query query = session.createQuery(sql);
		List<KhuyenMaiEntity> khuyenMaiList = query.list();
		return khuyenMaiList;
	}

	@Override
	public KhuyenMaiEntity getKhuyenMaiTheoMa(String maKM) {
		
		 Session session = sessionFactory.getCurrentSession();
		 KhuyenMaiEntity khuyenMai = (KhuyenMaiEntity) session.get(KhuyenMaiEntity.class, maKM); 
		 return khuyenMai;
		 
		 

	}

	@Override
	public void addKhuyenMai(KhuyenMaiEntity khuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		session.save(khuyenMai);
	}

	@Override
	public void updateKhuyenMai(KhuyenMaiEntity khuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		session.update(khuyenMai);
	}

	@Override
	public void deleteKhuyenMai(KhuyenMaiEntity khuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(khuyenMai);
	}

	//@Override
//	public List<KhuyenMaiEntity> khuyenMailist() {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
