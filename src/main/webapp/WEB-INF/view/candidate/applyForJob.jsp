<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Apply for Job</title>
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

<body>

<!-- Begin page -->
<div id="wrapper">

    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">Apply for Job: ${jobApplicationVO.jobPostingVO.jobTitle}</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- Job Application Form -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <f:form action="saveJobApplication" modelAttribute="jobApplicationVO" method="post"
                                    enctype="multipart/form-data">

                                <!-- Hidden JobPosting ID -->
                                <f:input path="jobPostingVO.id" type="hidden" value="${jobApplicationVO.jobPostingVO.id}"/>

                                <!-- Hidden Candidate ID -->
                                <f:input path="candidateVO.id" type="hidden" value="${jobApplicationVO.candidateVO.id}"/>

                                <!-- Candidate details (showing fields that can be filled) -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Resume File (PDF or Word format)<span
                                                class="text-danger">*</span></label> <input type="file"
                                                                                            name="resumeFile"
                                                                                            class="form-control"
                                                                                            required="required"
                                                                                            placeholder="Upload Resume">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Available Start Date<span class="text-danger">*</span></label>
                                        <f:input path="availableStartDate" class="form-control" type="date"
                                                 required="required"/>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>LinkedIn Profile (optional)</label>
                                        <f:input path="linkedinProfile" class="form-control"
                                                 placeholder="Enter LinkedIn URL"/>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Preferred Interview Date<span class="text-danger">*</span></label>
                                        <f:input path="preferredInterviewDate" class="form-control" type="date"
                                                 required="required"/>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit
                                        Application
                                    </button>
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
</body>
</html>
