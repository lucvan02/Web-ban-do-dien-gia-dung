package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.SanPhamEntity;
import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.dao.ThuongHieuDao;

@Service
@Transactional
public class ThuongHieuServiceImpl implements ThuongHieuService{
	@Autowired
	ThuongHieuDao thuongHieuDao;
	@Autowired
	SanPhamService sanPhamService;

	@Override
	public List<ThuongHieuEntity> layThuongHieu() {
		return thuongHieuDao.layThuongHieu();
	}

	@Override
	public List<ThuongHieuEntity> layThuongHieuDaNgung() {
		return thuongHieuDao.layThuongHieuDaNgung();
	}

	@Override
	public ThuongHieuEntity layThuongHieuTheoMa(String maTh) {
		return thuongHieuDao.layThuongHieuTheoMa(maTh);
	}
	
	@Override
	public boolean kiemTraSanPhamTheoThuongHieu(String maTH) {
	    List<SanPhamEntity> danhSachSanPham = sanPhamService.layAllSanPham();
	    
	    for (SanPhamEntity sanPham : danhSachSanPham) {
	        if (sanPham.getMaThuongHieu().getMaTh().equals(maTH)) {
	            return true; // Có sản phẩm liên kết
	        }
	    }
	    
	    return false; // Không có sản phẩm liên kết
	}

	@Override
	public void themThuongHieu(ThuongHieuEntity thuongHieu) {
		thuongHieuDao.themThuongHieu(thuongHieu);
	}

	@Override
	public void updateThuongHieu(ThuongHieuEntity thuongHieu) {
		thuongHieuDao.updateThuongHieu(thuongHieu);
	}

	@Override
	public void xoaThuongHieu(ThuongHieuEntity thuongHieu) {
		thuongHieuDao.xoaThuongHieu(thuongHieu);
	}
}
