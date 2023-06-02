package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.CTDonHangEntity;
import ptithcm.Entity.GioHangEntity;
import ptithcm.Entity.HinhAnhEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.dao.CTDonHangDAO;
import ptithcm.dao.HinhAnhDAO;
import ptithcm.dao.SanPhamDAO;

@Service
@Transactional
public class SanPhamServiceImpl implements SanPhamService {
	@Autowired
	SanPhamDAO sanPhamDAO;
	@Autowired
	HinhAnhDAO hinhAnhDAO;
	@Autowired
	gioHangService giohagService;
	@Autowired
	CTDonHangDAO ctdonHangDao;

	public void setSanPhamDAO(SanPhamDAO sanPhamDAO) {
		this.sanPhamDAO = sanPhamDAO;
	}

	@Override
	public SanPhamEntity laySanPham(String maSp) {
		return sanPhamDAO.laySanPham(maSp);
	}

	@Override
	public List<SanPhamEntity> laySanPhamTheoMa(String key) {	    
	    return sanPhamDAO.laySanPhamTheoMa(key);   
	}
	
	@Override
	public List<SanPhamEntity> LaySanPhamMotTrang(String loai, int page, int pageSize){
		return sanPhamDAO.LaySanPhamMotTrang(loai, page, pageSize);
	}
	
	@Override
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai) {
		return sanPhamDAO.laySanPhamTheoLoai(loai);
	}
	
	@Override
	public List<SanPhamEntity> layAllSanPhamTheoLoai(String loai) {
		return sanPhamDAO.layAllSanPhamTheoLoai(loai);
	}

	@Override
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp) {
		return sanPhamDAO.laySanPhamCungLoai(maSp);
	}
	
	@Override
	public List<SanPhamEntity> laySanPhamNgauNhien() {
		return sanPhamDAO.laySanPhamNgauNhien();
	}
	
	@Override
	public List<SanPhamEntity> laySanPhamMoi() {
		return sanPhamDAO.laySanPhamMoi();
	}
	
	@Override
	public List<SanPhamEntity> locSanPhamTheoThuongHieuVaGia(String loai, List<String> brandsList, int minPrice, int maxPrice){
		return sanPhamDAO.locSanPhamTheoThuongHieuVaGia(loai, brandsList, minPrice, maxPrice);
	}
	
	@Override
	public boolean kiemTraSanPhamCoNamTrongGioHang(String maSP) {
		List<GioHangEntity> danhSachGioHang = giohagService.layAllGioHang();
	    
	    for (GioHangEntity gioHang : danhSachGioHang) {
	        if (gioHang.getSanPham().getMaSP().equals(maSP)) {
	            return true; // có nằm trong giỏ hàng
	        }
	    }
	    
	    return false; // Không có nằm trong giỏ hàng
	}
	
	@Override
	public boolean kiemTraSanPhamCoNamTrongDonHang(String maSP) {
		List<CTDonHangEntity> danhSachCTDonHang = ctdonHangDao.layAllCTDonHang();
	    
	    for (CTDonHangEntity ctdonHang : danhSachCTDonHang) {
	        if (ctdonHang.getSanPham().getMaSP().equals(maSP)) {
	            return true; // có nằm trong đơn hàng
	        }
	    }
	    
	    return false; // Không có nằm trong đơn hàng
	}

	@Override
	public float tinhSoSaoTB(SanPhamEntity sanPham) {
		return sanPhamDAO.tinhSoSaoTB(sanPham);
	}

	@Override
	public List<SanPhamEntity> layAllSanPham() {
		return sanPhamDAO.layAllSanPham();
	}

	@Override
	public List<SanPhamEntity> layAllSanPhamDaNgungBan() {
		return sanPhamDAO.layAllSanPhamDaNgungBan();
	}

	@Override
	public void themSanPham(SanPhamEntity sanPham) {
		sanPhamDAO.themSanPham(sanPham);
	}
	
	@Override
	public void updateSanPham(SanPhamEntity sanPham) {
	    sanPhamDAO.updateSanPham(sanPham);
		
	}

	@Override
	public void xoaSanPham(SanPhamEntity sanPham) {
		sanPhamDAO.xoaSanPham(sanPham);
	}

//	@Override
//	public void themHinhAnhSanPham(HinhAnhEntity hinhAnh) {
//		hinhAnhDAO.themHinhAnhSanPham(hinhAnh);
//		
//	}
	
	@Override
	public void themHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
		hinhAnhDAO.themHinhAnhSanPham(hinhAnhs);
	}
	
	@Override
	public void suaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
		hinhAnhDAO.suaHinhAnhSanPham(hinhAnhs);
	}

	@Override
	public void xoaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
		hinhAnhDAO.xoaHinhAnhSanPham(hinhAnhs);
	}

	
}
