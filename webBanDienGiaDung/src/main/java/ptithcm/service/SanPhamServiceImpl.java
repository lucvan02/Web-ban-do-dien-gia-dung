package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.HinhAnhEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.dao.HinhAnhDAO;
import ptithcm.dao.SanPhamDAO;

@Service
@Transactional
public class SanPhamServiceImpl implements SanPhamService {
	@Autowired
	SanPhamDAO sanPhamDAO;
	@Autowired
	HinhAnhDAO hinhAnhDAO;

	public void setSanPhamDAO(SanPhamDAO sanPhamDAO) {
		this.sanPhamDAO = sanPhamDAO;
	}

	@Override
	public SanPhamEntity laySanPham(String maSp) {
		return sanPhamDAO.laySanPham(maSp);
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
	
	public List<SanPhamEntity> locSanPhamTheoThuongHieuVaGia(String loai, List<String> brandsList, int minPrice, int maxPrice){
		return sanPhamDAO.locSanPhamTheoThuongHieuVaGia(loai, brandsList, minPrice, maxPrice);
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

	@Override
	public void themHinhAnhSanPham(HinhAnhEntity hinhAnh) {
		hinhAnhDAO.themHinhAnhSanPham(hinhAnh);
		
	}
	
	public void themHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs) {
		hinhAnhDAO.themHinhAnhSanPham(hinhAnhs);
	}


	@Override
	public void suaHinhAnhSanPham(HinhAnhEntity hinhAnh) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void xoaHinhAnhSanPham(HinhAnhEntity hinhAnh) {
		// TODO Auto-generated method stub
		
	}
	
}
