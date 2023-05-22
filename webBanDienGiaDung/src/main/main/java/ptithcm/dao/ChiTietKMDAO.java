package ptithcm.dao;

import java.util.List;

import ptithcm.Entity.ChiTietKMEntity;

public interface ChiTietKMDAO {
    public void addChiTietKM(ChiTietKMEntity chiTietKM);
    public void updateChiTietKM(ChiTietKMEntity chiTietKM);
    public void deleteChiTietKM(String maCTKM);
    public ChiTietKMEntity getChiTietKMById(String maCTKM);
    public List<ChiTietKMEntity> ctkmList();
}

