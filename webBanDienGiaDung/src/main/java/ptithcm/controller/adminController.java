package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.DonHangEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.DonHangService;
import ptithcm.service.KhuyenMaiService;
import ptithcm.service.SanPhamService;
import ptithcm.service.nguoiDungService;

@Transactional
@Controller
@RequestMapping("/admin/")
public class adminController {
	
	@Autowired
	SanPhamService sanPhamService;	
	@Autowired
	DonHangService donHangService;
	@Autowired
	nguoiDungService nguoiDungService;
	
	@Autowired
	private KhuyenMaiService khuyenMaiService;
	
	@Autowired
	private ChiTietKMService chiTietKMService;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request, ModelMap model) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		
		List<DonHangEntity> donThanhCong = donHangService.layDonHangTheoTrangThai(3);
		int tongDoanhThu = 0;
		for (DonHangEntity donHang : donThanhCong) {
		    tongDoanhThu += donHang.getTongTien();
		}
	
		model.addAttribute("tongDoanhThu", tongDoanhThu);
		
		// Tính tổng doanh thu theo từng tháng
	    List<Integer> monthlyRevenues = new ArrayList<>();
	    for (int i = 1; i <= 12; i++) {
	        int totalRevenue = donHangService.tinhTongDoanhThuTheoThang(i);
	        monthlyRevenues.add(totalRevenue);
	    }

	    model.addAttribute("monthlyRevenues", monthlyRevenues);
		
		//Thống kê số người dùng
		
		List<NguoiDungEntity> listNguoiDung = nguoiDungService.layAllNguoiDung();
		int tongSoNguoiDung=listNguoiDung.size();
		model.addAttribute("tongSoNguoiDung", tongSoNguoiDung);
		
	    // Thống kêsố đơn hàng
		int tongDonChoXacNhan= donHangService.layDonHangTheoTrangThai(1).size();
		int tongDonDangGiao= donHangService.layDonHangTheoTrangThai(2).size();
		int tongDonThanhCong= donHangService.layDonHangTheoTrangThai(3).size();
		int tongDonDaHuy= donHangService.layDonHangTheoTrangThai(0).size();
		
		model.addAttribute("pendingOrders", tongDonChoXacNhan);
	    model.addAttribute("deliveringOrders", tongDonDangGiao);
	    model.addAttribute("completedOrders", tongDonThanhCong);
	    model.addAttribute("cancelledOrders", tongDonDaHuy);
		
		return "admin/index";
	}
	
	
	@RequestMapping("sale")
	public String sale(ModelMap model) {		
		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("ctkmList", ctkmList);
		return "admin/sale";
	}
	
	
	@RequestMapping("account")
	public String account(HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/account";
	}
	
	@RequestMapping("me")
		public String me(HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/me";
	}
	
}
