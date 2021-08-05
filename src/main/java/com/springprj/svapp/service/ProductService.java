package com.springprj.svapp.service;

import java.sql.SQLException;
import java.util.List;

import com.springprj.svapp.entity.ProductHotel;

public interface ProductService {

	//���θ޴� �ε��� ȣ�� ��������
	List<ProductHotel> getIndexHotel() throws ClassNotFoundException, SQLException;
	
	//ȣ�� ����Ʈ ����ϱ�
	List<ProductHotel> getHotelList(String field, String query, int page, String searchOption);

	//��ü ȣ�ڰ��� �˾Ƴ���
	int getTotalCountHotel();
	
	//�˻��� ȣ�� ���� �˾Ƴ���
	int getSearchCountHotel(String query, String field, String searchOption);
	
	//ȣ�� ������ ������ ���� �ҷ�����
	ProductHotel getDetailHotel(int no) throws ClassNotFoundException, SQLException;

}
