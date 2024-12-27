<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Admin | Index</title>

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%request.getContextPath();%>/adminResources/images/favicon.ico">

    <!-- C3 charts css -->
    <link href="<%request.getContextPath();%>/adminResources/css/c3.min.css" rel="stylesheet" type="text/css"/>

    <!-- App css -->
    <link href="<%request.getContextPath();%>/adminResources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/adminResources/css/style.css" rel="stylesheet" type="text/css"/>

    <script src="<%request.getContextPath();%>/adminResources/js/modernizr.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }

        .homePage {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        .mainDiv {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            margin: 15px;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
        }

        .page-title-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .companyImg {
            flex: 1;
            max-width: 500px;
            margin-right: 30px;
        }

        .companyImg img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        }

        .companyText {
            flex: 2;
        }

        .companyText h3 {
            font-size: 30px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .paragraph {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
            text-align: justify;
            text-justify: inter-word;
        }

        .feature-box {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin: 15px;
            padding: 20px;
            text-align: center;
            width: 100%;
            max-width: 300px;
            transition: transform 0.3s ease;
        }

        .feature-box:hover {
            transform: translateY(-5px);
        }

        .feature-box img {
            width: 60px;
            margin-bottom: 20px;
        }

        .feature-box h5 {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }

        .feature-box p {
            color: #777;
        }

        .page-title-box {
            position: relative;
        }

        .counter-box {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .counter-box .counter-item {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 200px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .counter-box .counter-item:hover {
            transform: translateY(-5px);
        }

        .counter-item h4 {
            font-size: 30px;
            font-weight: bold;
            color: #333;
        }

        .counter-item p {
            color: #777;
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

    <!-- Start right Content here -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <!-- Page Title -->
                            <h4 class="page-title">Admin Dashboard</h4>
                        </div>
                    </div>
                </div>

                <!-- Recruiter & Candidate Count Section -->


                <!-- About Section -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box homePage m-3 mainDiv">
                            <div class="companyImg">
                                <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                                     alt="Job Connect">
                            </div>
                            <div class="companyText">
                                <h3>About Job Connect</h3>
                                <p class="paragraph">
                                    <strong>Revolutionizing Job Searching & Empowering Careers</strong><br><br>
                                    "JobConnect" is an innovative job portal designed to seamlessly connect talented
                                    professionals with leading employers. Our mission is to simplify the job search and
                                    hiring process, transforming the way opportunities are discovered and filled.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="counter-box">
                    <!-- Recruiters Count -->
                    <div class="counter-item">
                        <h4><%= request.getAttribute("recruitersCount") %>
                        </h4>
                        <p>Recruiters</p>
                    </div>
                    <!-- Candidates Count -->
                    <div class="counter-item">
                        <h4><%= request.getAttribute("candidatesCount") %>
                        </h4>
                        <p>Candidates</p>
                    </div>
                </div>
                <!-- Features Section -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4">Our Key Features</h3>
                    </div>

                    <!-- Feature 1: Easy Job Search -->
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Easy Job Search</h5>
                            <p>Find your perfect job with personalized search filters and job recommendations tailored
                                just for you.</p>
                        </div>
                    </div>

                    <!-- Feature 2: Employer Dashboard -->
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Employer Dashboard</h5>
                            <p>Employers can easily manage job postings, track applications, and find the best
                                candidates.</p>
                        </div>
                    </div>

                    <!-- Feature 3: Personalized Career Advice -->
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Personalized Career Advice</h5>
                            <p>Get tailored career tips and advice based on your skills, experience, and job search
                                activity to help you succeed.</p>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <jsp:include page="footer.jsp"></jsp:include>

            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.min.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/metisMenu.min.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/waves.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

    <!-- Counter js -->
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.waypoints.min.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.counterup.min.js"></script>

    <!--C3 Chart-->
    <script type="text/javascript" src="<%request.getContextPath();%>/adminResources/js/d3.min.js"></script>
    <script type="text/javascript" src="<%request.getContextPath();%>/adminResources/js/c3.min.js"></script>

    <!--Echart Chart-->
    <script src="<%request.getContextPath();%>/adminResources/js/echarts-all.js"></script>

    <!-- Dashboard init -->
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.dashboard.js"></script>

    <!-- App js -->
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.core.js"></script>
    <script src="<%request.getContextPath();%>/adminResources/js/jquery.app.js"></script>

</body>
</html>
