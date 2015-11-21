<%@page import="fx.lang.Int"%>
<%@page import="fx.lang.Dbl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String domain = (String) request.getAttribute("domain");
    Integer asset_id = (Integer) request.getAttribute("asset_id");
    List<Map> list_domain = (List<Map>) request.getAttribute("list_domain");
    List<Map> list_asset_filter = (List<Map>) request.getAttribute("list_asset_filter");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Domain Search</title>

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
                <% String menu = "domain_search";%>
                <%@include file="faces/menuleft-member-domain.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-search"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="#">Domain</a></li>
                                    <li>Search</li>
                                </ul>
                                <h4>Domain Search</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-btns">
                                    <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                    <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                </div><!-- panel-btns -->
                                <h3 class="panel-title">Choose a Asset Name</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" method="get">
                                    <div class='form-group mb0'>
                                        <div class="col-sm-6">
                                            <input type="text" name="domain" placeholder="Search Domain..." value="<%= domain %>" class="form-control input-sm" />
                                        </div>
                                        <div class="col-sm-4">
                                            <select id="asset_id" name="asset_id" data-placeholder="Choose Asset" class="width300">
                                                <option value="">-- All Asset --</option>
                                                <% for(Map asset : list_asset_filter) {%>
                                                <option<%= (asset_id == Int.get(asset.get("id")) ? " selected='selected'" : "")%> value="<%= asset.get("id")%>">@<%= asset.get("name") + " - " + asset.get("btc") + " BTC"%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-primary btn-block"><span class="fa fa-search"></span> Check</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>

                        <% if(!domain.equalsIgnoreCase("")) {%>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-btns">
                                    <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                    <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                </div><!-- panel-btns -->
                                <h3 class="panel-title">Avaliability for '@<%= domain %>'</h3>
                            </div>
                            <div class="panel-body">

                                <table class="datatable table table-striped table-bordered responsive">
                                    <thead>
                                        <tr>
                                            <th>Domain Name</th>
                                            <th>Register Status</th>
                                            <th>Price /1 Year</th>
                                            <th width="40">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <% if(list_domain.size() > 0) {%>
                                            <td><%= domain %></td>
                                            <td align="center"><span class="fa fa-check"></span> Available</td>
                                            <td align="right">$<%= list_domain.get(0).get("price_per_year")%></td>
                                            <td><button class="btn btn-primary btn-xs" onclick="return addToCart(<%= list_domain.get(0).get("id")%>);"<%= (list_domain.get(0).get("has_request").equals(true) ? " - disabled='disabled'" : "") %>><span class="fa fa-plus"></span>&nbsp; Add to cart</button></td>
                                            <% }
                                            else {%>
                                            <td><%= domain %></td>
                                            <td align="center"><span class="fa fa-times"></span> Not Available</td>
                                            <td align="right">-</td>
                                            <td>-</td>
                                            <% } %>
                                        </tr>
                                    </tbody>
                                </table>

                            </div><!-- panel-body -->
                        </div><!-- panel -->


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-btns">
                                    <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                    <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                </div><!-- panel-btns -->
                                <h3 class="panel-title">Avaliability for popular TLDs</h3>
                            </div>
                            <div class="panel-body">

                                <table class="datatable table table-striped table-bordered responsive">
                                    <thead>
                                        <tr>
                                            <th>Asset Name</th>
                                            <th>Asset Platform</th>
                                            <th>Status</th>
                                            <th class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on top">Forever Price</th>
                                            <th width="40">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <% boolean has_request = false; %>
                                        <% for(Map d : list_domain) { %>
                                        <tr>
                                            <% if(d.get("has_request").equals(true)) { has_request = true; } %>
                                            <td><%= d.get("domain")%><%= (d.get("has_request").equals(true) ? " - <small>In Cart</small>" : "") %></td>
                                            <td align="center">@<%= d.get("asset_name")%></td>
                                            <td align="center"><span class="fa fa-check"></span> Available</td>
                                            <td align="right">$<%= d.get("price_per_year")%></td>
                                            <td><button class="btn btn-primary btn-xs" onclick="return addToCart(<%= d.get("id")%>);"<%= (d.get("has_request").equals(true) ? " - disabled='disabled'" : "") %>><span class="fa fa-plus"></span>&nbsp; Add to cart</button></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>

                            </div><!-- panel-body -->
                        </div><!-- panel -->
                        
                        <% if(has_request) { %>
                        <br />
                        <button class="btn btn-primary center-block" onclick="document.location='./ContactDetails'"><span class="fa fa-check"></span>&nbsp; Continue Order</button>
                        <% } %>

                        <% }%>

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
        
        <script type="text/javascript">
            function addToCart(domainId) {
                document.location = './DomainSearch?domain=<%= domain %>&asset_id=<%= asset_id %>&domain_id=' + domainId + '&action=add_to_cart';
                return false;
            }
        </script>

    </body>
</html>
