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

            <div class="panel panel-signup">
                <div class="panel-body">
                    <div class="logo text-center">
                        <img src="images/logo-primary.png">
                    </div>
                    <br />
                    <h4 class="text-center mb5">Create a new account</h4>
                    <p class="text-center">Please enter your credentials below</p>

                    <div class="mb30"></div>
                    
                    <div class="alert alert-danger" style="display:none;" id="p_email_error">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <strong>Email</strong> is not available.
                    </div>

                    <form id="form" action="Register?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da" method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group mb15">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" autocomplete="off" class="form-control" name="first_name" required placeholder="Enter Firstname">
                                </div><!-- input-group -->
                            </div>
                            <div class="col-sm-6">
                                <div class="input-group mb15">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" autocomplete="off" class="form-control" name="last_name" required placeholder="Enter Lastname">
                                </div><!-- input-group -->
                            </div>
                        </div><!-- row -->
                        <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group mb15" id="p_email">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input type="email" autocomplete="off" class="form-control" id="email" name="email" onchange="return checkAvailable(this.value);" onblur="return checkAvailable(this.value);" required placeholder="Enter Email Address">
                                </div><!-- input-group -->
                            </div>
                            <div class="col-sm-6">
                                <div class="input-group mb15">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" autocomplete="off" class="form-control" name="password" required placeholder="Enter Password">
                                </div><!-- input-group -->
                            </div>
                        </div><!-- row -->
                        <br />
                        <div class="clearfix">
                            <div class="pull-left">
                                <div class="ckbox ckbox-primary mt5">
                                    <input type="checkbox" onclick="return agreeTAC(this);" id="agree" value="1">
                                    <label for="agree">I agree with <a href="#">Terms and Conditions</a></label>
                                </div>
                            </div>
                            <div class="pull-right">
                                <button id="submit" disabled type="submit" onclick="return validateForm();" class="btn btn-primary">Create New Account <i class="fa fa-angle-right ml5"></i></button>
                            </div>
                        </div>
                    </form>

                </div><!-- panel-body -->
                <div class="panel-footer">
                    <a href="Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da" class="btn btn-primary btn-block">Already a Member? Sign In</a>
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
<script src="js/custom.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        
    });
    function isTrue() {
        jQuery("#p_email").removeClass("has-error");
        jQuery("#p_email_error").fadeOut(500);
    }
    function isError() {
        jQuery("#p_email").addClass("has-error");
        jQuery("#p_email_error").fadeIn('slow');
    }
    
    function checkAvailable(email) {
        if(email == null) {
            isTrue();
        }
        else {
            jQuery.get("Register?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da&action=checkAvailable&email=" + escape(email), function(data) {
                if(data == "false") {
                    isError();
                }
                else {
                    isTrue();
                }
            });
        }
    }
    
    function agreeTAC(status) {
        if(status.checked == true && jQuery('#email').val() != "" && !jQuery("#p_email").hasClass("has-error")) {
            jQuery("#submit").removeAttr("disabled");
        }
        else {
            jQuery("#submit").attr("disabled","disabled");
        }
    }
    
    function validateForm() {
        if(!jQuery("#p_email").hasClass("has-error")) {
            document.getElementsById('form').submit();
            return true;
        }
        else {
            return false;
        }
    }
</script>
<% out.flush();%>