package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import javafx.fxml.Initializable;

public class CartDAO {
	

	String id = "dbrjsdml";
	String pw = "xptmxm12!";
	String url = "jdbc:mariadb://183.111.138.245:3306/dbrjsdml";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;	
	
	
	//드라이버 연결
	public void getConnet() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
		//선택유저삭제
	public void deleteCart(int num, String user_id) {
		try {
			getConnet();
			//쿼리문 작성
			String sql = "delete from cart where num = ? and user_id = '?'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, user_id);
			pstmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//선택한유저보기
	public  Vector<CartDTO> selectOne(String id) {
		 Vector<CartDTO> list = new Vector<>();
		try {
			getConnet();
			//쿼리문 작성
			String sql = "select * from product natural join cart where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setNum(rs.getInt(1));
				dto.setCategory(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setInfo(rs.getString(4));
				dto.setPrice(rs.getInt(5));
				dto.setMainimg(rs.getString(6));
				dto.setSubimg(rs.getString(7));
				dto.setPricenum(rs.getInt(8));
				dto.setUser_id(rs.getString(9));
			
				list.add(dto);
			}
			conn.close();
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	

	//선택한 아이디가 가지고있는 최종정보를 삽입
	public void cartInsert(int num , int priceNum, String user_id) {
		
		getConnet();
		try {
			//쿼리문 작성
			String sql = "insert into cart values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, priceNum);
			pstmt.setString(3,user_id);
			pstmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
					
	}
	
	
	//선택한 요소 하나만 지우기
	public void cartDeleteOne(String id, int n1, int n2) {
		getConnet();
		try {
			//쿼리문작성
			String sql = "delete from cart where num = ? AND priceNum = ? AND user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n1);
			pstmt.setInt(2, n2);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
			
	public static void main(String [] args) {
		CartDAO a = new CartDAO();
		a.getConnet();
	}
		
}
