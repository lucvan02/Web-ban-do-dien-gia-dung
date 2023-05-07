package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.Entity.GioHangEntity;
import ptithcm.Entity.SanPhamEntity;

@Transactional
@Controller
public class mainController {
	@Autowired
	SessionFactory factory;
	
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai){
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai and trangThai=True ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		query.setMaxResults(6);
		List<SanPhamEntity> list = query.list();
		return list;
	}
	
	@RequestMapping()
	public String main(HttpServletRequest request,ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity where trangThai=True ORDER BY NEWID()";
		Query query = session.createQuery(hql);
		query.setMaxResults(6);
		List<SanPhamEntity> list = query.list();
		for(int i=0;i<list.size();i++)
		Hibernate.initialize(list.get(i).getHinhAnhs());
		
		
		
		 model.addAttribute("sanPhamMoi", list); 
		
		List<SanPhamEntity> listTuLanh = laySanPhamTheoLoai("TULANH");
		
		 model.addAttribute("listTuLanh", listTuLanh); 
		
		List<SanPhamEntity> listMayLanh = laySanPhamTheoLoai("MAYLANH");
		
		 model.addAttribute("listMayLanh", listMayLanh); 
		
		List<SanPhamEntity> listMayGiat = laySanPhamTheoLoai("MAYGIAT");
		
		 model.addAttribute("listMayGiat", listMayGiat); 
		
		List<SanPhamEntity> listTuDong = laySanPhamTheoLoai("TUDONG");
	
		 model.addAttribute("listTuDong", listTuDong); 
		
		List<SanPhamEntity> listQuat = laySanPhamTheoLoai("QUAT");
	
		 model.addAttribute("listQuat", listQuat); 
		
		List<SanPhamEntity> listNoiCom = laySanPhamTheoLoai("NOICOM");
		
		 model.addAttribute("listNoiCom", listNoiCom); 
		 
		 
		
		
		return "main";
	}
	
	
	
	
	
	
	

}
