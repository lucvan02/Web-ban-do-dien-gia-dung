package ptithcm.dao;

import ptithcm.Entity.NguoiDungEntity;

public interface nguoiDungDao{
	
	public void addUser(NguoiDungEntity user);
	public void updateUser(NguoiDungEntity user);
	public NguoiDungEntity findUserById(Integer maNd);
	public NguoiDungEntity findUserByNameAndEmail(String userName, String email);
	
	
}