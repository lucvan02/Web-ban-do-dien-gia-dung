package ptithcm.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.KhuyenMaiService;


@Controller

public class aminLoginController {
	
//	@RequestMapping("admin/login")
//	public String adminLogin() {
//
//	
//		return "admin/login";
//
//	}
	
	@Autowired
	SessionFactory factory;

	@Autowired
	private KhuyenMaiService khuyenMaiService;
	
	@Autowired
	private ChiTietKMService chiTietKMService;
	
	@RequestMapping("admin/index")
	public String adminLogin(ModelMap model) {
		//Session session = factory.getCurrentSession();

		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("ctkmList", ctkmList);
		 model.addAttribute("message", "Xóa mã khuyến mãi này?");
		return "admin/sale";

	}
	
}

