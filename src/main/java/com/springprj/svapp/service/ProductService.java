package com.springprj.svapp.service;

import java.sql.SQLException;
import java.util.List;

import com.springprj.svapp.entity.ProductHotel;

public interface ProductService {

	//메인메뉴 인덱스 호텔 가져오기
	List<ProductHotel> getIndexHotel() throws ClassNotFoundException, SQLException;
	
	//호텔 리스트 출력하기
	List<ProductHotel> getHotelList(String field, String query, int page, String searchOption);

	//전체 호텔갯수 알아내기
	int getTotalCountHotel();
	
	//검색한 호텔 갯수 알아내기
	int getSearchCountHotel(String query, String field, String searchOption);
	
	//호텔 디테일 페이지 정보 불러오기
	ProductHotel getDetailHotel(int no) throws ClassNotFoundException, SQLException;

}
