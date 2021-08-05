package com.springprj.svapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springprj.svapp.entity.Pager;
import com.springprj.svapp.entity.ProductHotel;
import com.springprj.svapp.service.jdbc.JDBCProductService;

public class HotelController implements Controller {
	
	@Autowired
	private JDBCProductService productService;
	
//	public void setProductService(JDBCProductService productService) {
//		this.productService = productService;
//	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Hotel 컨트롤러 실행");

		String query="", field = "HOTELSECTION", searchOption = "";
		String q_ = request.getParameter("hotelname");
		String p_ = request.getParameter("page");
		String s_ = request.getParameter("hotelType");
		if(q_ != null && !q_.equals(""))
			query = q_;
		if(s_.equals("호텔"))
			searchOption = "호텔";
		else if(s_.equals("리조트"))
			searchOption = "리조트";
		
		int page = 1;
		if(p_ != null && !p_.equals("")) {
			page = Integer.parseInt(p_);
		}
		
		int totalCount = productService.getTotalCountHotel();
		int searchCount = productService.getSearchCountHotel(query, field, searchOption);
		
		
		//pager
//		Pager pager = new Pager(page, totalCount, query, field);
		int pageCount;
		if(totalCount%9 == 0)
			pageCount = (totalCount/9);
		else
			pageCount = (totalCount/9)+1;

		int startNum, endNum, pStart, pEnd;
		startNum = ((page-1)*9)+1;
		endNum = (page*9);
		pStart = page-((page-1)%5);
		pEnd = pStart+4;
		if(pEnd > pageCount)
			pEnd = pageCount;
		
		//검색쿼리받기
//		String priceType ="on", hotelType = "on";
//		String pt = request.getParameter("priceType");
//		String ht = request.getParameter("hotelType");
//		if(pt != null && !pt.equals(""))
//			priceType = pt;
//		if(ht != null && !ht.equals(""))
//			hotelType = ht;
//		System.out.println("가격별:"+priceType);
//		System.out.println("타입별:"+hotelType);
		
		
		ModelAndView mv = new ModelAndView("/Hotel/hotelList");
		//mv.setViewName("/WEB-INF/view/Hotel/hotelList.jsp");
		List<ProductHotel> list = productService.getHotelList(field, query, page, searchOption);
		System.out.println("쿼리는 "+query);
		
		System.out.println("검색카운트: " + searchCount);
		
		mv.addObject("page", page);
		mv.addObject("pageCount", pageCount);
		mv.addObject("searchCount", searchCount);
		mv.addObject("totalCount", totalCount);
		mv.addObject("startNum", startNum);
		mv.addObject("endNum", endNum);
		mv.addObject("pStart", pStart);
		mv.addObject("pEnd", pEnd);
		mv.addObject("searchOption", searchOption);
//		mv.addObject("pager", pager);
		
		mv.addObject("list", list);
		
		
		return mv;
	}
	
}
