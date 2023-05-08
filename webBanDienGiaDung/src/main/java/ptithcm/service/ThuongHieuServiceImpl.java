package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.ThuongHieuEntity;
import ptithcm.dao.ThuongHieuDao;

@Service
@Transactional
public class ThuongHieuServiceImpl implements ThuongHieuService{
	@Autowired
	ThuongHieuDao thuongHieuDao;

	@Override
	public List<ThuongHieuEntity> layThuongHieu() {
		return thuongHieuDao.layThuongHieu();
	}

	@Override
	public List<ThuongHieuEntity> layThuongHieuDaNgung() {
		return thuongHieuDao.layThuongHieuDaNgung();
	}

	@Override
	public ThuongHieuEntity layThuongHieuTheoMa(String maTh) {
		return thuongHieuDao.layThuongHieuTheoMa(maTh);
	}
}
