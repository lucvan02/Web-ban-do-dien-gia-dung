package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.HinhAnhEntity;

public interface HinhAnhDAO {
//	public void themHinhAnhSanPham(HinhAnhEntity hinhAnh);
	public void themHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
	public void suaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
	public void xoaHinhAnhSanPham(List<HinhAnhEntity> hinhAnhs);
	
}
