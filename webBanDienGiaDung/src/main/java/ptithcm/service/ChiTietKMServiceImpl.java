package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.dao.ChiTietKMDAO;

@Service
@Transactional
public class ChiTietKMServiceImpl implements ChiTietKMService {
	//SessionFactory sessionFactory;
    @Autowired
    private ChiTietKMDAO chiTietKMDAO;

	@Override
	public void addChiTietKM(ChiTietKMEntity chiTietKM) {
		chiTietKMDAO.addChiTietKM(chiTietKM);
		return;
		
	}

	@Override
	public void updateChiTietKM(ChiTietKMEntity chiTietKM) {
		chiTietKMDAO.updateChiTietKM(chiTietKM);
		return;
		
	}

	@Override
	public void deleteChiTietKM(String maCTKM) {

		chiTietKMDAO.deleteChiTietKM(maCTKM);
	}

	@Override
	public List<ChiTietKMEntity> ctkmList() {
		return chiTietKMDAO.ctkmList();
	   
	}

	@Override
	public ChiTietKMEntity getChiTietKMById(String maCTKM) {

		
		return chiTietKMDAO.getChiTietKMById(maCTKM);
	}

	
   

}
