package ptithcm.service;

import java.util.List;

import ptithcm.Entity.DonHangEntity;

public interface DonHangService{
	public void luuDonHang(DonHangEntity donHang);
	public void updateDonHang(DonHangEntity donHang);
	public DonHangEntity timDonHangTheoMa(int maDh);
	public List<DonHangEntity> timDonHangCuaUserTheoTrangThai(int maNd, int trangThai);

}