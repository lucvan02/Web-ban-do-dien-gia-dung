package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.HinhAnhEntity;

@Transactional
@Repository
public class HinhAnhDAOImpl implements HinhAnhDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

//	@Override
//	public void themHinhAnhSanPham(HinhAnhEntity hinhAnh) {
//		Session session = sessionFactory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			session.saveOrUpdate(hinhAnh);
//			t.commit();
//		
//		} catch (Exception ex) {
//			t.rollback();
//			System.out.print("loi");
//
//		} finally {
//			session.close();
//		}
//		
//	}
	
	public void themHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
	    Session session = sessionFactory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        for (HinhAnhEntity hinhAnh : hinhAnhs) {
	            session.save(hinhAnh);
	        }
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	        System.out.print("loi");

	    } finally {
	        session.close();
	    }
	}
	
	public void suaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
	    Session session = sessionFactory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        for (HinhAnhEntity hinhAnh : hinhAnhs) {
	            session.update(hinhAnh);
	        }
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	        System.out.print("loi");

	    } finally {
	        session.close();
	    }
	}
	

	@Override
	public void xoaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
		Session session = sessionFactory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        for (HinhAnhEntity hinhAnh : hinhAnhs) {
	            session.delete(hinhAnh);
	        }
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	        System.out.print("loi");

	    } finally {
	        session.close();
	    }
	}

}
