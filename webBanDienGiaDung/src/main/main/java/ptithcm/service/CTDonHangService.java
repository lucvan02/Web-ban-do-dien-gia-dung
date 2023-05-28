package ptithcm.service;



import java.util.List;

import ptithcm.Entity.CTDonHangEntity;


public interface CTDonHangService{
	public void luuCtdh(CTDonHangEntity ctdh) ;
	public void updateCtdh(CTDonHangEntity ctdh) ;
	public List<CTDonHangEntity> timctdhTheoMaDh(int maDh);
    public CTDonHangEntity timCtdhTheoMaCtdh(int maCTDH);
}