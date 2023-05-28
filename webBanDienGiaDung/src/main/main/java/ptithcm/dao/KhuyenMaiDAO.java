package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.KhuyenMaiEntity;

public interface KhuyenMaiDAO {
    public List<KhuyenMaiEntity> khuyenMailist();
    public KhuyenMaiEntity getKhuyenMaiTheoMa(String maKM);
    public void addKhuyenMai(KhuyenMaiEntity khuyenMai);
    public void updateKhuyenMai(KhuyenMaiEntity khuyenMai);
    public void deleteKhuyenMai(KhuyenMaiEntity khuyenMai);
	//public List<KhuyenMaiEntity> khuyenMailist();
}
