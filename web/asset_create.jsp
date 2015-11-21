<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Create Asset</title>

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
                <% String menu = "asset";%>
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
                                    <li><a href="#">Asset</a></li>
                                    <li>Create</li>
                                </ul>
                                <h4>Create Asset</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <form class="form-horizontal" action="Asset?action=create_save" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h4 class="panel-title">Asset Form</h4>
                                    <p>Details of asset</p>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Name:</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="name" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Address</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="address" rows="5"></textarea>
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Phone:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="phone" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Fax:</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="fax" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Email:</label>
                                        <div class="col-sm-9">
                                            <input type="email" required name="email" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Website:</label>
                                        <div class="col-sm-9">
                                            <input type="url" required name="website" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Note</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="note" rows="10"></textarea>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Bits:</label>
                                        <div class="col-sm-9">
                                            <input type="number" required name="bits" min='0' class="form-control" />
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
                                    <button type="reset" class="btn btn-default" onclick="document.location = 'Asset'">Cancel</button>
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
