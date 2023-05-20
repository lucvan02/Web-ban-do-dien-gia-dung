package ptithcm.service;

import java.util.List;

import ptithcm.Entity.ThuongHieuEntity;

public interface ThuongHieuService {
	public ThuongHieuEntity layThuongHieuTheoMa(String maTh);
	public List<ThuongHieuEntity> layThuongHieu();
	public List<ThuongHieuEntity> layThuongHieuDaNgung();
	public boolean kiemTraSanPhamTheoThuongHieu(String maTH);
	
	public void themThuongHieu(ThuongHieuEntity thuongHieu);
	public void updateThuongHieu(ThuongHieuEntity thuongHieu);
	public void xoaThuongHieu(ThuongHieuEntity thuongHieu);
}
