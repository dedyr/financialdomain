<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>
        
        <title><% out.print(Config.TITLE); %></title>

        <link href="css/style.default.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/favicon.ico">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head><% out.flush(); %>

    <body class="signin">


        <section>

            <div class="panel panel-signin">
                <div class="panel-body">
                    <div class="logo text-center">
                        <img src="images/logo-primary.png">
                    </div>
                    <br />
                    <h4 class="text-center mb5">Already a Member?</h4>
                    <p class="text-center">Sign in to your account</p>

                    <div class="mb30"></div>

                    <form action="Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da" method="post">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" required autocomplete="off" name="email" id="email" class="form-control" placeholder="Email">
                        </div><!-- input-group -->
                        <div class="input-group mb15">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" required autocomplete="off" name="password" id="password" class="form-control" placeholder="Password">
                        </div><!-- input-group -->

                        <div class="clearfix">
                            <div class="pull-left">
                                <div class="ckbox ckbox-primary mt10">
                                    <input type="checkbox" id="rememberMe" value="1">
                                    <label for="rememberMe">Remember Me</label>
                                </div>
                            </div>
                            <div class="pull-right">
                                <button type="submit" class="btn btn-primary">Sign In <i class="fa fa-angle-right ml5"></i></button>
                            </div>
                        </div>                      
                    </form>

                </div><!-- panel-body -->
                <div class="panel-footer">
                    <a href="Register?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da" class="btn btn-primary btn-block">Not yet a Member? Create Account Now</a>
                </div><!-- panel-footer -->
            </div><!-- panel -->

        </section>

    </body>
</html><% out.flush(); %>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/pace.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/custom.js"></script><% out.flush();%>