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
                                <li class="breadcrumb-item"><a href="/">Recruiter</a></li>
                                <li class="breadcrumb-item"><a href="#">Manage Applications</a></li>
                                <li class="breadcrumb-item active">View Applications</li>
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
                                    <th>id</th>
                                    <th>Job Title</th>
                                    <th>Applicant Name</th>
                                    <th>Contact</th>
                                    <th>Degree</th>
                                    <th>Skills</th>
                                    <th>Available Start Date</th>
                                    <th>LinkedIn Profile</th>
                                    <th>Status</th>
                                    <th>Resume</th>
                                    <th>Application Date</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${jobApplications}" var="jobApplicationVO">
                                    <tr>
                                        <td>${jobApplicationVO.id}</td>
                                        <td>${jobApplicationVO.jobPostingVO.jobTitle}</td>
                                        <td>${jobApplicationVO.candidateVO.firstName} ${jobApplicationVO.candidateVO.lastName}</td>
                                        <td>${jobApplicationVO.candidateVO.contact}</td>
                                        <td>${jobApplicationVO.candidateVO.degree}</td>
                                        <td>${jobApplicationVO.candidateVO.skills}</td>
                                        <td>${jobApplicationVO.availableStartDate}</td>
                                        <td>
                                            <c:if test="${not empty jobApplicationVO.linkedinProfile}">
                                                <a href="${jobApplicationVO.linkedinProfile}" target="_blank">Profile</a>
                                            </c:if>
                                            <c:if test="${empty jobApplicationVO.linkedinProfile}">
                                                -
                                            </c:if>
                                        </td>
                                        <td class="text-dark bg-info font-bold"> ${jobApplicationVO.status}</td>
                                        <td>
                                            <c:if test="${not empty jobApplicationVO.resumeFilePath}">
                                                <a href="<%= request.getContextPath() %>/downloadResume/${jobApplicationVO.resumeFilePath}"
                                                   target="_blank">Download</a>
                                            </c:if>
                                            <c:if test="${empty jobApplicationVO.resumeFilePath}">
                                                -
                                            </c:if>
                                        </td>
                                        <td>${jobApplicationVO.applicationDate}</td>
                                        <td>
                                            <select class="form-control"
                                                    onchange="showAlertAndTakeAction('${jobApplicationVO.id}', this)">
                                                <option value="">Select Action</option>
                                                <option value="Accepted">Accept</option>
                                                <option value="Interview">Interview</option>
                                                <option value="Rejected">Rejected</option>
                                            </select>

                                            <c:if test="${jobApplicationVO.status == 'Interview'}">
                                                <button class="btn btn-primary mt-2"
                                                        onclick="generateOfferLetter('${jobApplicationVO.id}')">Generate
                                                    Offer Letter
                                                </button>
                                            </c:if>
                                        </td>


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
        }).buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
    });

    function showAlertAndTakeAction(applicationId, selectElement) {
        var status = selectElement.value;

        // If no action is selected, do nothing
        if (!status) {
            return;
        }

        // Show confirmation dialog
        var confirmAction = confirm("Are you sure you want to set the status to " + status + "?");

        if (confirmAction) {
            // Send AJAX request to update the status
            $.ajax({
                url: '/updateApplicationStatus/' + applicationId + '/' + status,
                type: 'GET',
                success: function (response) {
                    // Optionally, you can handle the response here, such as showing a success message.
                    // For now, it will refresh the page with updated data.
                    location.reload(); // Reload the page to reflect changes
                },
                error: function (xhr, status, error) {
                    // Handle error if something goes wrong with the request
                    alert('Error updating application status: ' + error);
                }
            });
        } else {
            // Action was canceled, nothing will be done
            selectElement.value = ''; // Reset the dropdown to the initial value
        }
    }

    function generateOfferLetter(applicationId) {
        // Show confirmation before generating the offer letter
        var confirmGenerate = confirm("Are you sure you want to generate an offer letter for this applicant?");

        // Redirect to the controller method to trigger PDF download
        window.location.href = '/generateOfferLetter/' + applicationId;
        // if (confirmGenerate) {
        //     $.ajax({
        //         url: '/generateOfferLetter/' + applicationId,
        //         type: 'GET',
        //         success: function (response) {
        //             // Optionally handle success, for example, show a success message
        //             // For now, let's reload the page to reflect any changes
        //             alert("Offer letter generated successfully.");
        //             location.reload();
        //         },
        //         error: function (xhr, status, error) {
        //             alert('Error generating offer letter: ' + error);
        //         }
        //     });
        // }
    }


</script>

</body>
</html>
