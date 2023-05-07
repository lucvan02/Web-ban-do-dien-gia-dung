package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.SanPhamEntity;

public interface SanPhamDAO {
	public SanPhamEntity laySanPham(String maSp);
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai);
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp);
	public float tinhSoSaoTB(SanPhamEntity sanPham);
	public void updateSanPham(SanPhamEntity sanPham);
	public void xoaSanPham(String maSp);
	
}
