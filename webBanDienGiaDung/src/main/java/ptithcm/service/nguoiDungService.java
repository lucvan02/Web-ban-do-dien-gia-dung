package ptithcm.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.NguoiDungEntity;


@Service
@Transactional
public interface nguoiDungService{
	
	public void addUser(NguoiDungEntity user);
	public void updateUser(NguoiDungEntity user);
	public NguoiDungEntity findUserById(Integer maNd);
	public NguoiDungEntity findUserByNameAndEmail(String userName, String email);
	public String maHoaMatKhau(String str) ;
}