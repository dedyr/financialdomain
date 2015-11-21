<%@page import="fx.lang.Int"%>
<%@page import="fx.lang.Str"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map member = (Map) request.getAttribute("member");
    List<Map> list_order = (List<Map>) request.getAttribute("list_order");
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
                <% String menu = "review_and_purchase";%>
                <%@include file="faces/menuleft-member-domain.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="#">Domain</a></li>
                                    <li><a href="#">Contact Details</a></li>
                                    <li>Review &amp; Purchase</li>
                                </ul>
                                <h4>Review details and complete your purchase</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <p>
                            When you complete your purchase, we'll assign the following contacts to all of the domains in your shopping cart.
                        </p>

                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Registrant Contacts</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        <%= Str.get(member.get("full_name"))%><br />
                                        <a href='mailto:<%= Str.get(member.get("email"))%>'><%= Str.get(member.get("email"))%></a><br />
                                        <a href='tel:<%= Str.get(member.get("phone"))%>'><%= Str.get(member.get("phone"))%></a><br />
                                        <%= Str.get(member.get("address"))%><br />
                                        <%= Str.get(member.get("country"))%><br />
                                        <%= Str.get(member.get("province"))%><br />
                                        <%= Str.get(member.get("city"))%><br />
                                        <%= Str.get(member.get("postal_code"))%><br />
                                        <%= (Int.get(member.get("privacy_protection")) == 1 ? "Privacy Protected" : "")%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Administrative Contacts</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        <%= Str.get(member.get("full_name"))%><br />
                                        <a href='mailto:<%= Str.get(member.get("email"))%>'><%= Str.get(member.get("email"))%></a><br />
                                        <a href='tel:<%= Str.get(member.get("phone"))%>'><%= Str.get(member.get("phone"))%></a><br />
                                        <%= Str.get(member.get("address"))%><br />
                                        <%= Str.get(member.get("country"))%><br />
                                        <%= Str.get(member.get("province"))%><br />
                                        <%= Str.get(member.get("city"))%><br />
                                        <%= Str.get(member.get("postal_code"))%><br />
                                        <%= (Int.get(member.get("privacy_protection")) == 1 ? "Privacy Protected" : "")%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Technical Contacts</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        <%= Str.get(member.get("full_name"))%><br />
                                        <a href='mailto:<%= Str.get(member.get("email"))%>'><%= Str.get(member.get("email"))%></a><br />
                                        <a href='tel:<%= Str.get(member.get("phone"))%>'><%= Str.get(member.get("phone"))%></a><br />
                                        <%= Str.get(member.get("address"))%><br />
                                        <%= Str.get(member.get("country"))%><br />
                                        <%= Str.get(member.get("province"))%><br />
                                        <%= Str.get(member.get("city"))%><br />
                                        <%= Str.get(member.get("postal_code"))%><br />
                                        <%= (Int.get(member.get("privacy_protection")) == 1 ? "Privacy Protected" : "")%>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-sm-3 fl-right">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Shopping Cart</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        <b>One time fees</b>

                                        <hr size='1' />

                                        <small>
                                            <% int total_price = 0; %>
                                            <% for(Map d : list_order) {%>
                                            <b><%= d.get("domain")%></b> @<%= d.get("asset_name")%><br />
                                            1 Year Registration: $<%= d.get("price_per_year")%><br />
                                            <% total_price += Int.get(d.get("price_per_year")); %>
                                            <% }%>

                                            <hr size='1'>

                                            <b>SUBTOTAL: </b><br />
                                            $<%= total_price %>
                                        </small>

                                        <hr size='1'>

                                        <small>
                                            <b>Monthly Fees for DNS Management</b><br />
                                            <a href='#'>View pricing details</a> for Route 53 queries and for the hosted zone that we create for each new domain.
                                        </small>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-9">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Managing DNS for Your New Domain</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        To make it easier for you to use Route 53 as the DNS service for your new domain, we'll automatically create a hosted zone. Thats where you store information about how to route traffict for your domain.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-9">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h3 class="panel-title">Terms and Conditions</h3>
                                </div>
                                <div class="panel-body">
                                    <div class='form-group mb0'>
                                        AWS does not register or host domain names. We've partnered with Grandi. <br /><br />

                                        <b>Operation is Powered By:</b> Grandi
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class='col-sm-12'>
                            <input type="checkbox" value="1" id='check_agree' onclick='return agree(this.checked);'> <label for='check_agree'>I have read and agree to the <a href='#'>AWS Domain Name Registration Agreement</a>.</label><br /><br />
                        </div>

                        <div class="panel-footer col-sm-12 ta-right">
                            <button type="reset" class="btn btn-default" onclick="document.location = 'Dashboard'">Cancel</button>
                            <button type="reset" class="btn btn-default" onclick="document.location = 'ContactDetails'">Back</button>
                            <button type="button" id='btnComplete' class="btn btn-primary" disabled='disabled' onclick="return completePurchase();">Complete Purchase</button>
                        </div><!-- panel-footer -->


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
            function agree(status) {
                if(status == true) {
                    jQuery('#btnComplete').removeAttr('disabled');
                }
                else {
                    jQuery('#btnComplete').attr('disabled','disabled');
                }
            }
            function completePurchase() {
                alert('FINISH TO PURCHASE THE ASSETS\n\nYou have successfully bought <% for(Map d : list_order) { out.print(d.get("domain") + " @" + d.get("asset_name") + "\\n"); } %>\nTo reflect we need 30 minutes or so. And you can also check your asset on: <% for(Map d : list_order) { out.print(d.get("asset_name") + "\\n"); } %>');
                document.location = 'PaymentMethods';
            }
        </script>

    </body>
</html>
