<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="APIurl" value="/api-admin-product"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:url value="/views/admin/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Product Management</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->

<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
<link href="${url}/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">

		<jsp:include page="/views/admin/view/nav-bar.jsp"></jsp:include>

		<!-- /. NAV TOP  -->
		<jsp:include page="/views/admin/view/slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>All Product</h2>
						<h5>You can management product in here</h5>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12">
						<div>
							<a href='<c:url value="/admin-product-list?type=add"/>'>Add</a>
						</div>

						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">Advanced Tables</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID </th>
												<th>Image</th>
												<th>Name</th>
												<th>Price($)</th>
												<th>Detail Category ID</th>
												<th>Description</th>
												<th>Action </th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${proList }" var="pro" >
											<tr class="odd gradeX">
												<td>${pro.id }</td>
<%--													<c:url value="/image?fname=${pro.image }" var="imgUrl"></c:url>--%>
													<td><%--<img height="150" width="200" src="${imgUrl}" />--%></td>

												<td>${pro.productName }</td>
												<td>${pro.price }</td>
												<td>${pro.detailCateId}</td>
												<td>${pro.describePro } </td>
												<td><a
														href="<c:url value='/product/detail?id=${pro.id }'/>"
														class="center">Detail</a> |

													<a href="<c:url value="/admin-product-list?type=edit&id=${pro.id }"/>"
														class="center">Edit</a>	|

<%--													<button name="btnDelete" value="${pro.id}" class="center">Delete</button>--%>
														<a id="btnDelete" href="<c:url value='admin-product-list?id=${pro.id }'/>"
															class="center">Delete</a>



											</tr>
											</c:forEach>
											
											
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>

			</div>

		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
	<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>

	<%--	Delete--%>
	<script>
		$('.btnDelete').click(function (e){
			e.preventDefault();
			var id= parseInt($('#id').val()) ;

			// var productName= $('#productName').val();
			// var price= parseFloat($('#price').val());
			// var describePro= $('#describePro').val();
			//
			// var detailCateId=parseInt($('#detailCateId').val());
			// var image= $('#image').val();
			// console.log(describePro)
			 var data={
			// 	"productName":productName,
			// 	"price":price,
			// 	"describePro":describePro,
			 	"id":id,
			// 	"image":"linnnnkkkkk",
			// 	"detailCateId":detailCateId
			 }
			deleteProduct(data)

		});
		function deleteProduct(data){
			console.log(typeof (data.id))
			$.ajax({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data:JSON.stringify(data),
				dataType: 'json',
				success: function (result){
					console.log("Success");
				},
				errMode: function (error){
					console.log("Error");
				}
			})
		}
	</script>


</body>
</html>