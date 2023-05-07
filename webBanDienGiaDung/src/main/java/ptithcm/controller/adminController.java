package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.KhuyenMaiService;
import ptithcm.service.SanPhamService;
import ptithcm.service.ThuongHieuService;

@Transactional
@Controller
public class adminController {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	ThuongHieuService thuongHieuService;
	
	@Autowired
	private KhuyenMaiService khuyenMaiService;
	
	@Autowired
	private ChiTietKMService chiTietKMService;
	
	@RequestMapping("admin/index")
	public String index(HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/index";
	}
	
	@RequestMapping("admin/order")
	public String order() {
		return "admin/order";
	}
	
	
	@RequestMapping("admin/sale")
	public String sale(ModelMap model) {		
		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("ctkmList", ctkmList);
		return "admin/sale";
	}
	
	
	@RequestMapping("admin/account")
	public String account(HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/account";
	}
	
	@RequestMapping("admin/me")
		public String me(HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/me";
	}
	
}
