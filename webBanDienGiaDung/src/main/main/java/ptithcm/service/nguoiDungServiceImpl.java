package ptithcm.service;

import java.util.Base64;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.NguoiDungEntity;
import ptithcm.dao.nguoiDungDao;

@Transactional
@Service

public class nguoiDungServiceImpl implements nguoiDungService{

	@Autowired
	nguoiDungDao nguoiDungDao;
	
	@Override
	public void addUser(NguoiDungEntity user) {
		nguoiDungDao.addUser(user);
		
	}

	@Override
	public void updateUser(NguoiDungEntity user) {
		nguoiDungDao.updateUser(user);
		
	}

	@Override
	public NguoiDungEntity findUserById(Integer maNd) {
		return nguoiDungDao.findUserById(maNd);
	}

	@Override
	public NguoiDungEntity findUserByNameAndEmail(String userName, String email) {
		return nguoiDungDao.findUserByNameAndEmail(userName, email);
	}

	@Override
	public String maHoaMatKhau(String str) {
		  byte[] encodedBytes = Base64.getEncoder().encode(str.getBytes());
	        return new String(encodedBytes);	}
	
}