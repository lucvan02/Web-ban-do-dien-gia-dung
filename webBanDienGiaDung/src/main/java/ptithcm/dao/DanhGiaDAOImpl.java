package ptithcm.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.Entity.DanhGiaEntity;

@Repository
public class DanhGiaDAOImpl implements DanhGiaDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DanhGiaEntity> layDanhGiaSanPham(String maSp) {
	    Session session = sessionFactory.getCurrentSession();
	    String hql = "FROM DanhGiaEntity WHERE sanPham.maSP = :maSp order by ngay DESC";
	    Query query = session.createQuery(hql);
	    query.setParameter("maSp", maSp);
	    List<DanhGiaEntity> danhGiaList = query.list();
	    return danhGiaList;
	}

	@Override
	public void saveDanhGia(DanhGiaEntity danhGia) {
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(danhGia);
		
	}

	
}