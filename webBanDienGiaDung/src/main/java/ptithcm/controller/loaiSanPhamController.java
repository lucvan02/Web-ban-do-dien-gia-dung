package ptithcm.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.service.SanPhamService;
import ptithcm.service.ThuongHieuService;
import ptithcm.service.loaiSanPhamService;

@Transactional
@Controller
@RequestMapping("/loaisanpham")
public class loaiSanPhamController {
	
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	ThuongHieuService thuongHieuService;
	@Autowired
	loaiSanPhamService loaiService;

	@RequestMapping(value = "/{loaiSp}")
	public String main(@PathVariable("loaiSp") String loaiSp, ModelMap model,
			@RequestParam(defaultValue = "0") int page) {

		List<ThuongHieuEntity> thuongHieulist = thuongHieuService.layThuongHieu();
		model.addAttribute("thuongHieuList", thuongHieulist);
		List<SanPhamEntity> categoryList = sanPhamService.layAllSanPhamTheoLoai(loaiSp);
		model.addAttribute("categoryList", categoryList);

		int pageSize = 6;
		int totalLoaiSanPham = categoryList.size();
		int totalPages = (int) Math.ceil((double) totalLoaiSanPham / pageSize);
		int startPage = Math.max(0, page - 1);
		int endPage = Math.min(totalPages - 1, page + 1);

		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalLoaiSanPham", totalLoaiSanPham);
		model.addAttribute("totalPages", totalPages);

		List<SanPhamEntity> listSPTrenTrang = sanPhamService.LaySanPhamMotTrang(loaiSp, page, pageSize);
		model.addAttribute("listSPTrenTrang", listSPTrenTrang);

		return "sanPham/loaiSanPham";
	}

	

	@RequestMapping(value = "/{loaiSp}", params = "btnApply", method = RequestMethod.POST)
	public String locSanPham(@PathVariable("loaiSp") String loaiSp, ModelMap model, HttpServletRequest request,
			@RequestParam(value = "brands", required = false) List<String> brandsList,
			@RequestParam(value = "minPrice", defaultValue = "0") int minPrice,
			@RequestParam(value = "maxPrice", defaultValue = "999999999") int maxPrice,
			@RequestParam(defaultValue = "0") int page)
	{
		List<SanPhamEntity> categoryList = sanPhamService.locSanPhamTheoThuongHieuVaGia(loaiSp, brandsList, minPrice,
				maxPrice);
		List<ThuongHieuEntity> thuongHieulist = thuongHieuService.layThuongHieu();
		model.addAttribute("thuongHieuList", thuongHieulist);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("selectedBrands", brandsList);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		if (categoryList.isEmpty()) {
			model.addAttribute("message", "Hiện không có sản phẩm cần tìm");
			return "sanPham/locSanPham";
		}
		return "sanPham/locSanPham";
	}

}
