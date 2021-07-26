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

public class ConfirmController implements Controller {
	
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("예약확인 실행");

		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		System.out.println("입실일: "+sDate+" "+"퇴실일: "+eDate);
		
		ModelAndView mv = new ModelAndView("/Hotel/confirmPage");
		
		mv.addObject("sDate", sDate);
		mv.addObject("eDate", eDate);
		
		return mv;
	}
	
}
