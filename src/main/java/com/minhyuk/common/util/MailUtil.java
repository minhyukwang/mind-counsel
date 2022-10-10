package com.minhyuk.common.util;

import org.apache.commons.mail.HtmlEmail;

/**
 * Mail 관련 유틸 class
 */
public class MailUtil
{
	public static void sendMail(String email, String subject, String msg) throws Exception
	{
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "testfunny123";
		String hostSMTPpwd = "testfunny1!";

		// 보내는 사람
		String fromEmail = "testfunny123@naver.com";
		String fromName = "funnyfunny";

		// email 전송
		try
		{
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);

			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
