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
        <li<%= (menu.equalsIgnoreCase("domain_search") ? " class='active'" : "") %>><a href="DomainSearch"><i class="fa fa-globe"></i> <span>1. Domain Search</span></a></li>
        <li<%= (menu.equalsIgnoreCase("contact_details") ? " class='active'" : "") %>><a href="ContactDetails"><i class="glyphicon glyphicon-user"></i> <span>2. Contact Detail</span></a></li>
        <li<%= (menu.equalsIgnoreCase("review_and_purchase") ? " class='active'" : "") %>><a href="ReviewAndPurchase"><i class="fa fa-money"></i> <span>3. Review &amp; Purchase</span></a></li>
    </ul>

</div><!-- leftpanel -->
<% out.flush(); %>