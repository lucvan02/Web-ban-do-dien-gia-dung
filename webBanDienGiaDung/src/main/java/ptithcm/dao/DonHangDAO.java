package ptithcm.dao;

import java.util.List;
import ptithcm.Entity.DonHangEntity;

public interface DonHangDAO{
	public void luuDonHang(DonHangEntity donHang);
	public void updateDonHang(DonHangEntity donHang);
	public DonHangEntity timDonHangTheoMa(int maDh);
	public List<DonHangEntity> timDonHangCuaUserTheoTrangThai(int maNd, int trangThai);
	
	public List<DonHangEntity> layAllDonHang();	
	public List<DonHangEntity> layDonHangTheoTrangThai(int trangThai);
	public long tinhTongDoanhThuTheoThang(int thang);
}