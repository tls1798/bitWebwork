package com.bit.module01.mysql;

public class EmpBean {
//	javaBean class (web -> DTO, framwork -> VO, database -> Entry)
//	정보의 이동수단
	private int empno;
	private String ename;
	private int sal;
//	getter & setter
//	sorce -> genetater
//	첫글자 대문자
//	get필드()
//	set필드()
//	return type boolean -> is필드()
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEname() {
		return ename;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getSal() {
		return sal;
	}
	
	@Override
	public String toString() {
	      return "empno:"+empno+",ename:"+ename+",sal:"+sal;
	}
	
}
