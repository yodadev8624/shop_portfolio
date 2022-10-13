package com.shop.order.domain;

public class OrderDTO {
	
	private long order_seq;
	private long pd_ct_seq;
	private int pd_count;
	private int pd_size;
	private String member_id;
	
	public long getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(long order_seq) {
		this.order_seq = order_seq;
	}
	public long getPd_ct_seq() {
		return pd_ct_seq;
	}
	public void setPd_ct_seq(long pd_ct_seq) {
		this.pd_ct_seq = pd_ct_seq;
	}
	public int getPd_count() {
		return pd_count;
	}
	public void setPd_count(int pd_count) {
		this.pd_count = pd_count;
	}
	public int getPd_size() {
		return pd_size;
	}
	public void setPd_size(int pd_size) {
		this.pd_size = pd_size;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	
}
