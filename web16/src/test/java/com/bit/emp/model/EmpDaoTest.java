package com.bit.emp.model;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.bit.util.Mysql;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmpDaoTest {
	Logger log=Logger.getLogger(EmpDaoTest.class);
	
	static EmpDto target;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
//		테스트 전
		EmpDto target=new EmpDto();
		target.setEmpno(10006);
		target.setEname("test2");
		target.setSal(1111);
	}

//	@AfterClass
//	public static void tearDownAfterClass() throws Exception {
////		테스트 끝
//	}
//
//	@Before
//	public void setUp() throws Exception {
////		각 테스트 전
//	}
//
//	@After
//	public void tearDown() throws Exception {
////		각 테스트 후
//	}
	
	@Test
	public void test1GetList() throws SQLException {
		EmpDao dao=new EmpDao();
		assertNotNull(dao.getList());
		assertTrue(dao.getList().size()>0);
		for(EmpDto bean:dao.getList()) log.debug(bean);
		
	}
	
	@Test
	public void test4GetOne() throws SQLException {		
		EmpDao dao=new EmpDao();
		assertNotNull(dao.getOne(target.getEmpno()));
		assertEquals(target.getEname(), dao.getOne(target.getEmpno()).getEname());
		assertTrue(target.getSal()==dao.getOne(target.getEmpno()).getSal());
	}
	
	@Test
	public void test2InsertOne() throws SQLException {
//		Mysql.getConnection().setAutoCommit(false);
		EmpDao dao=new EmpDao();
		assertTrue(dao.insertOne(target));
	}
	
	@Test
	public void test3UpdateOne() throws SQLException {
		target.setEname("test2");
		target.setSal(6666);
		EmpDao dao=new EmpDao();
		assertTrue(dao.updateOne(target)>0);
	}

	@Test
	public void test5DeleteOne() throws SQLException {
		EmpDao dao=new EmpDao();
		assertTrue(dao.deleteOne(target.getDeptno())>0);
	}
	
}
