package com.springprj.svapp.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.springprj.svapp.entity.ProductHotel;

public class ProductService {
	private String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private String uid = "system";
	private String pwd = "1234";
	private String driver = "oracle.jdbc.driver.OracleDriver";
	
	//메인메뉴 인덱스 호텔 가져오기
	public List<ProductHotel> getIndexHotel() throws ClassNotFoundException, SQLException{
		
		String sql="select * from sb_hotel where HOTELBEST=1";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		List<ProductHotel> list = new ArrayList<ProductHotel>();
		
		while(rs.next()) {
			int hotelId = rs.getInt("HOTELID");
			String hotelName = rs.getString("HOTELNAME");
			String hotelAdd = rs.getString("HOTELADD");
			int hotelPrice = rs.getInt("HOTELPRICE");
			int hotelLimit = rs.getInt("HOTELLIMIT");
			String hotelImg = rs.getString("HOTELIMG");
			int hotelBest = rs.getInt("HOTELBEST");
			String hotelSection = rs.getString("HOTELSECTION");
			
			ProductHotel productHotel = new ProductHotel(
								hotelId, 
								hotelName, 
								hotelAdd, 
								hotelPrice, 
								hotelLimit, 
								hotelImg, 
								hotelBest,
								hotelSection
					);
			
			list.add(productHotel);
			
//			ProductHotel dto = new ProductHotel();
//			dto.setHotelId(rs.getInt("HOTELID"));
//			dto.setHotelName(rs.getString("HOTELNAME"));
//			dto.setHotelAdd(rs.getString("HOTELADD"));
//			dto.setHotelPrice(rs.getInt("HOTELPRICE"));
//			dto.setHotelLimit(rs.getInt("HOTELLIMIT"));
//			dto.setHotelImg(rs.getString("HOTELIMG"));
//			dto.setHotelBest(rs.getInt("HOTELBEST"));
//			list.add(dto);			
		}
		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	//호텔 리스트 출력하기
	public List<ProductHotel> getHotelList(String field, String query, int page, String searchOption){
		
		String sql = "SELECT * FROM " + 
				"(SELECT rownum N, H.* FROM " + 
				"(SELECT * FROM sb_hotel WHERE HOTELNAME LIKE ? AND " +
				field + " LIKE ? " +
				"ORDER BY HOTELID DESC) H) " + 
				"WHERE N BETWEEN ? AND ? ";
		
		List<ProductHotel> list = new ArrayList<>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, uid, pwd);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setString(2, "%"+searchOption+"%");
			st.setInt(3, ((page-1)*9)+1);
			st.setInt(4, page*9);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				int hotelId = rs.getInt("HOTELID");
				String hotelName = rs.getString("HOTELNAME");
				String hotelAdd = rs.getString("HOTELADD");
				int hotelPrice = rs.getInt("HOTELPRICE");
				int hotelLimit = rs.getInt("HOTELLIMIT");
				String hotelImg = rs.getString("HOTELIMG");
				int hotelBest = rs.getInt("HOTELBEST");
				String hotelSection = rs.getString("HOTELSECTION");
				
				ProductHotel productHotel = new ProductHotel(
									hotelId, 
									hotelName, 
									hotelAdd, 
									hotelPrice, 
									hotelLimit, 
									hotelImg, 
									hotelBest,
									hotelSection
						);
				
				list.add(productHotel);
			}
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//전체 호텔갯수 알아내기
	public int getTotalCountHotel() {
		int count = 0;
		String sql = "SELECT count(HOTELID) count FROM sb_hotel";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, uid, pwd);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			if(rs.next())
				count = rs.getInt("COUNT");
		
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	//검색한 호텔 갯수 알아내기
	public int getSearchCountHotel(String query, String field, String searchOption) {
		int count = 0;
		
		String sql = "SELECT COUNT(HOTELID) count FROM sb_hotel WHERE HOTELNAME LIKE ? AND " +
				field + " LIKE ? ";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, uid, pwd);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setString(2, "%"+searchOption+"%");
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
				count = rs.getInt("COUNT");
		
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	//호텔 디테일 페이지 정보 불러오기
	public ProductHotel getDetailHotel(int no) throws ClassNotFoundException, SQLException{
		ProductHotel productHotel = null;
		
		String sql="select * from sb_hotel where HOTELID = ?";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, uid, pwd);
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, no);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			int hotelId = rs.getInt("HOTELID");
			String hotelName = rs.getString("HOTELNAME");
			String hotelAdd = rs.getString("HOTELADD");
			int hotelPrice = rs.getInt("HOTELPRICE");
			int hotelLimit = rs.getInt("HOTELLIMIT");
			String hotelImg = rs.getString("HOTELIMG");
			int hotelBest = rs.getInt("HOTELBEST");
			String hotelSection = rs.getString("HOTELSECTION");
			 
			productHotel = new ProductHotel(
								hotelId, 
								hotelName, 
								hotelAdd, 
								hotelPrice, 
								hotelLimit, 
								hotelImg, 
								hotelBest,
								hotelSection
					);
		}
				
		rs.close();
		st.close();
		con.close();
		
		return productHotel;
	}
	
	

}
