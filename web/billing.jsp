<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %></title>

        <link href="css/style.default.css" rel="stylesheet">
        <link href="css/morris.css" rel="stylesheet">
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
                <% String menu = "billing";
                %>
                <%@include file="faces/menuleft-member-payment-methods.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href='Billing'>Billing</a></li>
                                </ul>
                                <h4>Billing</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <div class="row">
                            <div class="col-md-6 mb30">
                                <h5 class="lg-title mb10"><b>Spend Summary</b></h5>
                                <p class="mb15">Welcome to the AWS Account Billing Console. Your last-month, month-to-date, and month-end forecasted costs appear below. <br /><br />

                                    <em>Current Month-to-Date ballance for August 2015</em>
                                <h1>$758.82</h1><br />
                                </p>
                                <div id="barchart" class="flotGraph"></div><br />
                                Important Information about these costs

                                <span class="fl-right">
                                    <input id="checkImportant" type="checkbox" value="1">&nbsp; 
                                    <label for="checkImportant">Include Subscription Charges</label>
                                </span>
                            </div><!-- col-md-6 -->
                            <div class="col-md-6 mb30">
                                <h5 class="lg-title mb10"><b>Month-to-Date By Service</b></h5>
                                <p class="mb15">The chart below shows the proportion of costs spent for each service you use</p>
                                <div id="piechart" class="flotGraph"></div>
                            </div><!-- col-md-6 -->
                        </div><!-- row -->


                        <div class="row">
                            <div class="col-md-6 mb30">
                                <h5 class="lg-title mb10"><b>Alert Notification</b></h5>
                                <p class="mb15">Monitor your estimated charges. <a href='#'>Enable Now</a> to begin setting billing alerts that automaticaly e-mail you when charges reach a threshold you define.</p>
                            </div><!-- col-md-6 -->
                            <div class="col-md-6 mb30">
                                <h5 class="lg-title mb10"><b>Month-to-Date Top Services By Spend</b></h5>
                                <p class="mb15">

                                <div class="table-responsive">
                                    <table class="table table-hover mb30">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Services</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>EC2</td>
                                                <td align='right'>$540.24</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Route53DomainRegSvc</td>
                                                <td align='right'>$64.00</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>RDS</td>
                                                <td align='right'>$45.74</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Wordpress powered by AMIMOTO (HHVM)</td>
                                                <td align='right'>$30.24</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Other Services</td>
                                                <td align='right'>$41.69</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><b>TAX</b></td>
                                                <td align='right'><b>$36.91</b></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><b>TOTAL</b></td>
                                                <td align='right'><b>$758.82</b></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

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
        <script src="js/flot/jquery.flot.symbol.min.js"></script>
        <script src="js/flot/jquery.flot.crosshair.min.js"></script>
        <script src="js/flot/jquery.flot.categories.min.js"></script>
        <script src="js/flot/jquery.flot.pie.min.js"></script>
        <script src="js/morris.min.js"></script>
        <script src="js/raphael-2.1.0.min.js"></script>
        <script src="js/jquery.sparkline.min.js"></script>

        <script src="js/custom.js"></script>

        <script type="text/javascript">
            jQuery(document).ready(function () {

                "use strict";

                function showTooltip(x, y, contents) {
                    jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css({
                        position: 'absolute',
                        display: 'none',
                        top: y + 5,
                        left: x + 5
                    }).appendTo("body").fadeIn(200);
                }

                /***** BAR CHART *****/

                var bardata = [["Last Month (July 2015)", 603.65], ["Month-to-Date (August 2015)", 758.82], ["Forecast (August 2015)", 825.42]];

                jQuery.plot("#barchart", [bardata], {
                    series: {
                        lines: {
                            lineWidth: 1
                        },
                        bars: {
                            show: true,
                            barWidth: 0.5,
                            align: "center",
                            lineWidth: 0,
                            fillColor: "#FF9900"
                        }
                    },
                    grid: {
                        borderColor: '#ddd',
                        borderWidth: 1,
                        labelMargin: 10
                    },
                    xaxis: {
                        mode: "categories",
                        tickLength: 0
                    }
                });


                /***** PIE CHART *****/

                var piedata = [
                    {label: "EC2", data: [[1, 540.24]], color: '#FF9900'},
                    {label: "Route53DomainRegSvc", data: [[1, 64.00]], color: '#1CAF9A'},
                    {label: "RDS", data: [[1, 45.74]], color: '#F0AD4E'},
                    {label: "Wordpress powered by AMIMOTO (HHVM)", data: [[1, 30.24]], color: '#D9534F'},
                    {label: "Other Services", data: [[1, 41.69]], color: '#5BC0DE'}
                ];

                jQuery.plot('#piechart', piedata, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            label: {
                                show: false,
                                radius: 2 / 3,
                                formatter: labelFormatter,
                                threshold: 0.1
                            }
                        }
                    },
                    grid: {
                        hoverable: true,
                        clickable: true
                    }
                });

                function labelFormatter(label, series) {
                    return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
                }


            });

        </script>

    </body>
</html>
