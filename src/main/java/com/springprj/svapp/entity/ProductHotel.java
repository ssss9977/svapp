package com.springprj.svapp.entity;

public class ProductHotel {
	private int hotelId;
	private String hotelName;
	private String hotelAdd;
	private int hotelPrice;
	private int hotelLimit;
	private String hotelImg;
	private int hotelBest;
	private String hotelSection;
	
	public ProductHotel() {
		
	}


	public ProductHotel(int hotelId, String hotelName, String hotelAdd, int hotelPrice, int hotelLimit, String hotelImg,
			int hotelBest, String hotelSection) {
		super();
		this.hotelId = hotelId;
		this.hotelName = hotelName;
		this.hotelAdd = hotelAdd;
		this.hotelPrice = hotelPrice;
		this.hotelLimit = hotelLimit;
		this.hotelImg = hotelImg;
		this.hotelBest = hotelBest;
		this.hotelSection = hotelSection;
	}


	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelAdd() {
		return hotelAdd;
	}

	public void setHotelAdd(String hotelAdd) {
		this.hotelAdd = hotelAdd;
	}

	public int getHotelPrice() {
		return hotelPrice;
	}

	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}

	public int getHotelLimit() {
		return hotelLimit;
	}

	public void setHotelLimit(int hotelLimit) {
		this.hotelLimit = hotelLimit;
	}

	public String getHotelImg() {
		return hotelImg;
	}

	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}

	public int getHotelBest() {
		return hotelBest;
	}

	public void setHotelBest(int hotelBest) {
		this.hotelBest = hotelBest;
	}


	public String getHotelSection() {
		return hotelSection;
	}


	public void setHotelSection(String hotelSection) {
		this.hotelSection = hotelSection;
	}
	
	
	
}
