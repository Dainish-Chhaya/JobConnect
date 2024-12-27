<div class="topbar">

    <!-- LOGO -->
    <div class="topbar-left">
        <a href="<%request.getContextPath();%>/admin/home" class="logo"> <span>
				<img
                        src="<%request.getContextPath();%>/adminResources/images/download3.png"
                        alt="" height="60">
		</span> <i> <img
                src="<%request.getContextPath();%>/adminResources/images/download1.png"
                alt="" height="28">
        </i>
        </a>
    </div>

    <nav class="navbar-custom">

        <ul class="list-inline float-right mb-0">


            <li class="list-inline-item dropdown notification-list"><a
                    class="nav-link dropdown-toggle waves-effect waves-light nav-user"
                    data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                    aria-expanded="false"> <img
                    src="<%request.getContextPath();%>/adminResources/images/avatar-1.jpg"
                    alt="user" class="rounded-circle">
            </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown "
                     aria-labelledby="Preview">
                    <!-- item-->
                    <%-- Profile icom--%>
                    <a href="<%request.getContextPath();%>/admin/profile" class="dropdown-item notify-item"> <i
                            class="mdi mdi-account-circle"></i> <span>Profile</span>

                        <a href="/" class="dropdown-item notify-item"> <i
                                class="mdi mdi-power"></i> <span>Logout</span>
                        </a>

                </div>
            </li>

        </ul>

        <ul class="list-inline menu-left mb-0">
            <li class="float-left">
                <button
                        class="button-menu-mobile open-left waves-light waves-effect">
                    <i class="dripicons-menu"></i>
                </button>
            </li>

        </ul>

    </nav>

</div>
