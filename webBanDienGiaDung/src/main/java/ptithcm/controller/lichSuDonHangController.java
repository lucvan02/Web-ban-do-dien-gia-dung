package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.DonHangEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.service.DonHangService;

@Controller

public class lichSuDonHangController{
	@Autowired
	DonHangService donHangService;
	
	@RequestMapping("lichSuDonHang")
	public String lichSu(HttpSession session, HttpServletRequest request, ModelMap model) {
		NguoiDungEntity user=(NguoiDungEntity) session.getAttribute("USER");
		List<DonHangEntity> donHangDaHuyList=donHangService.timDonHangCuaUserTheoTrangThai(user.getMaNd(), 0);
		List<DonHangEntity> donHangChoXacNhanList=donHangService.timDonHangCuaUserTheoTrangThai(user.getMaNd(), 1);
		List<DonHangEntity> donHangDangGiaoList=donHangService.timDonHangCuaUserTheoTrangThai(user.getMaNd(), 2);		
		List<DonHangEntity> donHangThanhCongList=donHangService.timDonHangCuaUserTheoTrangThai(user.getMaNd(), 3);
		
		model.addAttribute("daHuyList",donHangDaHuyList);
		model.addAttribute("choXacNhanList",donHangChoXacNhanList);
		model.addAttribute("dangGiaoList",donHangDangGiaoList);
		model.addAttribute("thanhCongList",donHangThanhCongList);
		return "donHang/lichSuDonHang";
	}
	
}