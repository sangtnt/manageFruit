<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<form action="/category/editCat" method="POST">
		<input name="catId" type="hidden" value="${cat.id }">
		<div class="form-group">
			<label>Tên danh mục</label> <input name="catName" type="text"
				class="form-control" id="exampleInputEmail1" value="${cat.name }">
		</div>
		<button type="submit" class="btn btn-primary">Sửa</button>
		<a href="/admin/category"><button type="button" class="btn btn-danger">Hủy</button></a>
	</form>
</div>
<!-- /.container-fluid -->
