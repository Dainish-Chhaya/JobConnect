<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Admin | View Users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

    <!-- DataTables -->
    <link href="<%request.getContextPath();%>/adminResources/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <!-- Responsive datatable examples -->
    <link href="<%request.getContextPath();%>/adminResources/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>

    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

    <script type="text/javascript">
        function toggleTable(tableId) {
            if (tableId === 'recruiterTable') {
                document.getElementById('recruiterTable').style.display = 'table';
                document.getElementById('candidateTable').style.display = 'none';
                document.getElementById('recruiterTab').classList.add('active');
                document.getElementById('candidateTab').classList.remove('active');
            } else {
                document.getElementById('candidateTable').style.display = 'table';
                document.getElementById('recruiterTable').style.display = 'none';
                document.getElementById('candidateTab').classList.add('active');
                document.getElementById('recruiterTab').classList.remove('active');
            }
        }
    </script>
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
                            <h4 class="page-title float-left">View Users</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Admin</a></li>
                                <li class="breadcrumb-item"><a href="#">Manage Users</a></li>
                                <li class="breadcrumb-item active">View Users</li>
                            </ol>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-12">
                        <div class="btn-group">
                            <!-- Buttons to switch between Recruiters and Candidates -->
                            <button id="recruiterTab" class="btn btn-primary" onclick="toggleTable('recruiterTable')">Recruiters</button>
                            <button id="candidateTab" class="btn btn-secondary" onclick="toggleTable('candidateTable')">Candidates</button>
                        </div>

                        <div class="card-box table-responsive">
                            <!-- Recruiter Table -->
                            <table id="recruiterTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Number</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Contact Number</th>
                                    <th>Company Name</th>
                                    <th>Company Email</th>
                                    <th>Company Contact</th>
                                    <th>Company Website</th>
                                    <th>Address</th>
<%--                                    <th>Action</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${recruiters}" var="i" varStatus="j">
                                    <tr>
                                        <td>${j.count}</td>
                                        <td>${i.firstName}</td>
                                        <td>${i.lastName}</td>
                                        <td>${i.email}</td>
                                        <td>${i.contact}</td>
                                        <td>${i.companyName}</td>
                                        <td>${i.companyEmail}</td>
                                        <td>${i.companyContact}</td>
                                        <td>${i.companyWebsite}</td>
                                        <td>${i.address}</td>
<%--                                        <td><a href="editRecruiter?id=${i.id}"><i class="mdi mdi-lead-pencil font-20px"></i></a>--%>
<%--                                            <a href="deleteRecruiter?id=${i.id}"><i class="mdi mdi-delete font-100px text-danger ml-3"></i></a></td>--%>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- Candidate Table -->
                            <table id="candidateTable" class="table table-striped table-bordered" cellspacing="0" width="100%" style="display: none;">
                                <thead>
                                <tr>
                                    <th>Number</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Contact Number</th>
                                    <th>College Name</th>
                                    <th>Skills</th>
                                    <th>Degree</th>
<%--                                    <th>Action</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${candidates}" var="i" varStatus="j">
                                    <tr>
                                        <td>${j.count}</td>
                                        <td>${i.firstName}</td>
                                        <td>${i.lastName}</td>
                                        <td>${i.email}</td>
                                        <td>${i.contact}</td>
                                        <td>${i.collegeName}</td>
                                        <td>${i.skills}</td>
                                        <td>${i.degree}</td>
<%--                                        <td><a href="editCandidate?id=${i.id}"><i class="mdi mdi-lead-pencil font-20px"></i></a>--%>
<%--                                            <a href="deleteCandidate?id=${i.id}"><i class="mdi mdi-delete font-100px text-danger ml-3"></i></a></td>--%>
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

<!-- Required datatable js -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.dataTables.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/dataTables.bootstrap4.min.js"></script>

<!-- App js -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

</body>
</html>
