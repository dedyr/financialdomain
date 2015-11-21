<header>
    <div class="headerwrapper">
        <div class="header-left">
            <a href="./Dashboard" class="logo">
                <img src="images/logo.png" /> 
            </a>
            <div class="pull-right">
                <a href="#" class="menu-collapse">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </div><!-- header-left -->

        <div class="header-right">
            
            <div class="pull-left">
                
                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        AWS&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 1</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 2</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 3</a></li>
                    </ul>
                </div><!-- btn-group -->
                
                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Services&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 1</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 2</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 3</a></li>
                    </ul>
                </div><!-- btn-group -->
                
                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Edit&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="PaymentMethods"><i class="fa fa-credit-card"></i> Credit Card</a></li>
                        <li><a href="PaymentMethods#bitcoin"><i class="fa fa-bitcoin"></i> Bitcoin</a></li>
                    </ul>
                </div><!-- btn-group -->
                
            </div>

            <div class="pull-right">

                <%
                    /*
                    
                    <form class="form form-search" action="search-results.html">
                    <input type="search" class="form-control" placeholder="Search" />
                </form>

                <div class="btn-group btn-group-list btn-group-messages">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge">2</span>
                    </button>
                    <div class="dropdown-menu pull-right">
                        <a href="#" class="link-right"><i class="fa fa-plus"></i></a>
                        <h5>New Messages</h5>
                        <ul class="media-list dropdown-list">
                            <li class="media">
                                <span class="badge badge-success">New</span>
                                <img class="img-circle pull-left noti-thumb" src="images/photos/user1.png" alt="">
                                <div class="media-body">
                                    <strong>Nusja Nawancali</strong>
                                    <p>Hi! How are you?...</p>
                                    <small class="date"><i class="fa fa-clock-o"></i> 15 minutes ago</small>
                                </div>
                            </li>
                            <li class="media">
                                <span class="badge badge-success">New</span>
                                <img class="img-circle pull-left noti-thumb" src="images/photos/user2.png" alt="">
                                <div class="media-body">
                                    <strong>Weno Carasbong</strong>
                                    <p>Lorem ipsum dolor sit amet...</p>
                                    <small class="date"><i class="fa fa-clock-o"></i> July 04, 2014</small>
                                </div>
                            </li>
                            <li class="media">
                                <img class="img-circle pull-left noti-thumb" src="images/photos/user3.png" alt="">
                                <div class="media-body">
                                    <strong>Venro Leonga</strong>
                                    <p>Do you have the time to listen to me...</p>
                                    <small class="date"><i class="fa fa-clock-o"></i> July 03, 2014</small>
                                </div>
                            </li>
                            <li class="media">
                                <img class="img-circle pull-left noti-thumb" src="images/photos/user4.png" alt="">
                                <div class="media-body">
                                    <strong>Nanterey Reslaba</strong>
                                    <p>It might seem crazy what I'm about to say...</p>
                                    <small class="date"><i class="fa fa-clock-o"></i> July 03, 2014</small>
                                </div>
                            </li>
                            <li class="media">
                                <img class="img-circle pull-left noti-thumb" src="images/photos/user1.png" alt="">
                                <div class="media-body">
                                    <strong>Nusja Nawancali</strong>
                                    <p>Hey I just met you and this is crazy...</p>
                                    <small class="date"><i class="fa fa-clock-o"></i> July 02, 2014</small>
                                </div>
                            </li>
                        </ul>
                        <div class="dropdown-footer text-center">
                            <a href="#" class="link">See All Messages</a>
                        </div>
                    </div><!-- dropdown-menu -->
                </div><!-- btn-group -->
                    
                    
                     */
                %>
                

                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <%= request.getSession().getAttribute("full_name")%>&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="MyAccount"><i class="glyphicon glyphicon-user"></i> My Account</a></li>
                        <li><a href="MyBilling"><i class="fa fa-money"></i> Billing</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                        <li class="divider"></li>
                        <li><a href="Login?action=logout"><i class="glyphicon glyphicon-log-out"></i>Sign Out</a></li>
                    </ul>
                </div><!-- btn-group -->
                
                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Global&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 1</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 2</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 3</a></li>
                    </ul>
                </div><!-- btn-group -->
                
                <div class="btn-group btn-group-option">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Support&nbsp; <i class="fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 1</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 2</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Link 3</a></li>
                    </ul>
                </div><!-- btn-group -->

            </div><!-- pull-right -->

        </div><!-- header-right -->

    </div><!-- headerwrapper -->
</header><% out.flush(); %>