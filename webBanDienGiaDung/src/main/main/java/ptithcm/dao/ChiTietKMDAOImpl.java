package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.KhuyenMaiEntity;

@Repository
public class ChiTietKMDAOImpl implements ChiTietKMDAO{


	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addChiTietKM(ChiTietKMEntity chiTietKM) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(chiTietKM);
		
	}

	@Override
	public void updateChiTietKM(ChiTietKMEntity chiTietKM) {
		Session session = sessionFactory.getCurrentSession();
		session.update(chiTietKM);
		
	}

	@Override
	public void deleteChiTietKM(String maCTKM) {
		 Session session = sessionFactory.getCurrentSession();
	        ChiTietKMEntity chiTietKM = (ChiTietKMEntity) session.get(ChiTietKMEntity.class, maCTKM);
	        if (chiTietKM != null) {
	            session.delete(chiTietKM);
	        }
		
	}

	@Override
	public ChiTietKMEntity getChiTietKMById(String maCTKM) {
		Session session = sessionFactory.getCurrentSession();
        return (ChiTietKMEntity) session.get(ChiTietKMEntity.class, maCTKM);
		
	}

	@Override
	public List<ChiTietKMEntity> ctkmList() {
		 Session session = sessionFactory.getCurrentSession();
		 String sql = "FROM ChiTietKMEntity";
	     Query query = session.createQuery(sql);
	     List<ChiTietKMEntity> ctkmList = query.list();
	     return ctkmList;
		
//		 Session session = sessionFactory.getCurrentSession();
//	        Query<ChiTietKMEntity> query = session.createQuery("from ChiTietKMEntity");
//	        return query.getResultList();
	}
	
	
}