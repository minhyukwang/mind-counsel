package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 자가검진 질문(self_check_qu) 관련 VO class
 */
public class SelfCheckQuVO extends CommonVO
{
	String check_id;
	int qu_seq;
	String qu;
	public String getCheck_id() {
		return check_id;
	}
	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}
	public int getQu_seq() {
		return qu_seq;
	}
	public void setQu_seq(int qu_seq) {
		this.qu_seq = qu_seq;
	}
	public String getQu() {
		return qu;
	}
	public void setQu(String qu) {
		this.qu = qu;
	}
	
	
}
