package com.minhyuk.common.vo;

/**
 * DB 공통항목 VO
 */
public class CommonVO
{
	private String created_id = "";
	private String created_timestamp = "";
	private String last_up_id = "";
	private String last_up_timestamp = "";
	private String data_end_id = "";
	private String data_end_timestamp = "";
	
	public String getCreated_id()
	{
		return created_id;
	}

	public void setCreated_id(String created_id)
	{
		this.created_id = created_id;
	}

	public String getCreated_timestamp()
	{
		return created_timestamp;
	}

	public void setCreated_timestamp(String created_timestamp)
	{
		this.created_timestamp = created_timestamp;
	}

	public String getLast_up_id()
	{
		return last_up_id;
	}

	public void setLast_up_id(String last_up_id)
	{
		this.last_up_id = last_up_id;
	}

	public String getLast_up_timestamp()
	{
		return last_up_timestamp;
	}

	public void setLast_up_timestamp(String last_up_timestamp)
	{
		this.last_up_timestamp = last_up_timestamp;
	}

	public String getData_end_id()
	{
		return data_end_id;
	}

	public void setData_end_id(String data_end_id)
	{
		this.data_end_id = data_end_id;
	}

	public String getData_end_timestamp()
	{
		return data_end_timestamp;
	}

	public void setData_end_timestamp(String data_end_timestamp)
	{
		this.data_end_timestamp = data_end_timestamp;
	}



}
