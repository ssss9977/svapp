package com.springprj.svapp.entity;

public class Pager {
	private int page;
	private int startNum;
	private int endNum;
	private int pStart;
	private int pEnd;
	private int totalCount;
	private int pageCount;
	
	private String query; 
	private String field;
	
	public Pager() {
		
	}


	public Pager(int page, int totalCount, String query, String field) {
		this.page = page;
		this.totalCount = totalCount;
		this.query = query;
		this.field = field;
		setRange();
	}

	public void setRange() {
		if(totalCount%9 == 0)
			pageCount = (totalCount/9);
		else
			pageCount = (totalCount/9)+1;
		
		startNum = ((page-1)*9)+1;
		endNum = (page*9);
		pStart = page-((page-1)%5);
		pEnd = pStart+4;
		if(pEnd > pageCount)
			pEnd = pageCount;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getStartNum() {
		return startNum;
	}


	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}


	public int getEndNum() {
		return endNum;
	}


	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}


	public int getpStart() {
		return pStart;
	}


	public void setpStart(int pStart) {
		this.pStart = pStart;
	}


	public int getpEnd() {
		return pEnd;
	}


	public void setpEnd(int pEnd) {
		this.pEnd = pEnd;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public String getQuery() {
		return query;
	}


	public void setQuery(String query) {
		this.query = query;
	}


	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}

	


	
	
}
