<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12 col-sm-12 order-detail">
			<div class="order-title">
				<h2>Mã đơn hàng #${order.id }</h2>
			</div>
			<div class="order-date">Ngày tạo: ${order.getCreateDateFormat('dd/MM/yyyy:HH:mm:ss')}</div>
			<div class="order-date">Địa chỉ: ${order.user.address}</div>
			<div class="order-date">Số điẹn thoại khách hàng: ${order.user.phone}</div>
		</div>
	</div>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Khách hàng:
				${order.user.fullname }</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Tổng</th>
						</tr>
					</thead>
					<tfoot class="order-foot">
						<%-- <tr>
							<td colspan="3" class="order-foot-left">SubTotal:</td>
							<td class="order-foot-right">${order.subTotal }</td>
						</tr>
						<tr>
							<td colspan="3" class="order-foot-left">Discount:</td>
							<td class="order-foot-right">${order.discount }</td>
						</tr>
						<tr>
							<td colspan="3" class="order-foot-left">Additional fees:</td>
							<td class="order-foot-right">${order.additionalFees }</td>
						</tr>
						<tr>
							<td colspan="3" class="order-foot-left">Shipping & Handling:</td>
							<td class="order-foot-right">${order.shipping }</td>
						</tr> --%>
						<tr class="grand-total">
							<td colspan="3" class="order-foot-left">Total:</td>
							<td class="order-foot-right">${order.getTotal() }</td>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="item" items="${order.orderDetails}">
							<tr>
								<td>${item.fruit.name }</td>
								<td>${item.fruit.getPriceFormat() }</td>
								<td>${item.getQuantityFormat() }</td>
								<td>${item.calculateCostFormat() }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
