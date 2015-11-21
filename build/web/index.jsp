<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map> list = (List<Map>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

            <title><% out.print(Config.TITLE); %></title>

        <link href="css/style.default.css" rel="stylesheet">
        <link href="css/morris.css" rel="stylesheet">
        <link href="css/select2.css" rel="stylesheet" />
        <link rel="shortcut icon" href="images/favicon.ico">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <% out.flush(); %>

    <body>

        <jsp:include page="faces/header.jsp" flush="true"></jsp:include>

            <section>
                <div class="mainwrapper">
                <% String menu = "dashboard";
                %>
                <%@include file="faces/menuleft-member.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href='Dashboard'>Dashboard</a></li>
                                </ul>
                                <h4>Dashboard</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <div class="row">
                            <div class="col-md-3 mb30">
                                <div id="donut-chart" class="flotGraph"></div><br />
                                Each hosted zone contains information about how you want route 53 to respond to DNS queries for one domain.
                            </div><!-- col-md-6 -->

                            <div class="col-md-3 mb30">
                                <div id="donut-chart-2" class="flotGraph"></div><br />
                                Health checks monitor your applications and web resources, and direct queries to healthy resources.
                            </div><!-- col-md-6 -->

                            <div class="col-md-3 mb30">
                                <div id="donut-chart-3" class="flotGraph"></div><br />
                                A domain is the name, such as example.com, that your users use to access your application.
                            </div><!-- col-md-6 -->

                            <div class="col-md-3 mb10">
                                <h5 class="lg-title"><b>Documents</b></h5>
                            </div>
                            <div class="col-md-3">
                                <a href='#'>Developer Guide</a><br />
                                <a href='#'>FAQs</a><br />
                                <a href='#'>Pricing</a><br />
                                <a href='#'>Forum</a><br />
                                <a href='#'>Request an increase in limit</a><br />
                            </div><!-- col-md-6 -->
                        </div><!-- row -->


                        <div class="row">
                            <div class="col-md-9 mb30">
                                <h5 class="lg-title mb10"><b>Alerts</b></h5>
                                <p class="mb15">

                                <table id="basicTable" class="table table-striped table-bordered responsive">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Asset</th>
                                        <th>Domain</th>
                                        <th>Privacy Protection</th>
                                        <th>Exp. Date</th>
                                        <th>Auto Renew</th>
                                        <th>Transfer Lock</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        for(Map row : list) {
                                    %>
                                    <tr>
                                        <td align='center'><%= row.get("id")%></td>
                                        <td><%= row.get("asset_name")%></td>
                                        <td><a href='http://<%= row.get("domain")%>'><%= row.get("domain")%></a></td>
                                        <td><%= row.get("privacy_protection")%></td>
                                        <td align="center"><%= row.get("expire_date") %></td>
                                        <td align='center'><%= (row.get("auto_renewal").equals(1) ? "<span class='fa fa-check'></span>" : "<span class='fa fa-times'></span>")%></td>
                                        <td align='center'><%= (row.get("transfer_lock").equals(1) ? "<span class='fa fa-check'></span>" : "<span class='fa fa-times'></span>")%></td>
                                        <td align='center'><%= (row.get("status").equals(1) ? "Available" : "Not Available")%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>

                                </p>
                            </div><!-- col-md-6 -->
                        </div><!-- row -->

                    </div><!-- contentpanel -->

                </div><!-- mainpanel -->
            </div><!-- mainwrapper -->
        </section>


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/pace.min.js"></script>
        <script src="js/retina.min.js"></script>
        <script src="js/jquery.cookies.js"></script>

        <script src="js/flot/jquery.flot.min.js"></script>
        <script src="js/flot/jquery.flot.resize.min.js"></script>
        <script src="js/flot/jquery.flot.spline.min.js"></script>
        <script src="js/jquery.sparkline.min.js"></script>
        <script src="js/morris.min.js"></script>
        <script src="js/raphael-2.1.0.min.js"></script>
        <script src="js/bootstrap-wizard.min.js"></script>
        <script src="js/select2.min.js"></script>

        <script src="js/custom.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {

                "use strict";

                var m1 = new Morris.Donut({
                    element: 'donut-chart',
                    data: [
                        {label: "Financial Domains", value: 21}
                    ]
                });

                var m2 = new Morris.Donut({
                    element: 'donut-chart-2',
                    data: [
                        {label: "Health Checks", value: 1}
                    ]
                });

                var m3 = new Morris.Donut({
                    element: 'donut-chart-3',
                    data: [
                        {label: "Crowdsaling Assets", value: 1}
                    ]
                });

                jQuery(window).resize(function () {
                    delay(function () {
                        m1.redraw();
                        m2.redraw();
                        m3.redraw();
                    }, 200);
                }).trigger('resize');

            });

        </script>

    </body>
</html>
