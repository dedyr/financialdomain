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
        <li<%= (menu.equalsIgnoreCase("payment_methods") ? " class='active'" : "") %>><a href="PaymentMethods"><i class="fa fa-money"></i> <span>Payment Methods</span></a></li>
        <li<%= (menu.equalsIgnoreCase("payment_history") ? " class='active'" : "") %>><a href="#"><i class="glyphicon glyphicon-time"></i> <span>Payment History</span></a></li>
        <li<%= (menu.equalsIgnoreCase("preferences") ? " class='active'" : "") %>><a href="#"><i class="glyphicon glyphicon-list"></i> <span>Preferences</span></a></li>
    </ul>

</div><!-- leftpanel -->
<% out.flush(); %>