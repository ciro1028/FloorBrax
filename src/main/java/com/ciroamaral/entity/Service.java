package com.ciroamaral.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="services")
public class Service {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="description")
	private String description;
	@Column(name="price")
	private double price;
	@Column(name="to_pay")
	private double toPay;
	@Column(name="price_per_sqf")
	private double pricePerSqft;
	@Column(name="price_per_sqf_paid")
	private double pricePerSqftPay;
	@Column(name="sqf_ditra")
	private double sqftDitra;
	@Column(name="sqf_ditra_toPay")
	private double sqltDitraPay;

	public Service() {

	}

	public Service(int id, String name, String description, double price, double toPay, double pricePerSqft, double pricePerSqftPay,
			double sqftDitra, double sqltDitraPay) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.toPay = toPay;
		this.pricePerSqft = pricePerSqft;
		this.pricePerSqftPay = pricePerSqftPay;
		this.sqftDitra = sqftDitra;
		this.sqltDitraPay = sqltDitraPay;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getToPay() {
		return toPay;
	}

	public void setToPay(double toPay) {
		this.toPay = toPay;
	}

	public double getPricePerSqft() {
		return pricePerSqft;
	}

	public void setPricePerSqft(double pricePerSqft) {
		this.pricePerSqft = pricePerSqft;
	}

	public double getPricePerSqftPay() {
		return pricePerSqftPay;
	}

	public void setPricePerSqftPay(double pricePerSqftPay) {
		this.pricePerSqftPay = pricePerSqftPay;
	}

	public double getSqftDitra() {
		return sqftDitra;
	}

	public void setSqftDitra(double sqftDitra) {
		this.sqftDitra = sqftDitra;
	}

	public double getSqltDitraPay() {
		return sqltDitraPay;
	}

	public void setSqltDitraPay(double sqltDitraPay) {
		this.sqltDitraPay = sqltDitraPay;
	}
	
	
}
