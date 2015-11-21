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
        <li<%= (menu.equalsIgnoreCase("admin") ? " class='active'" : "") %>><a href="Admin"><i class="glyphicon glyphicon-user"></i> <span>Admin</span></a></li>
        <li<%= (menu.equalsIgnoreCase("asset") ? " class='active'" : "") %>><a href="Asset"><i class="glyphicon glyphicon-globe"></i> <span>Asset</span></a></li>
        <li<%= (menu.equalsIgnoreCase("domain") ? " class='active'" : "") %>><a href="Domain"><i class="fa fa-globe"></i> <span>Domain</span></a></li>
    </ul>

</div><!-- leftpanel -->