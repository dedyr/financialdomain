<%@page import="fx.lang.Dbl"%>
<%@page import="java.util.List"%>
<%@page import="fx.lang.Int"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map> list_asset = (List<Map>) request.getAttribute("list_asset");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Create Domain</title>

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
                <% String menu = "domain";%>
                <%@include file="faces/menuleft-masterdata.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-pencil"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="#">Master</a></li>
                                    <li><a href="#">Domain</a></li>
                                    <li>Create</li>
                                </ul>
                                <h4>Create Domain</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <form class="form-horizontal" action="Domain?action=create_save" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h4 class="panel-title">Domain Form</h4>
                                    <p>Details of domain</p>
                                </div>
                                <div class="panel-body">
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Asset:</label>
                                        <div class="col-sm-9">
                                            <select id="asset_id" required name="asset_id" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <% for(Map asset : list_asset) { %>
                                                <option value="<%= asset.get("id") %>">@<%= asset.get("name") + " - " + asset.get("btc") + " BTC" %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Domain:</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="domain" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Privacy Protection:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="privacy_protection" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Expire Date:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="expire_date" class="form-control datepicker" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Auto Renewal:</label>
                                        <div class="col-sm-9">
                                            <select id="auto_renewal" name="auto_renewal" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Transfer Lock:</label>
                                        <div class="col-sm-9">
                                            <select id="transfer_lock" name="transfer_lock" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Price /month:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="price_per_month" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Price /year:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="price_per_year" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Price Forever:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="price_forever" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Status:</label>
                                        <div class="col-sm-9">
                                            <select id="status" required name="status" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <option value="1">Active</option>
                                                <option value="0">Deactive</option>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->

                                </div><!-- panel-body -->
                                <div class="panel-footer">
                                    <button type="submit" class="btn btn-primary mr5">Save</button>
                                    <button type="reset" class="btn btn-default" onclick="document.location = 'Domain'">Cancel</button>
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
