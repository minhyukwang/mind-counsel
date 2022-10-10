package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 결제정보(PayInfo) 관련 VO class
 */
public class PayInfoVO extends CommonVO
{
	int pay_seq;
    String mem_id;
    String pg;
    String pay_method;
    String imp_uid;
    String merchant_uid;
    String paid_amount;
    String apply_num;
    String verif_comp_yn;
    String manager_id;
    String refund_yn;
    
   	public String getRefund_yn() {
   		return refund_yn;
   	}
   	public void setRefund_yn(String refund_yn) {
   		this.refund_yn = refund_yn;
   	}
	public int getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(String paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getVerif_comp_yn() {
		return verif_comp_yn;
	}
	public void setVerif_comp_yn(String verif_comp_yn) {
		this.verif_comp_yn = verif_comp_yn;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
    
}