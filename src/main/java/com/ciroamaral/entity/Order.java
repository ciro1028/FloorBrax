package com.ciroamaral.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
	
	@Id
	@Column(name="order_num")
	private String orderNum;
	@Column(name="installer_id")
	private String installerId;
	@Column(name="description")
	private String description;
	@Column(name="date")
	private String date;
	@Column(name="extras")
	private String extras;
	@Column(name="status")
	private String status;
	@Column(name="subdivision_id")
	private String subdivisionId;
	@Column(name="picture")
	private String picture;
	@Column(name="services")
	private String services;
	@Column(name="extra_price")
	private int extraPrice;
	@Column(name="total")
	private int total;
	@Column(name="to_pay")
	private int toPay;
	@Column(name="square_footage")
	private int squareFootage;
	@Column(name="square_footage_ditra")
	private int squareFootageDitra;
	@Column(name="square_footage_hardwood")
	private int squareFootageHarwood;
	@Column(name="user_id")
	private String userId;
	@Column(name="date_added")
	private String dateAdded;

	public Order() {

	}

	public Order(String orderNum, String installerId, String description, String date, String extras, String status,
			String subdivisionId, String picture, String services, int extraPrice, int total, int toPay, int squareFootage,
			int squareFootageDitra, int squareFootageHarwood, String userId, String dateAdded) {
		this.orderNum = orderNum;
		this.installerId = installerId;
		this.description = description;
		this.date = date;
		this.extras = extras;
		this.status = status;
		this.subdivisionId = subdivisionId;
		this.picture = picture;
		this.services = services;
		this.extraPrice = extraPrice;
		this.total = total;
		this.toPay = toPay;
		this.squareFootage = squareFootage;
		this.squareFootageDitra = squareFootageDitra;
		this.squareFootageHarwood = squareFootageHarwood;
		this.userId = userId;
		this.dateAdded = dateAdded;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getInstallerId() {
		return installerId;
	}

	public void setInstallerId(String installerId) {
		this.installerId = installerId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getExtras() {
		return extras;
	}

	public void setExtras(String extras) {
		this.extras = extras;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSubdivisionId() {
		return subdivisionId;
	}

	public void setSubdivisionId(String subdivisionId) {
		this.subdivisionId = subdivisionId;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public int getExtraPrice() {
		return extraPrice;
	}

	public void setExtraPrice(int extraPrice) {
		this.extraPrice = extraPrice;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getToPay() {
		return toPay;
	}

	public void setToPay(int toPay) {
		this.toPay = toPay;
	}

	public int getSquareFootage() {
		return squareFootage;
	}

	public void setSquareFootage(int squareFootage) {
		this.squareFootage = squareFootage;
	}

	public int getSquareFootageDitra() {
		return squareFootageDitra;
	}

	public void setSquareFootageDitra(int squareFootageDitra) {
		this.squareFootageDitra = squareFootageDitra;
	}

	public int getSquareFootageHarwood() {
		return squareFootageHarwood;
	}

	public void setSquareFootageHarwood(int squareFootageHarwood) {
		this.squareFootageHarwood = squareFootageHarwood;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}

}
