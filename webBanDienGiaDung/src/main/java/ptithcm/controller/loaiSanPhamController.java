package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.SanPhamEntity;
import ptithcm.service.SanPhamService;

@Transactional
@Controller
@RequestMapping("/loai")
public class loaiSanPhamController {
	
	@Autowired
	SanPhamService sanPhamService;

	
	@RequestMapping("/{loaiSp}")
	public String showProductsByCategory(@PathVariable("loaiSp") String loaiSp, Model model) {
	    List<SanPhamEntity> productList = sanPhamService.laySanPhamTheoLoai(loaiSp);
	    model.addAttribute("productList", productList);
	    return "sanPham/locSanPham";
	}

	
}
