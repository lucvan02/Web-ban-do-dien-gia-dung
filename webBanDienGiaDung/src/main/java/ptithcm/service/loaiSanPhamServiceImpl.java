package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.LoaiSanPhamEntity;
import ptithcm.dao.loaiSanPhamDAO;

@Service
@Transactional
public class loaiSanPhamServiceImpl implements loaiSanPhamService{
	
	@Autowired
	loaiSanPhamDAO loaiDao;
	
	@Override
	public LoaiSanPhamEntity layLoaiTheoMa(String maLoai) {
		return loaiDao.layLoaiTheoMa(maLoai);
	}

	@Override
	public List<LoaiSanPhamEntity> layLoai() {
		return loaiDao.layLoai();
	}

}
