package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.dao.KhuyenMaiDAO;

@Service
@Transactional
public class KhuyenMaiServiceImpl implements KhuyenMaiService {

    @Autowired
    private KhuyenMaiDAO khuyenMaiDAO;

    @Override
	public List<KhuyenMaiEntity> khuyenMailist() {
		// TODO Auto-generated method stub
		return khuyenMaiDAO.khuyenMailist();
	}
    
	@Override
	public void addKhuyenMai(KhuyenMaiEntity khuyenMai) {
		khuyenMaiDAO.addKhuyenMai(khuyenMai);
		
	}

	@Override
	public void updateKhuyenMai(KhuyenMaiEntity khuyenMai) {
		khuyenMaiDAO.updateKhuyenMai(khuyenMai);
		
	}

	@Override
	public void deleteKhuyenMai(KhuyenMaiEntity khuyenMai) {
		khuyenMaiDAO.deleteKhuyenMai(khuyenMai);
		
	}

	

   

}
