package ptithcm.controller;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.cfg.annotations.MapKeyColumnDelegator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		List<NguoiDungEntity> listNguoiDung = nguoiDungService.getAllUserByRole(0);
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
	
	
	@RequestMapping("adminAccount")
	public String account(HttpServletRequest request,ModelMap model) {
		HttpSession session0 = request.getSession();
	List<NguoiDungEntity> adminList= nguoiDungService.getAllUserByRole(1);
	
	Collections.sort(adminList, new Comparator<NguoiDungEntity>() {
	    @Override
	    public int compare(NguoiDungEntity nguoi1, NguoiDungEntity nguoi2) {
	        boolean trangThai1 = nguoi1.isTrangThai();
	        boolean trangThai2 = nguoi2.isTrangThai();

	        // Sắp xếp theo thứ tự giảm dần (true trước, false sau)
	        return Boolean.compare(trangThai2, trangThai1);
	    }
	});
	
	
	model.addAttribute("adminList",adminList);
		return "admin/adminAccount";
	}
	
	@RequestMapping("inforAcc/{maNd}")
	public String inforAcc(@PathVariable("maNd") int maNd,HttpServletRequest request,ModelMap model) {
	HttpSession session0 = request.getSession();
	NguoiDungEntity user = nguoiDungService.findUserById(maNd);
	model.addAttribute("user",user);
	
	return "admin/inforAcc";
}
	
	@RequestMapping("createAcc")
	public String createAcc(HttpServletRequest request,ModelMap model) {
	NguoiDungEntity admin=new NguoiDungEntity();
	model.addAttribute("admin",admin);
	return "admin/createAcc";
}

	@RequestMapping(value = "/form/addAcc", params = "add", method = RequestMethod.POST)
	public String addAcc(HttpServletRequest request, ModelMap model, @ModelAttribute("admin") NguoiDungEntity admin,
			BindingResult errors) throws ParseException {

		Boolean loi = Boolean.TRUE;
		String rePassword = request.getParameter("re-passWord");
		NguoiDungEntity userCheck;

		if (admin.getEmail().isEmpty()) {
			errors.rejectValue("email", "user", "Hãy nhập email !!!");
			loi = Boolean.FALSE;
		} else if (!admin.getEmail().endsWith("@gmail.com")) {
			errors.rejectValue("email", "user", "Hãy nhập email đúng định dạng !!!");
			loi = Boolean.FALSE;
		}
		if (admin.getUserName().isEmpty()) {
			errors.rejectValue("userName", "user", "Hãy nhập username !!!");
			loi = Boolean.FALSE;
		} else if (admin.getUserName().contains(" ")) {
			errors.rejectValue("userName", "user", "UserName không được chứa khoảng trắng !!!");
			loi = Boolean.FALSE;
		} else if (admin.getUserName().length() > 30) {
			errors.rejectValue("userName", "user", "UserName không được dài quá 30 kí tự !!!");
			loi = Boolean.FALSE;
		}
		

		userCheck = nguoiDungService.findUserByNameAndEmail(admin.getUserName(), admin.getEmail());
		if (userCheck != null) {
			if (userCheck.getEmail().equals(admin.getEmail())) {
				errors.rejectValue("email", "user", "Email đã được sử dụng !!!");
				loi = Boolean.FALSE;
			}
			if (userCheck.getUserName().equals(admin.getUserName())) {
				errors.rejectValue("userName", "user", "Username đã được sử dụng !!!");
				loi = Boolean.FALSE;
			}

		}

		if (admin.getPassWord().isEmpty()) {
			errors.rejectValue("passWord", "user", "Hãy nhập mật khẩu !!!");
			loi = Boolean.FALSE;
		} else if (admin.getPassWord().length() < 8) {
			errors.rejectValue("passWord", "user", "Password tối thiểu 8 kí tự !!!");
			loi = Boolean.FALSE;
		} else if (admin.getPassWord().contains(" ")) {
			errors.rejectValue("passWord", "user", "Password không được chứa khoảng trắng !!!");
			loi = Boolean.FALSE;
		} else if (rePassword.isEmpty()) {
			errors.rejectValue("passWord", "user", "Hãy nhập lại mật khẩu !!!");
			loi = Boolean.FALSE;
		} else if (!rePassword.equals(admin.getPassWord())) {
			errors.rejectValue("passWord", "user", "Xác nhận mật khẩu không đúng !!!");
			loi = Boolean.FALSE;
		}
		if (admin.getHoTen().isEmpty()) {
			errors.rejectValue("hoTen", "user", "Hãy nhập họ tên !!!");
			loi = Boolean.FALSE;
		} else if (admin.getHoTen().length() > 50) {
			errors.rejectValue("hoTen", "user", "Họ tên quá dài !!!");
			loi = Boolean.FALSE;
		} else if (!admin.getHoTen().matches("[\\p{L} ]+")) {
			errors.rejectValue("hoTen", "user", "Họ tên không được chứa số !!!");
			loi = Boolean.FALSE;
		}

		if (admin.getNgaySinh() == null) {
			errors.rejectValue("ngaySinh", "user", "Hãy nhập ngày sinh !!!");
			loi = Boolean.FALSE;
		} else if (!isValidAndOver18(admin.getNgaySinh())) {
			errors.rejectValue("ngaySinh", "user", "Admin cần lớn hơn 18 tuổi để tạo tài khoản !!!");
			loi = Boolean.FALSE;
		}
		if (admin.getSdt().isEmpty()) {
			errors.rejectValue("sdt", "user", "Hãy nhập sdt !!!");
			loi = Boolean.FALSE;
		} else if (!admin.getSdt().matches("[0-9]+")) {
			errors.rejectValue("sdt", "user", "SDT không hợp lệ !!!");
			loi = Boolean.FALSE;
		} else if (admin.getSdt().length() != 10 && admin.getSdt().length() != 11) {
			errors.rejectValue("sdt", "user", "SDT không hợp lệ !!!");
			loi = Boolean.FALSE;
		}
		if (admin.getDiaChi().isEmpty()) {
			errors.rejectValue("diaChi", "user", "Hãy nhập địa chỉ !!!");
			loi = Boolean.FALSE;
		}

		if (loi == Boolean.FALSE)
			{ model.addAttribute("errorMessage","Lỗi thêm Admin");
			
			return "/admin/createAcc";}

		String NGAYSINH = request.getParameter("ngaySinh");
		java.sql.Date ns = java.sql.Date.valueOf(NGAYSINH);
		admin.setPassWord(nguoiDungService.maHoaMatKhau(admin.getPassWord()));
		admin.setNgaySinh(ns);
		admin.setHoTen(capitalizeString(admin.getHoTen()));
		admin.setTrangThai(true);
		admin.setQuyen(1);
		nguoiDungService.addUser(admin);
		model.addAttribute("successMessage","Thêm Admin mới thành công");
	return "/admin/createAcc";
}
	
	
	@RequestMapping("on/{maNd}")
	public String on(@PathVariable("maNd") int maNd,HttpServletRequest request,ModelMap model) {
	HttpSession session0 = request.getSession();
	NguoiDungEntity user = nguoiDungService.findUserById(maNd);
	user.setTrangThai(true);
	nguoiDungService.updateUser(user);
	
	if(user.getQuyen()==0)
		return "redirect:/admin/customerAccount.htm";
	
	return "redirect:/admin/adminAccount.htm";
}
	@RequestMapping("off/{maNd}")
	public String off(@PathVariable("maNd") int maNd,HttpServletRequest request,ModelMap model) {
	HttpSession session0 = request.getSession();
	NguoiDungEntity user = nguoiDungService.findUserById(maNd);
	user.setTrangThai(false);
	nguoiDungService.updateUser(user);
	if(user.getQuyen()==0)
		return "redirect:/admin/customerAccount.htm";
	
	return "redirect:/admin/adminAccount.htm";
}
	
	
	@RequestMapping("customerAccount")
	public String cusAccount(HttpServletRequest request,ModelMap model) {
		HttpSession session0 = request.getSession();
	List<NguoiDungEntity> cusList= nguoiDungService.getAllUserByRole(0);
	
	Collections.sort(cusList, new Comparator<NguoiDungEntity>() {
	    @Override
	    public int compare(NguoiDungEntity nguoi1, NguoiDungEntity nguoi2) {
	        boolean trangThai1 = nguoi1.isTrangThai();
	        boolean trangThai2 = nguoi2.isTrangThai();

	        // Sắp xếp theo thứ tự giảm dần (true trước, false sau)
	        return Boolean.compare(trangThai2, trangThai1);
	    }
	});
	
	
	model.addAttribute("userList",cusList);
		return "admin/customerAccount";
	}
	
	@RequestMapping("me")
		public String me(HttpServletRequest request,ModelMap model) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		return "admin/me";
	}
	
	public boolean isValidAndOver18(Date ngaySinh) {
		LocalDate dob = ngaySinh.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate today = LocalDate.now();
		int age = Period.between(dob, today).getYears();
		Date currentDate = new Date();
		return !ngaySinh.after(currentDate) && age >= 18;
	}

	public static String capitalizeString(String str) {
		String[] words = str.split("\\s+");
		for (int i = 0; i < words.length; i++) {
			words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
		}
		return String.join(" ", words);
	}
	
}

