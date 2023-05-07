package ptithcm.service;

import java.util.List;

import ptithcm.Entity.ThuongHieuEntity;

public interface ThuongHieuService {
	public ThuongHieuEntity layThuongHieuTheoMa(String maTh);
	public List<ThuongHieuEntity> layThuongHieu();
	public List<ThuongHieuEntity> layThuongHieuDaNgung();
}
