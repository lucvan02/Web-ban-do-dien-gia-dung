package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.SanPhamEntity;

public interface SanPhamDAO {
	public SanPhamEntity laySanPham(String maSp);
	public List<SanPhamEntity> layAllSanPham();
	public List<SanPhamEntity> layAllSanPhamDaNgungBan();
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai);
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp);
	public List<SanPhamEntity> laySanPhamNgauNhien();
	public List<SanPhamEntity> laySanPhamMoi();
	public float tinhSoSaoTB(SanPhamEntity sanPham);
	public void themSanPham(SanPhamEntity sanPham);
	public void updateSanPham(SanPhamEntity sanPham);
	public void xoaSanPham(SanPhamEntity sanPham);
	
}
