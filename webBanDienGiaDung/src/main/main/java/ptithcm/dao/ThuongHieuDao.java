package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.ThuongHieuEntity;

public interface ThuongHieuDao {
	public List<ThuongHieuEntity> layThuongHieu();
	public List<ThuongHieuEntity> layThuongHieuDaNgung();
	public ThuongHieuEntity layThuongHieuTheoMa(String maTh);
	
	public void themThuongHieu(ThuongHieuEntity thuongHieu);
	public void updateThuongHieu(ThuongHieuEntity thuongHieu);
	public void xoaThuongHieu(ThuongHieuEntity thuongHieu);
	
}
