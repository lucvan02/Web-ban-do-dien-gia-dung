package ptithcm.service;

import java.util.List;

import ptithcm.Entity.ChiTietKMEntity;

public interface ChiTietKMService {
	void addChiTietKM(ChiTietKMEntity chiTietKM);    
    void updateChiTietKM(ChiTietKMEntity chiTietKM);
    void deleteChiTietKM(String maCTKM);
    List<ChiTietKMEntity> ctkmList();
    ChiTietKMEntity getChiTietKMById(String maCTKM);
}
