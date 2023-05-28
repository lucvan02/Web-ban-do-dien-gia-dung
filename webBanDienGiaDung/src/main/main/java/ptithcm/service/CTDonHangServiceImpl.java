package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.Entity.CTDonHangEntity;
import ptithcm.dao.CTDonHangDAO;

@Transactional
@Service

public class CTDonHangServiceImpl implements CTDonHangService{
	
	@Autowired 
	CTDonHangDAO ctDonHangDAO;

	@Override
	public void luuCtdh(CTDonHangEntity ctdh) {
		ctDonHangDAO.luuCtdh(ctdh);
		
	}

	@Override
	public List<CTDonHangEntity> timctdhTheoMaDh(int maDh) {
		return ctDonHangDAO.timctdhTheoMaDh(maDh);
	}

	@Override
	public void updateCtdh(CTDonHangEntity ctdh) {
		ctDonHangDAO.updateCtdh(ctdh);
		
	}

	@Override
	public CTDonHangEntity timCtdhTheoMaCtdh(int maCTDH) {
		return ctDonHangDAO.timCtdhTheoMaCtdh(maCTDH);
	}}
