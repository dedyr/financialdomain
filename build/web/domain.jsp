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

        <title><% out.print(Config.TITLE); %> - Domain</title>

        <link href="css/style.default.css" rel="stylesheet">
        <link href="css/select2.css" rel="stylesheet" />
        <link href="css/style.datatables.css" rel="stylesheet">
        <link href="assets/plugins/datatables/responsive/1.0.1/css/dataTables.responsive.css" rel="stylesheet">
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
                <% String menu = "hosted_assets"; %>
                <%@include file="faces/menuleft-member.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-globe"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="#">Master</a></li>
                                    <li>Domain</li>
                                </ul>
                                <h4>List Domain</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <div class="panel panel-primary-head">

                            <a href='DomainSearch' class="btn btn-primary btn-rounded btn-sm"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp; Register Domain</a>
                            <a href='PaymentMethods' class="btn btn-primary btn-rounded btn-sm"><span class="glyphicon glyphicon-list"></span>&nbsp; List Domain to Sell</a>
                            
                            <div class="btn-group fl-right">
                                <button class="btn btn-default btn-rounded btn-sm"><span class="fa fa-question"></span></button>
                                <button onClick="document.location = 'Domain';" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-refresh"></span></button>
                            </div>

                            <br /><br>

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
                        </div><!-- panel -->

                        <br /><!-- panel --><!-- panel -->

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

        <script src="js/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/plug-ins/725b2a2115b/integration/bootstrap/3/dataTables.bootstrap.js"></script>
        <script src="assets/plugins/datatables/responsive/1.0.1/js/dataTables.responsive.js"></script>
        <script src="js/select2.min.js"></script>

        <script src="js/custom.js"></script>

    </body>
</html>