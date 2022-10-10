package com.minhyuk.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 공통 함수 Util
 *
 */
public class CommonUtil 
{
	
	/**
	 * 입력받은 시간과 현재시간을 비교하여 시간 포맷을 변경하여 리턴하는 함수
	 * 예) 50초 전, 20분 전, 3시간 전, 5일 전 등..
	 * @return
	 * @throws ParseException 
	 */
	public static String getUpTime(String input) throws ParseException
	{

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = transFormat.parse(input);
		Calendar calendar = Calendar.getInstance();
        Date date2 = calendar.getTime();

        long d1 = date1.getTime();
        long d2 = date2.getTime();
        long d3 = (d2- d1) / 1000;
        
        if( d3 < 60 )
        {
        	return d3+"초 전";
        }
        else if( d3 < 3600 )
        {
        	return (int) Math.floor(d3/60) + "분 전";
        }
        else if( d3 < 86400 )
        {
        	return (int) Math.floor(d3/3600) + "시간 전";
        }
        else if( d3 < 604800 )
        {
        	return (int) Math.floor(d3/86400) + "일 전";
        }
        
        return input.substring(0,10);
	}
}
