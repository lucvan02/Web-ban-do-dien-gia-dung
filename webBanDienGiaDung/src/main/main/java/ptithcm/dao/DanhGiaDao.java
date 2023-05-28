package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.DanhGiaEntity;

public interface DanhGiaDao {
	public List<DanhGiaEntity> layDanhGiaSanPham(String maSp);
	public void saveDanhGia(DanhGiaEntity danhGia);
	
}
