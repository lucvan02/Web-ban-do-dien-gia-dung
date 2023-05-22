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
import ptithcm.Entity.DonHangEntity;
import ptithcm.Entity.GioHangEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.DonHangService;
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
	public String ToiTrangKM() {

		

		return "redirect:/KhuyenMai.htm";
	}

	@RequestMapping(params = "history")
	public String lishSu() {
	
		

		return "redirect:/lichSuDonHang.htm";
	}

	@RequestMapping(params = "cart")
	public String gioHang() {


		return "redirect:/gioHang.htm";
	}

	
}