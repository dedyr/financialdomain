<%@page import="fx.lang.Int"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer memberId = (Integer) request.getAttribute("memberId");
    Map member_payment_btc = (Map) request.getAttribute("member_payment_btc");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Edit Bitcoin Address</title>

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
                <% String menu = "payment_methods";%>
                <%@include file="faces/menuleft-member-payment-methods.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-bitcoin"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href='PaymentMethods'>Payment Methods</a></li>
                                    <li><a href='#'>Bitcoin</a></li>
                                    <li>Edit</li>
                                </ul>
                                <h4>Edit Bitcoin Address</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <form class="form-horizontal" action="PaymentMethods?action=edit_btc_save" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h4 class="panel-title">Bitcoin Address Form</h4>
                                    <p>Details of bitcoin address</p>
                                </div>
                                <div class="panel-body">
                                    <input type="hidden" name="id" value="<%= member_payment_btc.get("id") %>" />
                                    <input type="hidden" name="member_id" value="<%= member_payment_btc.get("member_id") %>" />
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Bitcoin Address</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="btc_address" value="<%= member_payment_btc.get("btc_address") %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Name on Address</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="name_on_address" value="<%= member_payment_btc.get("name_on_address") %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Current Ballance</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="current_ballance" value="<%= member_payment_btc.get("current_ballance") %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Status</label>
                                        <div class="col-sm-9">
                                            <div class="ckbox ckbox-primary">
                                                <input type="checkbox"<%= (Int.get(member_payment_btc.get("is_default")) == 1 ? " checked='checked'" : "") %> value="1" name="is_default" id="is_default">
                                                <label for="is_default">Is Default</label>
                                            </div>
                                        </div>
                                    </div><!-- form-group -->

                                </div><!-- panel-body -->
                                <div class="panel-footer ta-right">
                                    <button type="reset" class="btn btn-default" onclick="document.location = 'PaymentMethods'">Cancel</button>
                                    <button type="submit" class="btn btn-primary mr5">Update</button>
                                </div><!-- panel-footer -->
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
