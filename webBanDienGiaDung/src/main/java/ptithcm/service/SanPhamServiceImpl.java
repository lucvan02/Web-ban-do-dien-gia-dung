package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.SanPhamEntity;
import ptithcm.dao.SanPhamDAO;

@Service
@Transactional
public class SanPhamServiceImpl implements SanPhamService {
	@Autowired
	SanPhamDAO sanPhamDAO;
	

	public void setSanPhamDAO(SanPhamDAO sanPhamDAO) {
		this.sanPhamDAO = sanPhamDAO;
	}

	@Override
	public SanPhamEntity laySanPham(String maSp) {
		return sanPhamDAO.laySanPham(maSp);
	}

	@Override
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void xoaSanPham(String maSp) {
		sanPhamDAO.xoaSanPham(maSp);
		
	}

	@Override
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp) {
		return sanPhamDAO.laySanPhamCungLoai(maSp);
	}

	@Override
	public float tinhSoSaoTB(SanPhamEntity sanPham) {
		return sanPhamDAO.tinhSoSaoTB(sanPham);
	}

	@Override
	public void updateSanPham(SanPhamEntity sanPham) {
	    sanPhamDAO.updateSanPham(sanPham);
		
	}
	
}
