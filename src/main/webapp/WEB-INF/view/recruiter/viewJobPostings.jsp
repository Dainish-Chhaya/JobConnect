<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Admin | View Job Postings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
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
<style>
    /* The switch - the slider */
    .switch {
        position: relative;
        display: inline-block;
        width: 34px;
        height: 20px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* The slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: .4s;
        border-radius: 50px;
    }

    /* The slider when checked */
    .slider:before {
        position: absolute;
        content: "";
        height: 12px;
        width: 12px;
        border-radius: 50px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: .4s;
    }

    /* When the checkbox is checked, the slider moves */
    input:checked + .slider {
        background-color: #2196F3;
    }

    /* When the checkbox is checked, the slider moves */
    input:checked + .slider:before {
        transform: translateX(14px);
    }

</style>

<body>

<div id="wrapper">

    <!-- Top Bar Start -->
    <jsp:include page="header.jsp"></jsp:include>

    <!-- Left Sidebar Start -->
    <jsp:include page="menu.jsp"></jsp:include>

    <!-- Right Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">View Job Postings</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/">Recruiter</a></li>
                                <li class="breadcrumb-item"><a href="#">Manage Jobs </a></li>
                                <li class="breadcrumb-item active">View Job Postings</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- Job Postings Table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-buttons" class="table table-striped table-bordered" cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>Job Title</th>
                                    <th>Job Description</th>
                                    <th>Employment Type</th>
                                    <th>Job Location</th>
                                    <th>Salary</th>
                                    <th>Required Experience</th>
                                    <th>Department</th>
                                    <th>Designation</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${jobPostingList}" var="job" varStatus="status">
                                    <tr>
                                        <td>${job.jobTitle}</td>
                                        <td>${job.description}</td>
                                        <td>${job.employmentType}</td>
                                        <td>${job.jobLocation}</td>
                                        <td>${job.salary}</td>
                                        <td>${job.requiredExperience}</td>
                                        <td>${job.departmentVO.departmentName}</td>
                                        <td>${job.designationVO.designationName}</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" class="status-toggle" data-job-id="${job.id}"
                                                    ${job.active ? 'checked' : ''} />
                                                <span class="slider round"></span>
                                            </label>
                                        </td>

                                        <td>

                                            <a href="editJobPostings?id=${job.id}">
                                                <i class="mdi mdi-lead-pencil font-20px"></i>
                                            </a>
                                            <a href="deleteJobPostings?id=${job.id}">
                                                <i class="mdi mdi-delete font-100px text-danger ml-3"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<!-- jQuery  -->
<script
        src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>
<!-- Popper for Bootstrap -->
<script
        src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

<!-- Required datatable js -->
<script
        src="<%request.getContextPath();%>/adminResources/js/jquery.dataTables.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script
        src="<%request.getContextPath();%>/adminResources/js/dataTables.buttons.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/buttons.bootstrap4.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/jszip.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/pdfmake.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/vfs_fonts.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/buttons.html5.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/buttons.print.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/buttons.colVis.min.js"></script>
<!-- Responsive examples -->
<script
        src="<%request.getContextPath();%>/adminResources/js/dataTables.responsive.min.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/responsive.bootstrap4.min.js"></script>

<!-- App js -->
<script
        src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script
        src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

<script type="text/javascript">
    $(document).ready(
        function () {
            $('#datatable').DataTable();

            //Buttons examples
            var table = $('#datatable-buttons').DataTable({
                lengthChange: false,
                buttons: ['copy', 'excel', 'pdf', 'colvis']
            });

            // table.buttons().container().appendTo(
            // 		'#datatable-buttons_wrapper .col-md-6:eq(0)');
        });
    $(document).ready(function () {
        // Handle toggle switch change
        $(".status-toggle").change(function () {
            var jobId = $(this).data("job-id");  // Get the job ID
            var status = $(this).prop("checked");  // Get the new status (true or false)

            // Send the new status to the server via AJAX
            $.ajax({
                url: "<%= request.getContextPath() %>/recruiter/updateJobStatus",  // URL to the controller
                type: "POST",  // HTTP method
                data: {
                    jobId: jobId,
                    status: status  // Send the job ID and the new status
                },
                success: function(response) {
                    // After successful status update, reload the page to reflect changes
                    location.reload();
                },
                error: function(xhr, status, error) {
                    // Handle error (optional)
                    alert("Error updating status. Please try again.");
                    // If the update failed, revert the checkbox to its previous state
                    $(this).prop("checked", !status);  // Revert the checkbox state
                }
            });
        });
    });
</script>

</body>
</html>
