package com.springprj.svapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springprj.svapp.entity.ProductHotel;
import com.springprj.svapp.service.ProductService;

public class IndexController implements Controller {
	
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Index 컨트롤러 성공");
		ModelAndView mv = new ModelAndView("index");
		//mv.setViewName("/WEB-INF/view/index.jsp");
		List<ProductHotel> list = productService.getIndexHotel();
		
		mv.addObject("list", list);
		
		
		return mv;
	}
	
}
