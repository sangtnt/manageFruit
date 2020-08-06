package com.sauriengmientay.Entity;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "fruit")
public class Fruit {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fruit_id")
	private Long id;

	@Column(name = "name")
	private String name;

//	amount
	@Column(name = "quantity")
	private Long quantity;

//  false is deleted, true is active
	@Column(name = "status")
	private Boolean status;

	@Column(name = "price")
	private Long price;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(mappedBy = "fruit", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<PhieuNhap> phieuNhaps = new ArrayList<>();

	@OneToMany(mappedBy = "fruit", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();

	public Fruit() {
		this.quantity = (long) 0;
		this.status=true;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Long getQuantity() {
		return quantity;
	}

	public Long getPrice() {
		return price;
	}

	public String getQuantityFormat() {
		NumberFormat format = NumberFormat.getIntegerInstance();
		String qty = format.format(quantity);
		return qty;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public String getPriceFormat() {
		Locale.setDefault(new Locale("vi", "VN"));
		NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
		String currency = format.format(price);
		return currency;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<PhieuNhap> getPhieuNhaps() {
		return phieuNhaps;
	}

	public void setPhieuNhaps(List<PhieuNhap> phieuNhaps) {
		this.phieuNhaps = phieuNhaps;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

}
