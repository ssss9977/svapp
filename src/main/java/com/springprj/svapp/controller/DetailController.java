package com.springprj.svapp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springprj.svapp.entity.Pager;
import com.springprj.svapp.entity.ProductHotel;
import com.springprj.svapp.service.ProductService;

public class DetailController implements Controller {
	
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Detail 컨트롤러 실행");
		
		
		//디테일페이지 정보출력
		int no=0;
		String no_ = request.getParameter("no");
		if(no_ != null || no_.equals(""))
			no = Integer.parseInt(no_);
		System.out.println("no=" + no);
		
		ProductHotel dto = productService.getDetailHotel(no);
		String hotelname = dto.getHotelName();
		String hotelimg = dto.getHotelImg();
		String hotelsection = dto.getHotelSection();
		String hoteladd = dto.getHotelAdd();
		int hotelprice = dto.getHotelPrice();
		int hotellimit = dto.getHotelLimit();
		
		ModelAndView mv = new ModelAndView("/Hotel/hotelDetail");
		//mv.setViewName("/WEB-INF/view/Hotel/hotelDetail.jsp");
		
		mv.addObject("hotelname", hotelname);
		mv.addObject("hotelimg", hotelimg);
		mv.addObject("hotelsection", hotelsection);
		mv.addObject("hoteladd", hoteladd);
		mv.addObject("hotelprice", hotelprice);
		mv.addObject("hotellimit", hotellimit);
		
		
		return mv;
	}
	
}
