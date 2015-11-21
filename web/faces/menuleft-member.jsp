<div class="leftpanel">
    <div class="media profile-left">
        <a class="pull-left profile-thumb" href="MyAccount">
            <img class="img-circle" src="images/photos/profile.png">
        </a>
        <div class="media-body">
            <h4 class="media-heading"><%= request.getSession().getAttribute("full_name") %></h4>
            <small class="text-muted"><%= request.getSession().getAttribute("email") %></small>
        </div>
    </div><!-- media -->

    <h5 class="leftpanel-title">Navigation</h5>
    <ul class="nav nav-pills nav-stacked">
        <li<%= (menu.equalsIgnoreCase("dashboard") ? " class='active'" : "") %>><a href="Dashboard"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li<%= (menu.equalsIgnoreCase("hosted_assets") ? " class='active'" : "") %>><a href="Domain"><i class="fa fa-globe"></i> <span>Hosted Asset</span></a></li>
        <li<%= (menu.equalsIgnoreCase("health_checks") ? " class='active'" : "") %>><a href="#"><i class="glyphicon glyphicon-check"></i> <span>Health Check</span></a></li>
        <li<%= (menu.equalsIgnoreCase("domain") ? " class='active'" : "") %>><a href="DomainSearch"><i class="fa fa-search"></i> <span>Financial Domain</span></a></li>
        <li<%= (menu.equalsIgnoreCase("pending_fds") ? " class='active'" : "") %>><a href="PendingFD"><i class="fa fa-clock-o"></i> <span>Pending FDs</span></a></li>
    </ul>

</div><!-- leftpanel -->
<% out.flush(); %>