package com.leebx.dao;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class BaseDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private List params = new ArrayList();// ��ʾSQL�Ĳ���

	public void setParams(List params) {
		this.params = params;
	}

	private void setPreparedStatement() {
		for (int i = 0; i < params.size(); i++) {
			try {
				pstmt.setObject(i + 1, params.get(i));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// �������ݿ�
	public Connection getConnection() {
		try {
			InputStream in = this.getClass().getResourceAsStream(
					"/db.properties");
			Properties prop = new Properties();
			prop.load(in);
			Class.forName(prop.getProperty("driver"));
			return DriverManager.getConnection(prop.getProperty("url"),
					prop.getProperty("user"), prop.getProperty("password"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	// ��ɾ��
	public int update(String sql) {
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			this.setPreparedStatement();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			params.clear();
			close();
		}
	}

	// ���÷�������ѯ����
	public List query(String sql, Class cls) {
		List list = new ArrayList();
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			this.setPreparedStatement();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Object obj = cls.newInstance();
				Field[] fs = cls.getDeclaredFields();
				for (Field f : fs) {
					Method m = cls.getDeclaredMethod("set"
							+ f.getName().substring(0, 1).toUpperCase()
							+ f.getName().substring(1), f.getType());
					m.invoke(obj, rs.getObject(f.getName()));
				}
				list.add(obj);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			params.clear();
			this.close();
		}
		return list;
	}

	// �ر���Դ
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}