package com.bit.module01.mysql;

import java.sql.*;
import java.util.*;

import org.apache.log4j.Logger;

public class BitEmp {
	Logger log=Logger.getLogger(this.getClass());
	

	public ArrayList<?> getList() throws ClassNotFoundException, SQLException{
		ArrayList<EmpBean> list=new ArrayList<>();
		String sql="select empno, ename, sal from emp order by empno desc";
//		try(변수선언)
//		auto close, 1.8~
		try(
				Connection conn=BitMysql.getConnection();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				){
			while(rs.next()) {
				EmpBean bean = new EmpBean();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setSal(rs.getInt("sal"));
				list.add(bean);
				log.debug(bean);
			}
		}
		
		return list;
	}
}
