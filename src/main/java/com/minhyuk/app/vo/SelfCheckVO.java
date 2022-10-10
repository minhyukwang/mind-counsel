package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 자가검진(self_check) 관련 VO class
 */
public class SelfCheckVO extends CommonVO
{
	String check_id;
	String check_name;
	String appr1;
	String appr2;
	String appr3;
	String appr4;
	String appr5;
	String appr_contents1;
	String appr_contents2;
	String appr_contents3;
	String appr_contents4;
	String appr_contents5;
	String check_explain;
	public String getCheck_id() {
		return check_id;
	}
	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}
	public String getCheck_name() {
		return check_name;
	}
	public void setCheck_name(String check_name) {
		this.check_name = check_name;
	}
	public String getAppr1() {
		return appr1;
	}
	public void setAppr1(String appr1) {
		this.appr1 = appr1;
	}
	public String getAppr2() {
		return appr2;
	}
	public void setAppr2(String appr2) {
		this.appr2 = appr2;
	}
	public String getAppr3() {
		return appr3;
	}
	public void setAppr3(String appr3) {
		this.appr3 = appr3;
	}
	public String getAppr4() {
		return appr4;
	}
	public void setAppr4(String appr4) {
		this.appr4 = appr4;
	}
	public String getAppr5() {
		return appr5;
	}
	public void setAppr5(String appr5) {
		this.appr5 = appr5;
	}
	public String getAppr_contents1() {
		return appr_contents1;
	}
	public void setAppr_contents1(String appr_contents1) {
		this.appr_contents1 = appr_contents1;
	}
	public String getAppr_contents2() {
		return appr_contents2;
	}
	public void setAppr_contents2(String appr_contents2) {
		this.appr_contents2 = appr_contents2;
	}
	public String getAppr_contents3() {
		return appr_contents3;
	}
	public void setAppr_contents3(String appr_contents3) {
		this.appr_contents3 = appr_contents3;
	}
	public String getAppr_contents4() {
		return appr_contents4;
	}
	public void setAppr_contents4(String appr_contents4) {
		this.appr_contents4 = appr_contents4;
	}
	public String getAppr_contents5() {
		return appr_contents5;
	}
	public void setAppr_contents5(String appr_contents5) {
		this.appr_contents5 = appr_contents5;
	}
	public String getCheck_explain() {
		return check_explain;
	}
	public void setCheck_explain(String check_explain) {
		this.check_explain = check_explain;
	}
	
}
