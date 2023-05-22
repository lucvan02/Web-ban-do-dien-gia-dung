package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.CTDonHangEntity;
import ptithcm.Entity.DanhGiaEntity;
import ptithcm.Entity.DonHangEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.service.CTDonHangService;
import ptithcm.service.DanhGiaService;
import ptithcm.service.DonHangService;
import ptithcm.service.SanPhamService;

@Controller

public class danhGiaController{
	@Autowired
	DonHangService donHangService;
	@Autowired
	CTDonHangService ctDonHangService;
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhGiaService danhGiaService;
	
	@RequestMapping("danhGia/{maDh}")
	public String danhGia(@PathVariable("maDh")int maDh,ModelMap model, HttpSession session )
	{
		session.setAttribute("MADH",maDh);
		DonHangEntity donHang=donHangService.timDonHangTheoMa(maDh);
		List<CTDonHangEntity> ctDonHangList=ctDonHangService.timctdhTheoMaDh(maDh);
		model.addAttribute("donHang",donHang);
		model.addAttribute("ctDonHangList",ctDonHangList);
		
		
		
		return "donHang/danhGia";
	}
	@RequestMapping("luuDanhGia/{maSp}/{maCTDH}")
	public String luuDanhGia(@PathVariable("maSp")String maSp,@PathVariable("maCTDH") int maCTDH ,HttpServletRequest request ,HttpSession session)
	{
		Date currentDate = new Date();
		DanhGiaEntity danhGia=new DanhGiaEntity();
		NguoiDungEntity user=(NguoiDungEntity) session.getAttribute("USER");
		SanPhamEntity sanPham=sanPhamService.laySanPham(maSp);
		CTDonHangEntity ctdh=ctDonHangService.timCtdhTheoMaCtdh(maCTDH);
		
		
		Float soSao=Float.parseFloat(request.getParameter("soSao"));
		String noiDung=request.getParameter("noiDung");
		danhGia.setNguoiDung(user);
		danhGia.setNgay(currentDate);
		danhGia.setSoSao(soSao);
		danhGia.setNoiDung(noiDung);
		danhGia.setSanPham(sanPham);
		 danhGiaService.saveDanhGia(danhGia); 
		
		ctdh.setTrangThaiDanhGia(true);
		ctDonHangService.updateCtdh(ctdh);
		
		int maDh=(int) session.getAttribute("MADH");
		session.removeAttribute("MADH");
		
		
		
		return "redirect:/danhGia/"+maDh+".htm";
	}
}