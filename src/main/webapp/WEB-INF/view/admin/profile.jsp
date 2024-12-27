<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Admin | Profile</title>
    !-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet"
          type="text/css"/>

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
                            <h4 class="page-title float-left">Add Leaves</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Admin</a></li>
                                <li class="breadcrumb-item"><a href="#">Leave Criteria</a></li>
                                <li class="breadcrumb-item active">Add Leaves</li>
                            </ol>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">

                            <f:form class="#" action="saveLeaves"
                                    modelAttribute="leaveCriteriaVO" method="post">
                                <div class="form-group">

                                    <label>Leave Type<span class="text-danger">*</span></label>


                                    <f:input path="leaveType" required="required"
                                             class="form-control" placeholder="Reason"/>
                                </div>
                                <div class="form-group">
                                    <label>Number Of Days<span class="text-danger">*</span></label>

                                    <f:input path="leaveDays" required="required"
                                             class="form-control" placeholder="Number Of Days"/>
                                </div>


                                <div class="form-group">
                                    <label>Description<span class="text-danger">*</span></label>
                                    <div>

                                        <f:textarea path="leaveDescription" required="required"
                                                    class="form-control"/>
                                    </div>
                                </div>
                                <f:hidden path="id"/>
                                <div class="form-group">
                                    <div>
                                        <button type="submit"
                                                class="btn btn-primary waves-effect waves-light">
                                            Add
                                        </button>

                                    </div>
                                </div>
                            </f:form>
                        </div>
                    </div>
                </div>
                <!-- end row -->
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
    $(document).ready(function () {
        $('form').parsley();
    });
</script>
</body>
</html>
