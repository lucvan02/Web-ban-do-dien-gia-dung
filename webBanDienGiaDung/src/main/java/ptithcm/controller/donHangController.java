package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class donHangController{
	
	@RequestMapping("donHang")
	public String donHang() {
		return "/donHang/donHang";
		
		
	}
	
	
}