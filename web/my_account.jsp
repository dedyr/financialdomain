<%@page import="fx.lang.Str"%>
<%@page import="java.util.List"%>
<%@page import="fx.lang.Int"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map member = (Map) request.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Register Domain</title>

        <link href="css/style.default.css" rel="stylesheet">
        <link href="css/select2.css" rel="stylesheet" />
        <link rel="shortcut icon" href="images/favicon.ico">
        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <jsp:include page="faces/header.jsp" flush="true"></jsp:include>

            <section>
                <div class="mainwrapper">
                <% String menu = "contact_details";%>
                <%@include file="faces/menuleft-member.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="MyAccount">My Account</a></li>
                                </ul>
                                <h4>My Account</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">
                        
                        <form class="form-horizontal">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a href='?action=edit' class="btn btn-primary btn-xs pull-right"><span class="fa fa-edit"></span>&nbsp; Edit</a>
                                    <h4 class="panel-title">Account Settings</h4>
                                </div>
                                <div class="panel-body">
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Account ID</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.pad(Str.get(member.get("id")), 10, "0", Str.PAD_LEFT) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Account Name</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("full_name")) %>
                                        </div>
                                    </div>
                                        
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Password</b></div>
                                        <div class="col-sm-9 mb10">
                                            ********
                                        </div>
                                    </div>

                                </div><!-- panel-body -->
                            </div><!-- panel-default -->
                        </form>

                        <form class="form-horizontal">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a href='?action=edit' class="btn btn-primary btn-xs pull-right"><span class="fa fa-edit"></span>&nbsp; Edit</a>
                                    <h4 class="panel-title">Contact Information</h4>
                                </div>
                                <div class="panel-body">
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Full Name</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("full_name")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Address</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("address")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>City</b></div>
                                        <div class="col-sm-9 mb10">
                                           <%= Str.get(member.get("city")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>State</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("province")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Postal Code</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("postal_code")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Country</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("country")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Email</b></div>
                                        <div class="col-sm-9 mb10">
                                            <a href='mailto:<%= Str.get(member.get("email")) %>'><%= Str.get(member.get("email")) %></a>
                                        </div>
                                    </div>
                                        
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Phone Number</b></div>
                                        <div class="col-sm-9 mb10">
                                            <a href='tel:<%= Str.get(member.get("phone")) %>'><%= Str.get(member.get("phone")) %></a>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Company Name</b></div>
                                        <div class="col-sm-9 mb10">
                                            <%= Str.get(member.get("company_name")) %>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div class="col-sm-3 ta-right"><b>Website URL</b></div>
                                        <div class="col-sm-9 mb10">
                                            <a href='http://<%= Str.get(member.get("website")) %>'><%= Str.get(member.get("website")) %></a>
                                        </div>
                                    </div><!-- form-group -->

                                </div><!-- panel-body -->
                            </div><!-- panel-default -->
                        </form>
                                        
                                        
                        <form class="form-horizontal">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a href='?action=edit' class="btn btn-primary btn-xs pull-right"><span class="fa fa-edit"></span>&nbsp; Edit</a>
                                    <h4 class="panel-title">Local Currency Preference</h4>
                                </div>
                                <div class="panel-body">
                                    
                                    When you set a Payment Currency you will be able to view your eetimated bile and pay your AWS lnvoicee in your preferred currency.<br /><br />

                                    Who should use this service:<br />
                                    Many customers pay foreign tremection ﬂees when they use their credit cards for cross border transactions. We`ve worked hard to provide competitive ratee . but you should compare our rates with your credit card statements to determine if using our currency conversion service is right for you. Things you ahead know:<br /><br />

                                    <ul>
                                        <li>Marketplace and DevPay involcee are not currentiy eligible for this service and will be processed in USD</li>
                                        <li>To use this service your default payment method must be a Visa or MasterCard.</li>
                                        <li>Rates change daily. The rate applied to your invoice wil be the current rate at that time your invoice is created. You can always checkthe current rate on the Billng Console.</li>
                                    </ul>


                                </div><!-- panel-body -->
                            </div><!-- panel-default -->
                        </form>
                                                
                    </div><!-- contentpanel -->
                </div>
            </div><!-- mainwrapper -->
        </section>

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/jquery-ui-1.10.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/pace.min.js"></script>
        <script src="js/retina.min.js"></script>
        <script src="js/jquery.cookies.js"></script>
        <script src="js/custom.js"></script>
        
    </body>
</html>
