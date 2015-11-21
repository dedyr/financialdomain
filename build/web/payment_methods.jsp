<%@page import="fx.lang.Bool"%>
<%@page import="fx.lang.Int"%>
<%@page import="fx.lang.Str"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map> list_member_payment_cc = (List<Map>) request.getAttribute("list_member_payment_cc");
    List<Map> list_member_payment_btc = (List<Map>) request.getAttribute("list_member_payment_btc");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Review & Purchase</title>

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
                <% String menu = "payment_methods";%>
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
                                    <li><a href='PaymentMethods'>Payment Methods</a></li>
                                </ul>
                                <h4>Payment Methods</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <div class="fl-right">
                            Your payment currency is: <a href='#'>USD</a>
                            <button class="btn btn-primary btn-rounded btn-sm" onclick="window.location='?action=create_cc'"><span class="fa fa-money"></span>&nbsp; Make a Payment</button>
                        </div>

                        <br />

                        <table id="basicTable" class="table table-striped table-bordered responsive">
                            <thead>
                                <tr>
                                    <th>Credit Card</th>
                                    <th>Name on Card</th>
                                    <th>Expires</th>
                                    <th width="240">Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <% for(Map d : list_member_payment_cc) { %>
                                <tr>
                                    <td><%= d.get("credit_card") %></td>
                                    <td><%= d.get("name_on_card") %></td>
                                    <td align="center"><%= d.get("expires_on") %></td>
                                    <td align="center">
                                        <a href='?action=edit_cc&id=<%= d.get("id") %>' class="btn btn-primary btn-xs"><span class="fa fa-edit"></span>&nbsp; Edit</a>
                                        <a href='?action=delete_cc&id=<%= d.get("id") %>' onclick="return confirmDeleteCC();" class="btn btn-primary btn-xs"><span class="fa fa-times"></span>&nbsp; Delete</a>
                                        <% if(Int.get(d.get("is_default")) == 1) { %>
                                        <span class="fa fa-check"></span> Current Default
                                        <% }
                                        else {
                                        %>
                                        <a href='?action=make_cc_default&id=<%= d.get("id") %>' class="btn btn-dark btn-xs"><span class="fa fa-check-square-o"></span>&nbsp; Make Default</a>
                                        <% } %>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>


                        <br />

                        <div class="col-md-2">
                            <img src="images/credit-cards.png" width="150">
                        </div>
                        <div class="col-md-10">
                            <p><b>Credit Card</b></p>
                            <p>Amazon accepts all all major credit and debit cards</p>
                            <button class="btn btn-primary btn-xs"><span class="fa fa-plus"></span> Add to cart</button>
                        </div>

                        <br /><br /><br /><br /><br /><br /><br />
                        
                        <div class="fl-right">
                            <button class="btn btn-primary btn-rounded btn-sm" onclick="window.location='?action=create_btc'"><span class="fa fa-money"></span>&nbsp; Add Bitcoin Address</button>
                        </div>
                        
                        <h3 id='bitcoin'>Bitcoin Deposit</h3>

                        <table class="datatable table table-striped table-bordered responsive">
                            <thead>
                                <tr>
                                    <th>Bitcoin Address</th>
                                    <th>Name on Address</th>
                                    <th>Current Balance</th>
                                    <th width="240"></th>
                                </tr>
                            </thead>

                            <tbody>
                                <% for(Map d : list_member_payment_btc) { %>
                                <tr>
                                    <td><%= d.get("btc_address") %></td>
                                    <td><%= d.get("name_on_address") %></td>
                                    <td align="right"><%= d.get("current_ballance_btc") %> BTC</td>
                                    <td align="center">
                                        <a href='?action=edit_btc&id=<%= d.get("id") %>' class="btn btn-primary btn-xs"><span class="fa fa-edit"></span>&nbsp; Edit</a>
                                        <a href='?action=delete_btc&id=<%= d.get("id") %>' onclick="return confirmDeleteBTC();" class="btn btn-primary btn-xs"><span class="fa fa-times"></span>&nbsp; Delete</a>
                                        <% if(Int.get(d.get("is_default")) == 1) { %>
                                        <span class="fa fa-check"></span> Current Default
                                        <% }
                                        else {
                                        %>
                                        <a href='?action=make_btc_default&id=<%= d.get("id") %>' class="btn btn-dark btn-xs"><span class="fa fa-check-square-o"></span>&nbsp; Make Default</a>
                                        <% } %>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>


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
        
        <script type='text/javascript'>
            function confirmDeleteCC() {
                if(confirm("Are you sure want to delete credit card?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            function confirmDeleteBTC() {
                if(confirm("Are you sure want to delete bitcoin?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>

    </body>
</html>
