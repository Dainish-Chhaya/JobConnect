<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Admin | Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>

    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

</head>

<body class="bg-accpunt-pages">

<!-- HOME -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper-page">
                    <div class="account-pages">
                        <div class="account-box">
                            <div class="account-logo-box">
                                <h2 class="text-uppercase text-center">
                                    <a href="index.html" class="text-success"> <span><img
                                            src="<%request.getContextPath();%>/adminResources/images/download3.png"
                                            alt="" height="60"></span>
                                    </a>
                                </h2>
                                <h5 class="text-uppercase font-bold m-b-5 m-t-50">Sign In</h5>
                                <p class="m-b-0">Login to your account</p>
                            </div>
                            <div class="account-content">

                                <!-- Form to handle login -->
                                <form class="form-horizontal" action="/j_spring_security_check" method="post">
                                    <div class="form-group m-b-20 row">
                                        <div class="col-12">
                                            <label for="emailaddress">Email address</label>
                                            <input class="form-control" type="email" name="username" id="emailaddress"
                                                   required="" placeholder="john@deo.com">
                                        </div>
                                    </div>

                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <label for="password">Password</label>
                                            <input class="form-control" type="password" name="password" required=""
                                                   id="password" placeholder="Enter your password">
                                        </div>
                                    </div>

                                    <!-- Display error message if login fails -->
                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <c:if test="${not empty param.error}">
                                                <div class="alert alert-danger" role="alert">
                                                    Invalid username or password. Please try again.
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="form-group row text-center m-t-10">
                                        <div class="col-12">
                                            <button class="btn btn-md btn-block btn-primary waves-effect waves-light"
                                                    type="submit">Sign In
                                            </button>
                                        </div>
                                    </div>

                                </form>

                                <div class="row m-t-50">
                                    <div class="col-sm-12 text-center">
                                        <p class="text-muted">
                                            Don't have an account?
                                            <a href="/register" class="text-dark m-l-5"><b>Register here</b></a>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end card-box-->
                </div>
                <!-- end wrapper -->
            </div>
        </div>
    </div>
</section>
<!-- END HOME -->

<script>
    var resizefunc = [];
</script>

<!-- jQuery -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>


<!-- Popper for Bootstrap -->
<script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

<!-- App js -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

</body>
</html>
