package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.Entity.DanhGiaEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.dao.SanPhamDAO;
import ptithcm.service.DanhGiaService;
import ptithcm.service.SanPhamService;

@Transactional
@Controller
@RequestMapping("/sanpham")
public class sanPhamController {
	
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhGiaService danhGiaService;
	@Autowired
	SanPhamDAO sanPhamDAO;
	
	@RequestMapping("/{maSp}")
	public String sanPham(@PathVariable("maSp") String maSp, ModelMap model,HttpServletRequest request) {
		SanPhamEntity sanPham=sanPhamService.laySanPham(maSp);
		Hibernate.initialize(sanPham.getHinhAnhs());
		List<SanPhamEntity> sanPhamCungLoai = sanPhamService.laySanPhamCungLoai(maSp);
		List<DanhGiaEntity> listDanhGia = danhGiaService.layDanhGiaSanPham(maSp);
		int count = listDanhGia.size();
		float soSaoTB = sanPhamService.tinhSoSaoTB(sanPham);
	    sanPham.setSoSaoTB(soSaoTB);
	    sanPhamDAO.updateSanPham(sanPham);
		
		model.addAttribute("sanPham", sanPham);
		model.addAttribute("sanPhamCungLoai", sanPhamCungLoai);
		model.addAttribute("danhGiaList",listDanhGia);
		model.addAttribute("count",count);
		
		return "/sanPham/sanPham";
	}
	

	
}
