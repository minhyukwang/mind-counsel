package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 카테고리(category) 관련 VO class
 */
public class CategoryVO extends CommonVO
{
	String category_id;
	String category_name;
	int category_seq;
	String category_ex;
	
	
	public String getCategory_ex() {
		return category_ex;
	}
	public void setCategory_ex(String category_ex) {
		this.category_ex = category_ex;
	}
	
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}
}
