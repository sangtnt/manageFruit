<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<form action="/category/addCat" method="POST">
		<div class="form-group">
			<label>Tên danh mục</label> <input name="catName" type="text"
				class="form-control" id="exampleInputEmail1" required>
		</div>
		<button type="submit" class="btn btn-primary">Hoàn tất</button>
		<a href="/category"><button type="button" class="btn btn-danger">Hủy</button></a>
	</form>
</div>
<!-- /.container-fluid -->