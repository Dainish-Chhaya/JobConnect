<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Admin | Edit Job Posting</title>
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
                            <h4 class="page-title float-left">Post Job </h4>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Recruiter</a></li>
                                <li class="breadcrumb-item"><a href="#">Manage Jobs</a></li>
                                <li class="breadcrumb-item active">Post Job</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- Job Posting Form -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <f:form action="saveJobPosting" modelAttribute="jobPostingVO" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Job Title<span class="text-danger">*</span></label>
                                        <f:input path="jobTitle" class="form-control" required="required"
                                                 placeholder="Job Title"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Location<span class="text-danger">*</span></label>
                                        <f:input path="location" class="form-control" required="required"
                                                 placeholder="Location"/>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Employment Type<span class="text-danger">*</span></label>
                                        <f:select path="employmentType" class="form-control" required="required">
                                            <option value="">Select Employment Type</option>
                                            <option value="Full-time"
                                                    <c:if test="${jobPostingVO.employmentType == 'Full-time'}">selected</c:if>>
                                                Full time
                                            </option>
                                            <option value="Part-time"
                                                    <c:if test="${jobPostingVO.employmentType == 'Part-time'}">selected</c:if>>
                                                Part time
                                            </option>
                                            <option value="Internship"
                                                    <c:if test="${jobPostingVO.employmentType == 'Internship'}">selected</c:if>>
                                                Internship
                                            </option>
                                        </f:select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Job Location<span class="text-danger">*</span></label>
                                        <f:select path="jobLocation" class="form-control" required="required">
                                            <option value="">Select Job Location</option>
                                            <option value="Remote"
                                                    <c:if test="${jobPostingVO.jobLocation == 'Remote'}">selected</c:if>>
                                                Remote
                                            </option>
                                            <option value="Hybrid"
                                                    <c:if test="${jobPostingVO.jobLocation == 'Hybrid'}">selected</c:if>>
                                                Hybrid
                                            </option>
                                            <option value="On-site"
                                                    <c:if test="${jobPostingVO.jobLocation == 'On-site'}">selected</c:if>>
                                                On-site
                                            </option>
                                        </f:select>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label>Salary<span class="text-danger">*</span></label>
                                        <div>
                                            <input type="range" class="form-control" id="salaryRange" min="30000"
                                                   max="500000" step="5000" value="${jobPostingVO.salary}"/>
                                            <p id="salaryValue">Selected Salary: ${jobPostingVO.salary}</p>
                                            <f:input path="salary" class="form-control" type="hidden" id="salary"
                                                     value="${jobPostingVO.salary}" required="required"/>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-2"></div>

                                    <div class="form-group col-md-2">
                                        <label>Required Experience (in years)<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <button class="btn btn-outline-secondary" type="button"
                                                    id="decreaseExperience">-
                                            </button>
                                            <input type="number" class="form-control" id="requiredExperience"
                                                   name="requiredExperience" value="${jobPostingVO.requiredExperience}"
                                                   min="0" max="50" step="1"
                                                   required="required"/>
                                            <button class="btn btn-outline-secondary" type="button"
                                                    id="increaseExperience">+
                                            </button>
                                            <span class="input-group-text">years</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Department<span class="text-danger">*</span></label>
                                        <f:select path="departmentVO.id" class="form-control" required="required">
                                            <option value="">Select Department</option>
                                            <c:forEach items="${departmentList}" var="i">
                                                <option value="${i.id}"
                                                        <c:if test="${jobPostingVO.departmentVO.id == i.id}">selected</c:if>>${i.departmentName}</option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Designation<span class="text-danger">*</span></label>
                                        <f:select path="designationVO.id" class="form-control" required="required">
                                            <option value="">Select Designation</option>
                                            <c:forEach items="${designationList}" var="i">
                                                <option value="${i.id}"
                                                        <c:if test="${jobPostingVO.designationVO.id == i.id}">selected</c:if>>${i.designationName}</option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Job Description<span class="text-danger">*</span></label>
                                        <textarea class="form-control" id="jobDescription" name="description" rows="4"
                                                  required="required"
                                                  placeholder="Enter the job description here...">${jobPostingVO.description}</textarea>
                                    </div>
                                </div>
                                <f:input path="id" type="hidden"/>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Save</button>
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
<script src="<%request.getContextPath();%>/adminResources/js/parsley.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('form').parsley();
    });
    // Update the salary value display as the user changes the range
    document.getElementById('salaryRange').oninput = function () {
        var salary = this.value;
        document.getElementById('salaryValue').textContent = "Selected Salary: " + salary;
        document.getElementById('salary').value = salary;
    };
    // Increment the experience number
    document.getElementById('increaseExperience').onclick = function () {
        var experienceInput = document.getElementById('requiredExperience');
        var currentValue = parseInt(experienceInput.value);
        if (currentValue < 50) { // Maximum limit
            experienceInput.value = currentValue + 1;
        }
    };

    // Decrement the experience number
    document.getElementById('decreaseExperience').onclick = function () {
        var experienceInput = document.getElementById('requiredExperience');
        var currentValue = parseInt(experienceInput.value);
        if (currentValue > 0) { // Minimum limit
            experienceInput.value = currentValue - 1;
        }
    };
</script>

</body>
</html>
