<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Recruiter | Dashboard</title>

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>

    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

    <style>
        /* Custom Styles for Recruiter Dashboard */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }

        .homePage {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .mainDiv {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            background-color: #ffffff;
        }

        .companyImg {
            flex: 1;
            margin: 20px;
        }

        .companyImg img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        }

        .companyText {
            flex: 2;
            padding: 20px;
            text-align: justify;
        }

        .companyText h3 {
            font-size: 32px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .companyText p {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
        }

        .featureSection,
        .testimonialsSection,
        .contactSection {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            margin-top: 30px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }

        .featureSection h3,
        .testimonialsSection h3,
        .contactSection h3 {
            font-size: 26px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .featureSection ul,
        .testimonialsSection ul {
            list-style-type: none;
            padding-left: 0;
        }

        .featureSection li,
        .testimonialsSection li {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }

        .contactSection p {
            font-size: 18px;
            color: #555;
        }

        .ctaButton {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            margin-top: 20px;
            text-decoration: none;
        }

        .ctaButton:hover {
            background-color: #0056b3;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            .homePage {
                flex-direction: column;
                align-items: flex-start;
            }

            .companyImg {
                margin: 0;
                width: 100%;
                max-width: 100%;
            }

            .companyText {
                padding: 15px;
            }

            .mainDiv {
                flex-direction: column;
                padding: 10px;
            }

            .featureSection,
            .testimonialsSection,
            .contactSection {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Top Bar Start -->
    <jsp:include page="header.jsp"></jsp:include>

    <!-- Left Sidebar Start -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">Recruiter Dashboard</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- About Section -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box homePage">
                            <div class="companyImg">
                                <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                                     alt="HR Automation Image">
                            </div>
                            <div class="companyText">
                                <h3>About Job Connect</h3>
                                <p class="paragraph">Post, manage, and update job openings with intuitive tools. Reach
                                    top-tier talent faster and streamline the hiring process. Save time and find the
                                    perfect candidates with advanced filters and insights. Why Choose JobConnect?</p>
                                <p class="paragraph">Built with cutting-edge technology to provide a fast, secure, and
                                    reliable experience. Designed to foster meaningful connections between candidates
                                    and companies. Your partner in building a brighter future of work.</p>
                                <p class="paragraph">Join "JobConnect" and redefine your career or recruitment journey.
                                    Together, we create opportunities and drive success!</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Key Features Section -->
                <div class="featureSection">
                    <h3>Key Features of Job Connect</h3>
                    <ul>
                        <li><strong>Efficient Job Posting:</strong> Easily create and manage job listings with a
                            user-friendly interface.
                        </li>
                        <li><strong>Advanced Search Filters:</strong> Quickly find the right candidates with powerful
                            search tools.
                        </li>
                        <li><strong>Real-Time Notifications:</strong> Get alerts on new applications and job status
                            changes.
                        </li>
                        <li><strong>Automated Screening:</strong> Save time with AI-driven candidate screening and
                            ranking.
                        </li>
                        <li><strong>Integration with LinkedIn:</strong> Connect directly with LinkedIn profiles for easy
                            recruitment.
                        </li>
                    </ul>
                </div>

                <!-- Testimonials Section -->
                <div class="testimonialsSection">
                    <h3>What Our Clients Say</h3>
                    <ul>
                        <li>"Job Connect has transformed the way we hire. It?s fast, efficient, and seamless." -
                            <strong>John Doe, HR Manager</strong></li>
                        <li>"The job posting tools are incredibly easy to use, and we?ve seen a huge improvement in our
                            candidate quality." - <strong>Jane Smith, Recruitment Director</strong></li>
                        <li>"Automated screening saved us hours each week. A real game-changer for our hiring process."
                            - <strong>Sam Brown, Talent Acquisition Lead</strong></li>
                    </ul>
                </div>

                <!-- Contact Section -->
                <div class="contactSection">
                    <h3>Contact Us</h3>
                    <p>If you have any questions or need assistance, feel free to reach out to our team.</p>
                    <p><strong>Email:</strong> support@jobconnect.com</p>
                    <p><strong>Phone:</strong> +1 (800) 123-4567</p>
                    <a href="mailto:support@jobconnect.com" class="ctaButton">Get in Touch</a>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

    </div>
</div>

<!-- jQuery -->
<script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.dashboard.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
<script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

</body>

</html>
