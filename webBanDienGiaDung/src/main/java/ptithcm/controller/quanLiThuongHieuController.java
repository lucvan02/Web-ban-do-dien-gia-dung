package ptithcm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.service.ThuongHieuService;

@Controller
@RequestMapping("/admin/brands")
public class quanLiThuongHieuController {
	
	@Autowired
	ThuongHieuService thuongHieuService;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String viewAddBrand(@ModelAttribute("brandForm") ThuongHieuEntity brand, ModelMap model){
		return "admin/addBrand";
	}
	
	@RequestMapping(value = "/add", params = "add", method = RequestMethod.POST)
	public String addBrand(@ModelAttribute("brandForm") ThuongHieuEntity brand, ModelMap model) throws IOException {
		
		try {
	        thuongHieuService.themThuongHieu(brand);
	        model.addAttribute("successMessage", "Thêm thành công.");
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Có lỗi xảy ra." + e.getMessage());
	        return "admin/addBrand";
	    }
		
		return "admin/addBrand";
	}
	
	
	@RequestMapping(value = "/edit/{math}", method = RequestMethod.GET)
	public String viewEditBrand(@PathVariable("math") String math, ModelMap model, HttpServletRequest request) {
		 ThuongHieuEntity thuongHieu = thuongHieuService.layThuongHieuTheoMa(math);
		 model.addAttribute("thuongHieu", thuongHieu);
		 return "admin/editBrand";
	}
	
//	@RequestMapping(value = "/edit/{math}", params = "update", method = RequestMethod.POST)
//	public String editBrand(@PathVariable("math") String math, @ModelAttribute("brand") ThuongHieuEntity brand, ModelMap model) throws IOException {
//		
//		try {
//	        thuongHieuService.updateThuongHieu(brand);
//	        model.addAttribute("successMessage", "Cập nhật thành công.");
//	    } catch (Exception e) {
//	        model.addAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật." + e.getMessage());
//	        return "admin/editBrand";
//	    }
//		
//		return "admin/editBrand";
//	}
	
	@RequestMapping(value = "/edit/{math}", params = "update", method = RequestMethod.POST)
	public String editBrand(@PathVariable("math") String math, ModelMap model, HttpServletRequest request) throws IOException {
		
		String mathuongHieu=request.getParameter("mathuonghieu");
		String tenthuongHieu=request.getParameter("tenth");
		ThuongHieuEntity thuongHieu = thuongHieuService.layThuongHieuTheoMa(math);
		model.addAttribute("thuongHieu", thuongHieu);
		thuongHieu.setMaTh(mathuongHieu);
		thuongHieu.setTenThuongHieu(tenthuongHieu);
		
		try {
	        thuongHieuService.updateThuongHieu(thuongHieu);
	        model.addAttribute("successMessage", "Cập nhật thành công.");
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật." + e.getMessage());
	        return "admin/editBrand";
	    }
		
		return "admin/editBrand";
	}
	
	
}
