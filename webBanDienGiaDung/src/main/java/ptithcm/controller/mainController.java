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
import ptithcm.service.SanPhamService;

@Transactional
@Controller
public class mainController {

	@Autowired
	SanPhamService sanPhamService;
	
	@RequestMapping()
	public String main(HttpServletRequest request,ModelMap model) {
		List<SanPhamEntity> listNgauNhien = sanPhamService.laySanPhamNgauNhien();
				
		 model.addAttribute("sanPhamNgauNhien", listNgauNhien); 
		 
		 List<SanPhamEntity> listMoi = sanPhamService.laySanPhamMoi();
		 model.addAttribute("sanPhamMoi", listMoi);
		
		List<SanPhamEntity> listTuLanh = sanPhamService.laySanPhamTheoLoai("TULANH");
		
		 model.addAttribute("listTuLanh", listTuLanh); 
		
		List<SanPhamEntity> listMayLanh = sanPhamService.laySanPhamTheoLoai("MAYLANH");
		
		 model.addAttribute("listMayLanh", listMayLanh); 
		
		List<SanPhamEntity> listMayGiat = sanPhamService.laySanPhamTheoLoai("MAYGIAT");
		
		 model.addAttribute("listMayGiat", listMayGiat); 
		
		List<SanPhamEntity> listTuDong = sanPhamService.laySanPhamTheoLoai("TUDONG");
	
		 model.addAttribute("listTuDong", listTuDong); 
		
		List<SanPhamEntity> listQuat = sanPhamService.laySanPhamTheoLoai("QUAT");
	
		 model.addAttribute("listQuat", listQuat); 
		
		List<SanPhamEntity> listNoiCom = sanPhamService.laySanPhamTheoLoai("NOICOM");
		
		 model.addAttribute("listNoiCom", listNoiCom); 
		 
		
		return "main";
	}
	
	@RequestMapping("khongCoQuyen")
	public String khongCoQuyen() {
		return "error/403";
	}
	
	

}
