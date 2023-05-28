package ptithcm.service;

import java.util.List;

import ptithcm.Entity.KhuyenMaiEntity;

public interface KhuyenMaiService {
	public List<KhuyenMaiEntity> khuyenMailist();
    public void addKhuyenMai(KhuyenMaiEntity khuyenMai);
    public void updateKhuyenMai(KhuyenMaiEntity khuyenMai);
    public void deleteKhuyenMai(KhuyenMaiEntity khuyenMai);
   
}
