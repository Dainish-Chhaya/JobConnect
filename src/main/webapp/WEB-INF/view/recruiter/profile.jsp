<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruiter | Profile</title>
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- Parsley Validation CSS -->
    <link href="<%request.getContextPath();%>/adminResources/css/parsley.css" rel="stylesheet"/>
</head>
<body>
<div id="wrapper">
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">Recruiter Profile</h4>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Admin</a></li>
                                <li class="breadcrumb-item active">Profile</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- Form to display and edit user information -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <h4 class="header-title">Recruiter Information</h4>
                            <hr/>
                            <!-- Recruiter info form -->
                            <f:form modelAttribute="recruiter" method="post" action="saveProfile"
                                    parsley-validate="true">
                                <f:input path="id" type="hidden"/>
                                <div class="row">
                                    <!-- First Name Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstName">First Name <span class="text-danger">*</span></label>
                                            <f:input path="firstName" placeholder="First Name" class="form-control"
                                                     required="required"/>
                                        </div>
                                    </div>

                                    <!-- Last Name Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastName">Last Name <span class="text-danger">*</span></label>
                                            <f:input path="lastName" placeholder="Last Name" class="form-control"
                                                     required="required"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- Email Field -->
                                    <div class="col-md-6">
                                        <div class="form-group" aria-disabled="true">
                                            <label for="email">Email <span class="text-danger">*</span></label>
                                            <f:input path="email" readonly="true" placeholder="Email Address"
                                                     class="form-control" parsley-trigger="change" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Contact Number Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="contact">Contact Number:</label>
                                            <f:input path="contact" placeholder="Contact Number" class="form-control"
                                                     required="required"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- Company Name Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="companyName">Company Name:</label>
                                            <f:input path="companyName" placeholder="Company Name" class="form-control"
                                                     required="required"/>
                                        </div>
                                    </div>

                                    <!-- Company Email Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="companyEmail">Company Email:</label>
                                            <f:input path="companyEmail" placeholder="Company Email"
                                                     class="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- Company Contact Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="companyContact">Company Contact:</label>
                                            <f:input path="companyContact" placeholder="Company Contact Number"
                                                     class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Company Website Field -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="companyWebsite">Company Website:</label>
                                            <f:input path="companyWebsite" placeholder="Company Website URL"
                                                     class="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- Company Address Field -->
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="address">Company Address:</label>
                                            <f:input path="address" placeholder="Company Address" class="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Update Profile</button>
                                </div>

                            </f:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/parsley.min.js"></script> <!-- Parsley JS -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

</body>
</html>
