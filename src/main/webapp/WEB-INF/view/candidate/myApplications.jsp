<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>My Applications</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme" name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">
    <!-- DataTables -->
    <link href="<%request.getContextPath();%>/adminResources/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/buttons.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Responsive datatable examples -->
    <link href="<%request.getContextPath();%>/adminResources/css/responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>
</head>

<body>

<div id="wrapper">
    <!-- Top Bar Start -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Top Bar End -->

    <!-- Left Sidebar Start -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">My Applications</h4>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Candidate</a></li>
                                <li class="breadcrumb-item"><a href="/">Manage Jobs</a></li>
                                <li class="breadcrumb-item active">My Applications</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-buttons" class="table table-striped table-bordered" cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>Application ID</th>
                                    <th>Job Title</th>
                                    <th>Company Name</th>
                                    <th>Available Start Date</th>
                                    <th>LinkedIn Profile</th>
                                    <th>Status</th>
                                    <th>Interview Link</th>
                                    <th>Application Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${jobApplications}" var="jobApplicationVO">
                                    <tr>
                                        <td>${jobApplicationVO.id}</td>
                                        <td>${jobApplicationVO.jobPostingVO.jobTitle}</td>
                                        <!-- Assuming jobPostingVO has a title field -->
                                        <td> ${jobApplicationVO.jobPostingVO.recruiterVO.companyName} </td>
                                        <td>${jobApplicationVO.availableStartDate}</td>
                                        <td>
                                            <a href="${jobApplicationVO.linkedinProfile}" target="_blank">LinkedIn
                                                Profile</a>
                                        </td>
                                        <td>${jobApplicationVO.status}</td>
                                        <td>
                                            <c:if test="${not empty jobApplicationVO.interviewLink}">
                                                <a href="${jobApplicationVO.interviewLink}" target="_blank">Join
                                                    Interview</a>
                                            </c:if>
                                            <c:if test="${empty jobApplicationVO.interviewLink}">
                                                -
                                            </c:if>
                                        </td>
                                        <td>${jobApplicationVO.applicationDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- container -->
        </div>
        <!-- content -->

        <footer class="footer text-right">2017 - 2018 © Adminox. - Coderthemes.com</footer>
    </div>
</div>

<!-- jQuery -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>
<!-- Popper for Bootstrap -->
<script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

<!-- Required datatable js -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.dataTables.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script src="<%request.getContextPath();%>/adminResources/js/dataTables.buttons.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/buttons.bootstrap4.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jszip.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/pdfmake.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/vfs_fonts.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/buttons.html5.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/buttons.print.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/buttons.colVis.min.js"></script>
<!-- Responsive examples -->
<script src="<%request.getContextPath();%>/adminResources/js/dataTables.responsive.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/responsive.bootstrap4.min.js"></script>

<!-- App js -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable-buttons').DataTable({
            lengthChange: false,
            // buttons: ['copy', 'excel', 'pdf', 'colvis']
        }).buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
    });
</script>

</body>
</html>
