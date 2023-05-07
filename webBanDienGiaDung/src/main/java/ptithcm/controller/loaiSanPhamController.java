package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.tomcat.util.bcel.Const;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.Entity.ChiTietKMEntity;
import ptithcm.Entity.SanPhamEntity;
import ptithcm.Entity.ThuongHieuEntity;


@Transactional
@Controller
@RequestMapping("/loaisanpham")
public class loaiSanPhamController {

	
	@Autowired
	SessionFactory factory;
	public List<SanPhamEntity> laySanPhamTheoLoai(String loai){
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		//query.setMaxResults(soSanPhamHienThi);
		List<SanPhamEntity> list = query.list();
		return list;
	}
	
	public List<SanPhamEntity> laySanPhamTheoLoaiS(String loai, int soSanPhamHienThi){
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
		Query query = session.createQuery(hql).setParameter("loai", loai);
		query.setMaxResults(soSanPhamHienThi);
		List<SanPhamEntity> list = query.list();
		return list;
	}
	
	
    
	
	@RequestMapping("/{loaiSp}")
	public String main(@PathVariable("loaiSp") String loaiSp, ModelMap model,HttpServletRequest request) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity ORDER BY NEWID()";
		Query query = session.createQuery(hql);
	
		List<SanPhamEntity> list = query.list();
		for(int i=0;i<list.size();i++)
		Hibernate.initialize(list.get(i).getHinhAnhs());
		
		
		 String sql = "FROM ThuongHieuEntity";
	     Query query1 = session.createQuery(sql);
	     List<ThuongHieuEntity> thuongHieulist = query1.list();
	     model.addAttribute("thuongHieuList", thuongHieulist); 
		List<SanPhamEntity> categoryList = laySanPhamTheoLoaiS(loaiSp,6);
		 model.addAttribute("categoryList", categoryList); 
		 model.addAttribute("loaiSp", loaiSp);

		
		return "sanPham/loaiSanPham";
	}

	@RequestMapping(value = "/{loaiSp}", params = "btn-view-all", method = RequestMethod.POST)
	public String xemToanBoSP(@PathVariable("loaiSp") String loaiSp, ModelMap model,HttpServletRequest request) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity ORDER BY NEWID()";
		Query query = session.createQuery(hql);
	
		List<SanPhamEntity> list = query.list();
		for(int i=0;i<list.size();i++)
		Hibernate.initialize(list.get(i).getHinhAnhs());
		
		
		 String sql = "FROM ThuongHieuEntity";
	     Query query1 = session.createQuery(sql);
	     List<ThuongHieuEntity> thuongHieulist = query1.list();
	     model.addAttribute("thuongHieuList", thuongHieulist); 
		List<SanPhamEntity> categoryList = laySanPhamTheoLoai(loaiSp);
		
		 model.addAttribute("categoryList", categoryList); 
		 model.addAttribute("loaiSp", loaiSp);

		
		return "sanPham/locSanPham";
	}

	//BO LOC
	@RequestMapping(value = "/{loaiSp}",params = "btnApply", method = RequestMethod.POST)
	public String locSanPham(@PathVariable("loaiSp") String loaiSp, ModelMap model,
	                   HttpServletRequest request, @RequestParam(value="brands", required=false) List<String> brandsList,
	                   @RequestParam(value="minPrice", defaultValue="0") int minPrice, @RequestParam(value="maxPrice", defaultValue="999999999") int maxPrice)
	               //    @RequestParam(value="rating", required=false) Integer rating) 
	                   {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loaiSp ";
	    if (brandsList != null && !brandsList.isEmpty()) {
	        hql += "AND sp.thuongHieu.tenThuongHieu IN :brandsList ";
	    }
	    if (minPrice >= 0 && maxPrice >=0) {
	        hql += "AND sp.donGia >= :minPrice AND sp.donGia <= :maxPrice ";
	    }
//	    if (rating != null && rating > 0) {
//	        hql += "AND ROUND(AVG(danhGiaEntity.soSao), 0) = :rating ";
//	    }
	    hql += "ORDER BY NEWID()";
	    Query query = session.createQuery(hql).setParameter("loaiSp", loaiSp);
	    if (brandsList != null && !brandsList.isEmpty()) {
	        query.setParameterList("brandsList", brandsList);
	    }
	    if (minPrice >=0 && maxPrice >=0) {
	        query.setParameter("minPrice", minPrice).setParameter("maxPrice", maxPrice);
	    }
//	    if (rating != null && rating > 0) {
//	        query.setParameter("rating", rating);
//	    }

	    List<SanPhamEntity> categoryList = query.list();
	    for (int i = 0; i < categoryList.size(); i++) {
	        Hibernate.initialize(categoryList.get(i).getHinhAnhs());
	    }
	    
	   

	    String sql = "FROM ThuongHieuEntity";
	    Query query1 = session.createQuery(sql);
	    List<ThuongHieuEntity> thuongHieuList = query1.list();
	    model.addAttribute("thuongHieuList", thuongHieuList);
	    model.addAttribute("categoryList", categoryList);
	    model.addAttribute("selectedBrands", brandsList);
	    model.addAttribute("minPrice", minPrice);
	    model.addAttribute("maxPrice", maxPrice);
	    //model.addAttribute("selectedRating", rating);
	    if (categoryList.isEmpty()) {
	       	 model.addAttribute("message", "Hiện không có sản phẩm cần tìm");
	       	return "sanPham/locSanPham";
	       	}
	    return "sanPham/locSanPham";
	}


	
	
//	
//	    @RequestMapping("/{loaiSp}")
//	    public String main(@PathVariable("loaiSp") String loaiSp, ModelMap model,
//	                       @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
//	        Session session = factory.getCurrentSession();
//	        String countHql = "SELECT COUNT(*) FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
//	        Query countQuery = session.createQuery(countHql).setParameter("loai", loaiSp);
//	        Long countResult = (Long) countQuery.uniqueResult();
//
//	        int pageSize = 6;
//	        int pageCount = (int) Math.ceil((double) countResult / pageSize);
//
//	        String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ORDER BY sp.maSP DESC";
//	        Query query = session.createQuery(hql)
//	                .setParameter("loai", loaiSp)
//	                .setFirstResult((page - 1) * pageSize)
//	                .setMaxResults(pageSize);
//
//	        List<SanPhamEntity> list = query.list();
//	        for (int i = 0; i < list.size(); i++) {
//	            Hibernate.initialize(list.get(i).getHinhAnhs());
//	        }
//
//	        String sql = "FROM ThuongHieuEntity";
//	        Query query1 = session.createQuery(sql);
//	        List<ThuongHieuEntity> thuongHieulist = query1.list();
//	        model.addAttribute("thuongHieuList", thuongHieulist);
//	        model.addAttribute("categoryList", list);
//	        model.addAttribute("loaiSp", loaiSp);
//	        model.addAttribute("pageCount", pageCount);
//	        model.addAttribute("currentPage", page);
//
//	        return "sanPham/loaiSanPham";
//	    }

//	
//	public List<SanPhamEntity> laySanPhamTheoTrang(String loai, int pageNumber, int pageSize) {
//	    Session session = factory.getCurrentSession();
//	    String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
//	    Query query = session.createQuery(hql).setParameter("loai", loai);
//	    int startPosition = (pageNumber - 1) * pageSize;
//	    query.setFirstResult(startPosition);
//	    query.setMaxResults(pageSize);
//	    List<SanPhamEntity> list = query.list();
//	    return list;
//	}
//
//	@RequestMapping("/{loaiSp}")
//	public String main(@PathVariable("loaiSp") String loaiSp, ModelMap model, HttpServletRequest request) {
//	    Session session = factory.getCurrentSession();
//	    String hql = "FROM SanPhamEntity ORDER BY NEWID()";
//	    Query query = session.createQuery(hql);
//	    List<SanPhamEntity> list = query.list();
//	    for (int i = 0; i < list.size(); i++)
//	        Hibernate.initialize(list.get(i).getHinhAnhs());
//
//	    String sql = "FROM ThuongHieuEntity";
//	    Query query1 = session.createQuery(sql);
//	    List<ThuongHieuEntity> thuongHieulist = query1.list();
//	    model.addAttribute("thuongHieuList", thuongHieulist);
//
//	    int pageNumber = 1;
//	    int pageSize = 6;
//	    String pageNumberStr = request.getParameter("pageNumber");
//	    if (pageNumberStr != null) {
//	        pageNumber = Integer.parseInt(pageNumberStr);
//	    }
//
//	    List<SanPhamEntity> categoryList = laySanPhamTheoTrang(loaiSp, pageNumber, pageSize);
//
//	    model.addAttribute("categoryList", categoryList);
//	    model.addAttribute("currentPage", pageNumber);
//	    model.addAttribute("totalPages", Math.ceil((double) categoryList.size() / pageSize));
//	    model.addAttribute("loaiSp", loaiSp);
//
//	    return "sanPham/nhaploaiSP";
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	public List<SanPhamEntity> locSanPhamTheoThuongHieuVaGia(String loai, List<String> ThuongHieu, double giaTu, double giaDen){
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
		if(!ThuongHieu.isEmpty()) {
			hql += " AND sp.tenThuongHieu IN :ThuongHieu ";
		}
		if(giaTu > 0) {
			hql += " AND sp.gia >= :giaTu ";
		}
		if(giaDen > 0) {
			hql += " AND sp.gia <= :giaDen ";
		}
		Query query = session.createQuery(hql).setParameter("loai", loai);
		if(!ThuongHieu.isEmpty()) {
			query.setParameter("idThuongHieu", ThuongHieu);
		}
		if(giaTu > 0) {
			query.setParameter("giaTu", giaTu);
		}
		if(giaDen > 0) {
			query.setParameter("giaDen", giaDen);
		}
		List<SanPhamEntity> list = query.list();
		return list;
	}
	
	
	
	
	public List<SanPhamEntity> laySanPhamTheoThuongHieu(String loai, List<Integer> thuongHieuIds) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
	    if (thuongHieuIds != null && thuongHieuIds.size() > 0) {
	        hql += "AND sp.thuongHieuEntity.id IN (:thuongHieuIds) ";
	    }
	    Query query = session.createQuery(hql)
	        .setParameter("loai", loai);
	    if (thuongHieuIds != null && thuongHieuIds.size() > 0) {
	        query.setParameterList("thuongHieuIds", thuongHieuIds);
	    }
	    List<SanPhamEntity> list = query.list();
	    return list;
	}

	
	//loc theo gia
	
	public List<SanPhamEntity> laySanPhamTheoGia(String loai, Integer giaMin, Integer giaMax) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
	    if (giaMin != null) {
	        hql += "AND sp.gia >= :giaMin ";
	    }
	    if (giaMax != null) {
	        hql += "AND sp.gia <= :giaMax ";
	    }
	    Query query = session.createQuery(hql)
	        .setParameter("loai", loai);
	    if (giaMin != null) {
	        query.setParameter("giaMin", giaMin);
	    }
	    if (giaMax != null) {
	        query.setParameter("giaMax", giaMax);
	    }
	    List<SanPhamEntity> list = query.list();
	    return list;
	}


	
	//loc theo danh gia so sao
	public List<SanPhamEntity> laySanPhamTheoDanhGia(String loai, Integer soSao) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM SanPhamEntity sp WHERE sp.loaiSanPham.maLoai = :loai ";
	    if (soSao != null) {
	        hql += "AND sp.danhGia.sao = :soSao ";
	    }
	    Query query = session.createQuery(hql)
	        .setParameter("loai", loai);
	    if (soSao != null) {
	        query.setParameter("soSao", soSao);
	    }
	    List<SanPhamEntity> list = query.list();
	    return list;
	}


}
	

	
