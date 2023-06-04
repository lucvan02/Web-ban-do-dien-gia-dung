package ptithcm.service;

import java.util.List;

import ptithcm.Entity.HinhAnhEntity;
import ptithcm.Entity.SanPhamEntity;

public interface SanPhamService {
	public SanPhamEntity laySanPham(String maSp);
	public List<SanPhamEntity> laySanPhamTheoMa(String key);
	public List<SanPhamEntity> LaySanPhamMotTrang(String loai, int page, int pageSize);
	public List<SanPhamEntity> layAllSanPham();
	public List<SanPhamEntity> layAllSanPhamDaNgungBan();
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai);
	public List<SanPhamEntity> layAllSanPhamTheoLoai(String loai);
	public List<SanPhamEntity> laySanPhamCungLoai(String maSp);
	public List<SanPhamEntity> laySanPhamNgauNhien();
	public List<SanPhamEntity> laySanPhamMoi();
	public List<SanPhamEntity> locSanPhamTheoThuongHieuVaGia(String loai, List<String> brandsList, int minPrice, int maxPrice);
	public boolean kiemTraSanPhamCoNamTrongGioHang(String maSP);
	public boolean kiemTraSanPhamCoNamTrongDonHang(String maSP);
	public float tinhSoSaoTB(SanPhamEntity sanPham);
	public void themSanPham(SanPhamEntity sanPham);
	public void updateSanPham(SanPhamEntity sanPham);
	public void xoaSanPham(SanPhamEntity sanPham);
	
//	public void themHinhAnhSanPham(HinhAnhEntity hinhAnh);
	public void themHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
	public void suaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
	public void xoaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
}
