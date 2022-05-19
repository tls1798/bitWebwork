package com.bit.dept.model;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class DeptDaoTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
//		테스트 전
		System.out.println("setUpBeforeClass");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
//		테스트 끝
		System.out.println("tearDownAfterClass");
	}

	@Before
	public void setUp() throws Exception {
//		테스트 전
		System.out.println("setUp");
	}

	@After
	public void tearDown() throws Exception {
//		테스트후
		System.out.println("tearDown");
	}

	@Test
	public void testCreate() {
		System.out.println("testCreate");
	}

	@Test
	public void testRead() {
		System.out.println("testRead");
	}

	@Test
	public void testUpdate() {
		System.out.println("testUpdate");
	}

	@Test
	public void testDelete() {
		System.out.println("testDelete");
	}

}
