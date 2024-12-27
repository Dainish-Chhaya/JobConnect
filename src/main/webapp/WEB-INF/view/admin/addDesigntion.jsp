<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Admin | Add Designation</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- App favicon -->
<link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

<!-- App css -->
<link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet"
	type="text/css" />
<link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet"
	type="text/css" />

<script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

</head>
<body>

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->


		<jsp:include page="header.jsp"></jsp:include>



		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->


		<jsp:include page="menu.jsp"></jsp:include>


		<!-- Left Sidebar End -->



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title float-left">Add Designation</h4>

								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item"><a href="/">Admin</a></li>
									<li class="breadcrumb-item"><a href="#">Designation</a></li>
									<li class="breadcrumb-item active">Add Designation</li>
								</ol>

								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->


					<div class="row">
						<div class="col-lg-12">

							<div class="card-box">


								<f:form action="saveDesignation" modelAttribute="designationVO"
									method="post">
									<div class="form-group">
										<label for="Department"> Designation<span
											class="text-danger">*</span></label>

										<f:input path="designationName" parsley-trigger="change" required="required"
											placeholder="Designation" class="form-control" />
									</div>

									<div class="form-group">
										<label>Description<span class="text-danger">*</span></label>
										<div>

											<f:textarea path="designationDescription" required="required"
												class="form-control" />
										</div>
									</div>
									<f:hidden path="id"/>

									<div>
										<button class="btn btn-primary waves-effect waves-light"
											type="submit">Add</button>

									</div>

								</f:form>
							</div>
							<!-- end card-box -->
						</div>
						<!-- end col -->





					</div>
					<!-- container -->

				</div>
				<!-- content -->

				<jsp:include page="footer.jsp"></jsp:include>

			</div>


			<!-- ============================================================== -->
			<!-- End Right content here -->
			<!-- ============================================================== -->


		</div>
		<!-- END wrapper -->



		<!-- jQuery  -->
		<script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
		<script src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>
		<!-- Popper for Bootstrap -->
		<script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
		<script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
		<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
		<script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

		<!-- Parsley js -->
		<script type="text/javascript" src="<%request.getContextPath();%>/adminResources/js/parsley.min.js"></script>

		<!-- App js -->
		<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
		<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('form').parsley();
			});
		</script>
</body>
</html>
