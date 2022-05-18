package com.bit.module01.mysql;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.*;

import org.apache.log4j.Logger;
import org.junit.Test;

public class BitEmpTest {
	Logger log=Logger.getLogger(this.getClass());

	@Test
	public void testGetList() throws ClassNotFoundException, SQLException {
		BitEmp emp=new BitEmp();
		ArrayList<EmpBean> list=(ArrayList<EmpBean>) emp.getList();
//		개선된 루프문1.7~, 제네릭 필수
//		for(EmpBean bean : list) log.debug(bean);
//		String[] msgs= {"item1","item2","item3","item4"};
//		for(String msg: msgs) log.debug(msg);
		HashSet<EmpBean> set=new HashSet<>(list);
		for(EmpBean bean:set) log.debug(bean);
		
		
		
//		for (int i = 0; i < list.size();i++) {
//			log.debug(list.get(i));
//		}
		assertNotNull(list);
		assertTrue(list.size()>0);
	}

}
