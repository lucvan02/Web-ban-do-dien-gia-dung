
package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.loader.custom.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.KhuyenMaiEntity;
import ptithcm.service.ChiTietKMService;
import ptithcm.service.KhuyenMaiService;


@Transactional
@Controller
@RequestMapping("KhuyenMai")
public class KhuyenMaiController {

	@Autowired
	private KhuyenMaiService khuyenMaiService;
	
	@Autowired
	private ChiTietKMService chiTietKMService;

	@RequestMapping()
	public String khuyenMai(ModelMap model) {

		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();		
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		model.addAttribute("ctkmList", ctkmList);		
		return "khuyenMai/khuyenMai";
	}
	

	@RequestMapping(params = "btnSearch")
	public String TimkhuyenMai(ModelMap model, @RequestParam(value = "MaSP", required = false) String maSP,
			HttpServletRequest request) {
  
		List<KhuyenMaiEntity> khuyenMaiList = khuyenMaiService.khuyenMailist();
		List<ChiTietKMEntity> ctkmList = chiTietKMService.ctkmList();
		model.addAttribute("khuyenMaiList", khuyenMaiList);
		model.addAttribute("ctkmList", ctkmList);
        model.addAttribute("maSP", maSP);      
        if (maSP.isEmpty()||maSP ==null) {
        	 model.addAttribute("message", "Vui lòng nhập mã sản phẩm cần tìm");
        	return "khuyenMai/khuyenMai";
        	}
       
        return "khuyenMai/maKM";
	}
}
