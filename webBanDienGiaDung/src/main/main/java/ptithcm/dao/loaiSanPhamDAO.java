package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.LoaiSanPhamEntity;

public interface loaiSanPhamDAO {
	public LoaiSanPhamEntity layLoaiTheoMa(String maLoai);
	public List<LoaiSanPhamEntity> layLoai();
}
