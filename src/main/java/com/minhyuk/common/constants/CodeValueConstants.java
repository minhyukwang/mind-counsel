package com.minhyuk.common.constants;

/**
 * 상수 정의를 위한 인터페이스
 *
 */
public interface CodeValueConstants 
{
	// Flag Y,N
	public final static String FLAG_Y = "Y";	// Y
	public final static String FLAG_N = "N";	// N
	
	public final static String LOGIN = "login";	// 세션정보 MemberVO key 
	public final static String DATA_YN = "data_yn";	// DATA 존재 유무 (Y:존재, N:미존재)
	
	// 로그인코드 Code
	public final static String C_LOGIN_CD_E = "E";	// E-mail
	public final static String C_LOGIN_CD_G = "G";	// Google
	public final static String C_LOGIN_CD_K = "K";	// Kakao
	public final static String C_LOGIN_CD_N = "N";	// Naver
	public final static String C_LOGIN_CD_F = "F";	// Facebook
	// 로그인코드 Value
	public final static String V_LOGIN_CD_E = "E-mail";	
	public final static String V_LOGIN_CD_G = "Google";	
	public final static String V_LOGIN_CD_K = "Kakao";	
	public final static String V_LOGIN_CD_N = "Naver";	
	public final static String V_LOGIN_CD_F = "Facebook";	
	
	// 공개등급 Code
	public final static String C_OPEN_GRADE_E = "E";	// 전체
	public final static String C_OPEN_GRADE_F = "F";	// 친구만
	public final static String C_OPEN_GRADE_N = "N";	// 비공개
	// 공개등급 Value
	public final static String V_OPEN_GRADE_E = "전체";		
	public final static String V_OPEN_GRADE_F = "친구만";	
	public final static String V_OPEN_GRADE_N = "비공개";	
	
	// 로그코드 Code
	public final static String C_LOG_CD_J = "J";	// JOB
	public final static String C_LOG_CD_P = "P";	// 결제
	// 로그코드 Value
	public final static String V_LOG_CD_J = "JOB";	
	public final static String V_LOG_CD_P = "결제";	
	
	// 상담유형 Code
	public final static String C_CO_TYPE_O = "O";	// 온라인상담신청
	public final static String C_CO_TYPE_C = "C";	// 유료답변요청
	public final static String C_CO_TYPE_S = "S";	// 자가검진완료
	// 상담유형 Value
	public final static String V_CO_TYPE_O = "온라인상담신청";	
	public final static String V_CO_TYPE_C = "유료답변요청";	
	public final static String V_CO_TYPE_S = "자가검진완료";	
	
	// 게시판유형 Code
	public final static String C_BOARD_TYPE_T = "T";	// 타임라인 게시판
	public final static String C_BOARD_TYPE_I = "I";	// 멘탈 이슈 게시판
	// 게시판유형 Value
	public final static String V_BOARD_TYPE_T = "타임라인 게시판";	
	public final static String V_BOARD_TYPE_I = "멘탈 이슈 게시판";
	
	// 자가진단 유형 Code
	/*public final static String C_SELF_CHECK_A = "A";	// ADHD 평가척도
	public final static String C_SELF_CHECK_B = "B";	// Reynolds의 자살생각 척도
	public final static String C_SELF_CHECK_C = "C";	// 사건충격척도
	public final static String C_SELF_CHECK_D = "D";	// 강박증 척도
	public final static String C_SELF_CHECK_E = "E";	// 성인 상태 불안 척도
	public final static String C_SELF_CHECK_F = "F";	// 자살생각 척도
*/	// 자가진단 유형 Value
	public final static String V_SELF_CHECK_A = "SC001";	// ADHD 평가척도
	public final static String V_SELF_CHECK_B = "SC002";	// Reynolds의 자살생각 척도
	public final static String V_SELF_CHECK_C = "SC003";	// 사건충격척도
	public final static String V_SELF_CHECK_D = "SC004";	// 강박증 척도
	public final static String V_SELF_CHECK_E = "SC005";	// 성인 상태 불안 척도
	public final static String V_SELF_CHECK_F = "SC006";	// 자살생각 척도
	
}

