package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.GioHangEntity;

public interface gioHangDao{
	
	public List<GioHangEntity> layGioHangCuaUser(int maNd);
	public List<GioHangEntity> layAllGioHang();
	public GioHangEntity layGioHangTheoMaNdVaSanPham(int maNd, String maSp);
	public void addGioHang(GioHangEntity giohang);
	public void updateGioHang(GioHangEntity giohang);
	public void updateSoLuong(int soLuong,int maGh);
	public void deleteGioHang(int maGh);
	
	
}