package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.DonHangEntity;
import ptithcm.dao.DonHangDAO;

@Service
@Transactional

public class DonHangServiceImpl implements DonHangService{

	@Autowired
	private DonHangDAO DonHang;
	
	@Override
	public void luuDonHang(DonHangEntity donHang) {
		DonHang.luuDonHang(donHang);
		return;
	}

	@Override
	public List<DonHangEntity> timDonHangCuaUserTheoTrangThai(int maNd, int trangThai) {
		
		return DonHang.timDonHangCuaUserTheoTrangThai(maNd, trangThai);
		
	}

	@Override
	public void updateDonHang(DonHangEntity donHang) {
		DonHang.updateDonHang(donHang);
		
	}

	@Override
	public DonHangEntity timDonHangTheoMa(int maDh) {
		return DonHang.timDonHangTheoMa(maDh);
	}
	
}