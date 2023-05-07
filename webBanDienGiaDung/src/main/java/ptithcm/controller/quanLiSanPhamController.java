package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.Entity.HinhAnhEntity;
import ptithcm.Entity.LoaiSanPhamEntity;
import ptithcm.Entity.NguoiDungEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.service.SanPhamService;
import ptithcm.service.ThuongHieuService;
import ptithcm.service.loaiSanPhamService;

@Transactional
@Controller
public class quanLiSanPhamController {
	
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	ThuongHieuService thuongHieuService;
	@Autowired
	loaiSanPhamService loaiService;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="admin/product", method = RequestMethod.GET)
	public String product(ModelMap model, HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		
		List<SanPhamEntity> listAllSanPham = sanPhamService.layAllSanPham();
		model.addAttribute("listAllSanPham",listAllSanPham);
		
		List<SanPhamEntity> listSanPhamNgungBan = sanPhamService.layAllSanPhamDaNgungBan();
		model.addAttribute("listNgungBan",listSanPhamNgungBan);
		
		List<ThuongHieuEntity> listThuongHieu=thuongHieuService.layThuongHieu();
		model.addAttribute("listThuongHieu", listThuongHieu);
		
		List<ThuongHieuEntity> listThuongHieuNgungBan=thuongHieuService.layThuongHieuDaNgung();
		model.addAttribute("listThuongHieuNgung", listThuongHieuNgungBan);
		return "admin/product";
	}
	
	
	@RequestMapping(value="admin/product", params="changeStatus", method = RequestMethod.POST)
	public String updateTrangThaiSanPham(HttpServletRequest request) {
		String maSp= request.getParameter("maSPSuaTT");
		boolean trangThai = Boolean.parseBoolean(request.getParameter("trangThaiSp"));
	    SanPhamEntity sanPham = sanPhamService.laySanPham(maSp);
	    sanPham.setTrangThai(!trangThai); // set trạng thái sản phẩm từ "đang bán" sang "ngừng bán"
	    sanPhamService.updateSanPham(sanPham);

	    return "redirect:/admin/product.htm";
	}
	
	@RequestMapping(value="admin/product", params="deleteSP", method = RequestMethod.POST)
	public String deleteSanPham(HttpServletRequest request) {
		String maSp = request.getParameter("maSPXoa");
		SanPhamEntity sanPham = sanPhamService.laySanPham(maSp);
		sanPhamService.xoaSanPham(sanPham);
		return "redirect:/admin/product.htm";
	}
	
	
	@RequestMapping(value = "/admin/product/add", method = RequestMethod.GET)
	public String viewAddProduct(ModelMap model, HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
	    List<ThuongHieuEntity> listThuongHieu = thuongHieuService.layThuongHieu();
	    model.addAttribute("listThuongHieu", listThuongHieu);
	    List<LoaiSanPhamEntity> listLoai = loaiService.layLoai();
	    model.addAttribute("listLoai", listLoai);
	    model.addAttribute("productForm", new SanPhamEntity());
	    return "admin/addProduct";
	}
	
	
	@RequestMapping(value = "/admin/product/add", params = "add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("productForm") SanPhamEntity product, 
	        @RequestParam("avatar") MultipartFile avatar, 
	        @RequestParam("images") MultipartFile[] images,
	        @RequestParam("thongSo") MultipartFile thongSo,
	        ModelMap model) throws IOException {

	    //Lấy ngày tháng cộng vào tên file để khỏi bị trùng file
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String now = formatter.format(today);
		
	    String avatarFileName = now +"-"+ avatar.getOriginalFilename();
//	    String avatarFilePath = context.getRealPath("/assets/img/sanPham/" + avatarFileName);
	    String avatarFilePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + avatarFileName;
	    File avatarFile = new File(avatarFilePath);
	    avatar.transferTo(avatarFile);
	    product.setHinhAnhDaiDien("assets/img/sanPham/"+avatarFileName);
	    
	    
	    List<HinhAnhEntity> hinhAnhKhacs = new ArrayList<>();
	    int count = 0;
	    for (MultipartFile file : images) {
	    	if (count >= 4) { // Giới hạn tối đa 4 hình ảnh
	    		model.addAttribute("maximgsMessage", "Tối đa 4 hình");
	    		break;
//	    		return "/admin/addProduct";
	        }
	    	
	        String fileName = now + file.getOriginalFilename();
//	        String filePath = context.getRealPath("/assets/img/sanPham/" + fileName);
	        String filePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + fileName;
	        File dest = new File(filePath);
	        file.transferTo(dest);

	        HinhAnhEntity hinhAnhKhac = new HinhAnhEntity();
	        hinhAnhKhac.setLink("assets/img/sanPham/"+fileName);
	        hinhAnhKhac.setSanPham(product);
	        hinhAnhKhacs.add(hinhAnhKhac);
	        count++;
//	        sanPhamService.themHinhAnhSanPham(hinhAnhKhac);
	    }
	    model.addAttribute("count", count);
	    	    
	    product.setHinhAnhs(hinhAnhKhacs);
	    
	    String thongSoFileName = now +"-"+ thongSo.getOriginalFilename();
//	    String avatarFilePath = context.getRealPath("/assets/img/sanPham/" + thongSoFileName);
	    String thongSoFilePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + thongSoFileName;
	    File thongSoFile = new File(thongSoFilePath);
	    thongSo.transferTo(thongSoFile);
	    product.setThongSoKt("assets/img/sanPham/"+thongSoFileName);
	    
	    
		product.setNgayThem(today);
		
		try {
	        sanPhamService.themSanPham(product);
	        sanPhamService.themHinhAnhSanPham(hinhAnhKhacs);
	        model.addAttribute("successMessage", "Thêm sản phẩm thành công.");
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm. " + e.getMessage());
	        return "/admin/addProduct";
	    }
		
	    return "admin/addProduct";
	}
	
	
	@RequestMapping(value = "/admin/product/edit/{masp}", method = RequestMethod.GET)
	public String viewEditProduct(@PathVariable("masp") String masp, ModelMap model, HttpServletRequest request) {
		HttpSession session0 = request.getSession();
		NguoiDungEntity user = (NguoiDungEntity) session0.getAttribute("USER");
		
	    SanPhamEntity sanPham = sanPhamService.laySanPham(masp);
	    Hibernate.initialize(sanPham.getHinhAnhs());
	    List<ThuongHieuEntity> listThuongHieu = thuongHieuService.layThuongHieu();
	    List<LoaiSanPhamEntity> listLoai = loaiService.layLoai();
	    model.addAttribute("sanPham", sanPham);
	    model.addAttribute("listThuongHieu", listThuongHieu);
	    model.addAttribute("listLoai", listLoai);
	    model.addAttribute("product", new SanPhamEntity());
	    return "admin/editProduct";
	}

	@RequestMapping(value = "/admin/product/edit/{masp}", params = "update", method = RequestMethod.POST)
	public String editProduct(@PathVariable("masp") String masp,
	                           @ModelAttribute("product") SanPhamEntity product,
	                           @RequestParam("avatar") MultipartFile avatar,
	                           @RequestParam("images") MultipartFile[] images,
	                           @RequestParam("thongSo") MultipartFile thongSo,
	                           ModelMap model) throws IOException {

	    //Lấy ngày tháng cộng vào tên file để khỏi bị trùng file
	    Date today = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	    String now = formatter.format(today);

	    String avatarFileName = now +"-"+ avatar.getOriginalFilename();
	    String avatarFilePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + avatarFileName;
	    File avatarFile = new File(avatarFilePath);
	    avatar.transferTo(avatarFile);
	    product.setHinhAnhDaiDien("assets/img/sanPham/"+avatarFileName);

	    List<HinhAnhEntity> hinhAnhKhacs = new ArrayList<>();
	    for (MultipartFile file : images) {
	        String fileName = now + file.getOriginalFilename();
	        String filePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + fileName;
	        File dest = new File(filePath);
	        file.transferTo(dest);

	        HinhAnhEntity hinhAnhKhac = new HinhAnhEntity();
	        hinhAnhKhac.setLink("assets/img/sanPham/"+fileName);
	        hinhAnhKhac.setSanPham(product);
	        hinhAnhKhacs.add(hinhAnhKhac);
	    }

	    product.setHinhAnhs(hinhAnhKhacs);
	    
	    String thongSoFileName = now +"-"+ thongSo.getOriginalFilename();
	    String thongSoFilePath = "C:\\Users\\vanlu\\Documents\\webBanDienGiaDung\\src\\main\\webapp\\assets\\img\\sanPham\\" + thongSoFileName;
	    File thongSoFile = new File(thongSoFilePath);
	    thongSo.transferTo(thongSoFile);
	    product.setThongSoKt("assets/img/sanPham/"+thongSoFileName);

//	    product.setNgaySua(today);
	    product.setNgayThem(today);

	    try {
	        sanPhamService.updateSanPham(product);
	        sanPhamService.themHinhAnhSanPham(hinhAnhKhacs);
	        model.addAttribute("successMessage", "Cập nhật sản phẩm thành công.");
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật sản phẩm. " + e.getMessage());
	        return "admin/editProduct";
	    }
	    return "admin/editProduct";
	}

	
	
}
