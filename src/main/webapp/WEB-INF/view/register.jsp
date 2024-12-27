<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Adminox - Responsive Web App Kit</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta
            content="A fully featured admin theme which can be used to build CRM, CMS, etc."
            name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="adminResources/images/favicon.ico">

    <!-- App css -->
    <link href="adminResources/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="adminResources/css/icons.css" rel="stylesheet"
          type="text/css"/>
    <link href="adminResources/css/metismenu.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="adminResources/css/style.css" rel="stylesheet"
          type="text/css"/>

    <script src="adminResources/js/modernizr.min.js"></script>

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
                                <h3 class="text-uppercase text-center">
                                    Register
                                </h3>
                                <%--									<h5 class="text-uppercase font-bold m-b-5 m-t-50">Register</h5>--%>
                                <%--									<p class="m-b-0">Get access to our admin panel</p>--%>
                            </div>
                            <div class="account-content">
                                <f:form method="post" action="registerUser" modelAttribute="registerVO"
                                        class="form-horizontal">

                                    <!-- Role Selection (Recruiter or Candidate) -->
                                    <div class="form-group">
                                        <label for="role">Select Role <span class="text-danger">*</span></label>

                                        <!-- Recruiter Radio Button -->
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="customRadio1" name="role"
                                                   value="ROLE_RECRUITER" class="custom-control-input" checked>
                                            <label class="custom-control-label" for="customRadio1">Recruiter</label>
                                        </div>

                                        <!-- Candidate Radio Button -->
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="customRadio2" name="role"
                                                   value="ROLE_CANDIDATE" class="custom-control-input">
                                            <label class="custom-control-label" for="customRadio2">Candidate</label>
                                        </div>
                                    </div>

                                    <%--  FirstName & LasteName --%>
                                    <div class="form-group row m-b-20">
                                        <div class="col-md-6">
                                            <label for="firstName">First Name</label>
                                            <f:input path="firstName" id="firstName" class="form-control" required="true"
                                                     placeholder="Enter your first name"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="lastName">Last Name</label>
                                            <f:input path="lastName" id="lastName" class="form-control" required="true"
                                                     placeholder="Enter your last name"/>
                                        </div>
                                    </div>

                                    <!-- Username Field -->
                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <label for="username">Username</label>
                                            <f:input path="username" id="username" class="form-control" required="true"
                                                     placeholder="Enter your username"/>
                                        </div>
                                    </div>

                                    <!-- Password Field -->
                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <label for="password">Password</label>
                                            <f:password path="password" id="password" class="form-control"
                                                        required="true" placeholder="Enter your password"/>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="form-group row text-center m-t-5">
                                        <div class="col-12">
                                            <button class="btn btn-md btn-block btn-primary waves-effect waves-light"
                                                    type="submit">Sign Up
                                            </button>
                                        </div>
                                    </div>

                                </f:form>
                                <%--                                <form class="form-horizontal" action="registerUser" method="post"--%>
                                <%--                                      modelAttribute="userVO">--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label for="recruiterOrCandidate">Select Role <span class="text-danger">*</span></label>--%>

                                <%--                                        <!-- Recruiter Radio Button -->--%>
                                <%--                                        <div class="custom-control custom-radio">--%>
                                <%--                                            <input type="radio" id="customRadio1" name="recruiterOrCandidate"--%>
                                <%--                                                   value="recruiterVO" class="custom-control-input" checked>--%>
                                <%--                                            <label class="custom-control-label" for="customRadio1">Recruiter</label>--%>
                                <%--                                        </div>--%>

                                <%--                                        <!-- Candidate Radio Button -->--%>
                                <%--                                        <div class="custom-control custom-radio">--%>
                                <%--                                            <input type="radio" id="customRadio2" name="recruiterOrCandidate"--%>
                                <%--                                                   value="candidate" class="custom-control-input">--%>
                                <%--                                            <label class="custom-control-label" for="customRadio2">Candidate</label>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>


                                <%--&lt;%&ndash;                                    <div class="form-group row m-b-20">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                        <div class="col-12">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                            <label for="firstName">First Name</label> <input&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                                class="form-control" type="text" id="firstName" required=""&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                                placeholder="Michael">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                    <div class="form-group row m-b-20">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                        <div class="col-12">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                            <label for="lastName">Last Name</label> <input&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                                class="form-control" type="text" id="lastName" required=""&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                                placeholder="Zenaty">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>

                                <%--                                    <div class="form-group row m-b-20">--%>
                                <%--                                        <div class="col-12">--%>
                                <%--                                            <label for="emailaddress">Email address</label> <input--%>
                                <%--                                                class="form-control" type="email" id="emailaddress"--%>
                                <%--                                                required="" placeholder="john@deo.com">--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                    <div class="form-group row m-b-20">--%>
                                <%--                                        <div class="col-12">--%>
                                <%--                                            <label for="password">Password</label> <input--%>
                                <%--                                                class="form-control" type="password" required=""--%>
                                <%--                                                id="password" placeholder="Enter your password">--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                    &lt;%&ndash;										<div class="form-group row m-b-20">&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;											<div class="col-12">&ndash;%&gt;--%>

                                <%--                                    &lt;%&ndash;												<div class="checkbox checkbox-success">&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;													<input id="remember" type="checkbox" checked=""> <label&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;														for="remember"> I accept <a href="#">Terms and&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;															Conditions</a>&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;													</label>&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;												</div>&ndash;%&gt;--%>

                                <%--                                    &lt;%&ndash;											</div>&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;										</div>&ndash;%&gt;--%>

                                <%--                                    <div class="form-group row text-center m-t-5">--%>
                                <%--                                        <div class="col-12">--%>
                                <%--                                            <button--%>
                                <%--                                                    class="btn btn-md btn-block btn-primary waves-effect waves-light"--%>
                                <%--                                                    type="submit">Sign Up--%>
                                <%--                                            </button>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                </form>--%>

                                <%--									<div class="row">--%>
                                <%--										<div class="col-12">--%>
                                <%--											<div class="text-center">--%>
                                <%--												<button type="button"--%>
                                <%--													class="btn m-r-5 btn-facebook waves-effect waves-light">--%>
                                <%--													<i class="fa fa-facebook"></i>--%>
                                <%--												</button>--%>
                                <%--												<button type="button"--%>
                                <%--													class="btn m-r-5 btn-googleplus waves-effect waves-light">--%>
                                <%--													<i class="fa fa-google"></i>--%>
                                <%--												</button>--%>
                                <%--												<button type="button"--%>
                                <%--													class="btn m-r-5 btn-twitter waves-effect waves-light">--%>
                                <%--													<i class="fa fa-twitter"></i>--%>
                                <%--												</button>--%>
                                <%--											</div>--%>
                                <%--										</div>--%>
                                <%--									</div>--%>

                                <div class="row m-t-20">
                                    <div class="col-12 text-center">
                                        <p class="text-muted">
                                            Already have an account? <a href="/login"
                                                                        class="text-dark m-l-5"><b>Sign In</b></a>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- end card-box-->
                    </div>


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

<!-- jQuery  -->
<script src="adminResources/js/jquery.min.js"></script>
<script src="adminResources/js/popper.min.js"></script>
<!-- Popper for Bootstrap -->
<script src="adminResources/js/bootstrap.min.js"></script>
<script src="adminResources/js/metisMenu.min.js"></script>
<script src="adminResources/js/waves.js"></script>
<script src="adminResources/js/jquery.slimscroll.js"></script>

<!-- App js -->
<script src="adminResources/js/jquery.core.js"></script>
<script src="adminResources/js/jquery.app.js"></script>

</body>
</html>