<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Admin | View Job Postings</title>
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
    <link href="<%request.getContextPath();%>/adminResources/css/jobPostingVO.css" rel="stylesheet" type="text/css"/>


    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

</head>

<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Top Bar Start -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Top Bar End -->

    <!-- Left Sidebar Start -->
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
                            <h4 class="page-title float-left">View Job Postings</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="#">Candidate</a></li>
                                <li class="breadcrumb-item"><a href="#">Manage Jobs</a></li>
                                <li class="breadcrumb-item active">Job Application</li>
                            </ol>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <!-- Search box and pagination container -->
                <div class="row">
                    <div class="col-12">
                        <!-- Container for the search and pagination -->
                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Search Input on the left -->
                            <input type="text" id="searchInput" class="form-control"
                                   placeholder="Search job postings..." style="max-width: 300px;">

                            <!-- Pagination controls on the right -->
                            <div class="pagination-container">
                                <ul class="pagination" id="pagination"></ul>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Cards container (with flex layout) -->
                <div class="row" id="jobCardsContainer">
                    <c:forEach items="${jobPostings}" var="jobPosting">
                        <div class="col-md-4 job-card" data-title="${jobPosting.jobTitle}">
                            <!-- Card Header with Job Title -->
                            <div class="card-header">
                                    ${jobPosting.jobTitle}
                            </div>

                            <!-- Card Body -->
                            <div class="card-body">
                                <!-- Job Details Section -->
                                <div class="job-details">
                                    <div class="section-content">
                                        <p><span class="text-dark font-weight-bold text-decoration-underline">Job Details</span>
                                        </p>
                                        <p><span class="text-dark">Employment Type:</span> ${jobPosting.employmentType}
                                        </p>
                                        <p><span class="text-dark">Job Location:</span> ${jobPosting.jobLocation}</p>
                                        <p><span class="text-dark">Location:</span> ${jobPosting.location}</p>

                                        <p><span class="text-dark">Salary:</span> ${jobPosting.salary}</p>
                                        <p><span
                                                class="text-dark">Required Experience:</span> ${jobPosting.requiredExperience}
                                        </p>
                                        <p><span
                                                class="text-dark">Department:</span> ${jobPosting.departmentVO.departmentName}
                                        </p>
                                        <p><span
                                                class="text-dark">Designation:</span> ${jobPosting.designationVO.designationName}
                                        </p>
                                    </div>
                                </div>

                                <!-- Recruiter Details Section -->
                                <div class="recruiter-details">
                                    <div class="section-content">
                                        <p><span class="text-dark font-weight-bold text-decoration-underline">Recruiter Details</span>
                                        </p>
                                        <p><span
                                                class="text-dark">Recruiter:</span> ${jobPosting.recruiterVO.firstName} ${jobPosting.recruiterVO.lastName}
                                        </p>
                                        <p><span class="text-dark">Contact:</span> ${jobPosting.recruiterVO.contact}</p>
                                        <p><span class="text-dark">Email:</span> ${jobPosting.recruiterVO.email}</p>
                                    </div>
                                </div>

                                <!-- Company Details Section -->
                                <div class="company-details">
                                    <div class="section-content">
                                        <p><span class="text-dark font-weight-bold text-decoration-underline">Company Details</span>
                                        </p>

                                        <p><span
                                                class="text-dark">Company Name:</span> ${jobPosting.recruiterVO.companyName}
                                        </p>
                                        <p><span
                                                class="text-dark">Company Address:</span> ${jobPosting.recruiterVO.address}
                                        </p>
                                        <p><span
                                                class="text-dark">Company Email:</span> ${jobPosting.recruiterVO.companyEmail}
                                        </p>
                                        <p><span
                                                class="text-dark">Company Contact:</span> ${jobPosting.recruiterVO.companyContact}
                                        </p>
                                        <p><span
                                                class="text-dark">Company Website:</span> ${jobPosting.recruiterVO.companyWebsite}
                                        </p>
                                    </div>
                                </div>

                                <!-- Apply button -->
                                <div class="job-actions">
                                    <c:choose>
                                        <c:when test="${fn:contains(jobApplications, jobPosting)}">
                                            <!-- If the user has already applied, show the "Applied" button -->
                                            <button class="btn btn-secondary" disabled>Applied</button>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- If the user hasn't applied, show the "Apply" button -->
                                            <a href="applyForJob?id=${jobPosting.id}"
                                               class="btn btn-primary">Apply</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                    <%--                                <div class="job-actions">--%>
                                    <%--                                    <a href="applyForJob?id=${jobPostingVO.id}" class="apply-btn">Apply</a>--%>
                                    <%--                                </div>--%>
                            </div>
                        </div>
                    </c:forEach>
                </div>

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

<script type="text/javascript">
    $(document).ready(function () {
        const cardsPerPage = 3; // Number of cards per page
        const cards = $(".job-card");
        const totalCards = cards.length;
        const totalPages = Math.ceil(totalCards / cardsPerPage);

        // Show the cards for the first page
        function showPage(page) {
            const start = (page - 1) * cardsPerPage;
            const end = start + cardsPerPage;
            cards.hide().slice(start, end).show();
        }

        // Pagination logic
        function createPagination() {
            for (let i = 1; i <= totalPages; i++) {
                $('#pagination').append('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>');
            }
            $('#pagination li').click(function () {
                const page = $(this).text();
                showPage(page);
                $('#pagination li').removeClass('active');
                $(this).addClass('active');
            });
        }

        // Initialize the first page and pagination
        showPage(1);
        createPagination();

        // search
        $('#searchInput').on('keyup', function () {
            const query = $(this).val().toLowerCase();
            $(".job-card").each(function () {
                // Get all the text content from the job card (e.g., title, description, location, etc.)
                const cardText = $(this).text().toLowerCase();  // Gets all text inside the job card

                // You can also explicitly search specific attributes like:
                // const cardTitle = $(this).data('title').toLowerCase();
                // const cardDescription = $(this).data('description').toLowerCase();
                // const cardLocation = $(this).data('location').toLowerCase();

                if (cardText.indexOf(query) !== -1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>

</body>
</html>
