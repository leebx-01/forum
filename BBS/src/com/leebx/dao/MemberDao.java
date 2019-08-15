package com.leebx.dao;

import java.util.ArrayList;
import java.util.List;

import com.leebx.entity.Member;

public class MemberDao extends BaseDao {
	// �û���¼
	public List login(String name, String password) {
		String sql = "select * from member where memberName=? and memberPwd=?";
		List params = new ArrayList();
		params.add(name);
		params.add(password);
		super.setParams(params);
		return super.query(sql, Member.class);
	}

	// �û�ע��
	public int register(Member m) {
		String sql = "insert into member values(0,?,?,?,?,0,0,0,now())";
		List params = new ArrayList();
		params.add(m.getMemberName());
		params.add(m.getMemberPwd());
		params.add(m.getMemberIcon());
		params.add(m.getMemberGender());
		super.setParams(params);
		return super.update(sql);
	}
	//��ѯ����
	public List allSearch(){
		String sql="select * from member";
		return super.query(sql, Member.class);
	}
}
