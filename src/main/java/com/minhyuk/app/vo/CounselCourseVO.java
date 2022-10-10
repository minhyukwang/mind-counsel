package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 상담코스관리(CounselCourseVO) 관련 VO class
 */
public class CounselCourseVO extends CommonVO
{
    String cons_course_id;
    String cons_course_nm;
    String price;
    int total_cons_num;
    
	public int getTotal_cons_num() {
		return total_cons_num;
	}
	public void setTotal_cons_num(int total_cons_num) {
		this.total_cons_num = total_cons_num;
	}
	public String getCons_course_id() {
		return cons_course_id;
	}
	public void setCons_course_id(String cons_course_id) {
		this.cons_course_id = cons_course_id;
	}
	public String getCons_course_nm() {
		return cons_course_nm;
	}
	public void setCons_course_nm(String cons_course_nm) {
		this.cons_course_nm = cons_course_nm;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

}
