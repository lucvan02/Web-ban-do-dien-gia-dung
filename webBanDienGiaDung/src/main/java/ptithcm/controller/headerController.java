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

import javassist.expr.NewArray;
import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.GioHangEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.KhuyenMaiService;

@Transactional
@Controller
@RequestMapping("/user")
public class headerController {
	@Autowired
	SessionFactory factory;
	@Autowired
	private KhuyenMaiService khuyenMaiService;
	@Autowired
	private ChiTietKMService chiTietKMService;
	

	
	@RequestMapping(params = "voucher")
	public String ToiTrangKM(ModelMap model) {
		

		Session session = factory.getCurrentSession();

		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("ctkmList", ctkmList);

		
		return "khuyenMai/khuyenMai";
}
	
/*
 * @RequestMapping(params = "history") public String lishSu(HttpServletRequest
 * request ,ModelMap model) { HttpSession session=request.getSession();
 * 
 * 
 * if(session.getAttribute("USER")==null) { model.addAttribute("user",new
 * NguoiDungEntity()); return "/user/login"; }
 * 
 * return "main"; }
 */
	@RequestMapping(params = "cart")
	public String gioHang(HttpServletRequest request ,ModelMap model) {
		
		HttpSession session0=request.getSession();
		
		NguoiDungEntity user=(NguoiDungEntity) session0.getAttribute("USER");
		
		if(user==null)
			{
			model.addAttribute("user", new NguoiDungEntity());
		
			return "/user/login";
			}
		
		Session session = factory.getCurrentSession();
        String hql = "FROM GioHangEntity where nguoiDung.maNd=:maNd";
       
        Query query = session.createQuery(hql);
        query.setParameter("maNd", user.getMaNd());
        List<GioHangEntity> gioHangList = query.list();
     
        
        model.addAttribute("gioHangList", gioHangList);
        
        
   
		
		return "/gioHang/gioHang";
	}
	
	public NguoiDungEntity layNguoiDungTheoId(Integer maNd) {

		Session session = factory.getCurrentSession();
		String hql = "FROM NguoiDungEntity nd WHERE nd.maNd = :maNd ";
		Query query = session.createQuery(hql).setParameter("maNd", maNd);
		NguoiDungEntity user = (NguoiDungEntity) query.uniqueResult();
		return user;

	}

	public List<SanPhamEntity> laySanPhamTheoLoai(String loai) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		query.setMaxResults(6);
		List<SanPhamEntity> list = query.list();
		return list;
	}

}