package com.bit.module01.mysql;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class BitMysqlTest {

	@Test
	public void testGetConnection() throws ClassNotFoundException, SQLException {
        Connection conn=BitMysql.getConnection();
//        junit 에서 제공
//        if(conn==null) fail("Not yet implemented");
        assertNotNull("is null",conn);
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}	
