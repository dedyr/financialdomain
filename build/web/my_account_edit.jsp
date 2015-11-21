<%@page import="fx.lang.Str"%>
<%@page import="java.util.List"%>
<%@page import="fx.lang.Int"%>
<%@page import="java.util.Map"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map member = (Map) request.getAttribute("member");
    List<Map> list_member_type = (List<Map>) request.getAttribute("list_member_type");
    List<Map> list_country = (List<Map>) request.getAttribute("list_country");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="faces/meta.jsp" flush="true"></jsp:include>

        <title><% out.print(Config.TITLE); %> - Register Domain</title>

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
                <% String menu = "contact_details";%>
                <%@include file="faces/menuleft-member.jsp"%>

                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
                                    <li><a href="MyAccount">My Account</a></li>
                                </ul>
                                <h4>My Account</h4>
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->

                    <div class="contentpanel">

                        <form class="form-horizontal" action="MyAccount?action=edit_save" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                        <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                                    </div><!-- panel-btns -->
                                    <h4 class="panel-title">Account Settings</h4>
                                </div>
                                <div class="panel-body">
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Contact Type</label>
                                        <div class="col-sm-9">
                                            <select id="member_type_id" required name="member_type_id" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <% for(Map data : list_member_type) { %>
                                                <option<%= (Int.get(data.get("id")) == Int.get(member.get("member_type_id")) ? " selected='selected'" : "") %> value="<%= data.get("id") %>"><%= data.get("member_type") %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">First Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="first_name" id="first_name" value="<%= Str.get(member.get("first_name")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Middle Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="middle_name" id="middle_name" value="<%= Str.get(member.get("middle_name")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Last Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="last_name" id='last_name' value="<%= Str.get(member.get("last_name")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Organization</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="company_name" id='company_name' value="<%= Str.get(member.get("company_name")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" required name="email" id='email' value="<%= Str.get(member.get("email")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Password</label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password" id='password' class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Re-Type Password</label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password_2" id='password_2' class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Phone</label>
                                        <div class="col-sm-9">
                                            <input type="text" required name="phone" id='phone' value="<%= Str.get(member.get("phone")) %>" class="form-control" />
                                            <small>Enter country calling code and phone number</small>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Address</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="address" id='address' value="<%= Str.get(member.get("address")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Country</label>
                                        <div class="col-sm-9">
                                            <select id="country" name="country" data-placeholder="Choose One" class="width300">
                                                <option value="">Choose One</option>
                                                <% for(Map data : list_country) { %>
                                                <option<%= (Int.get(data.get("country")) == Int.get(member.get("country")) ? " selected='selected'" : "") %> value="<%= data.get("country") %>"><%= data.get("country") %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">State</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="province" id='province' value="<%= Str.get(member.get("province")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">City</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="city" id='city' value="<%= Str.get(member.get("city")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Postal / Zip Code</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="postal_code" id='postal_code' value="<%= Str.get(member.get("postal_code")) %>" class="form-control" />
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Privacy Protection</label>
                                        <div class="col-sm-9">
                                            <div class="rdio rdio-primary">
                                                <input type="radio"<%= (Int.get(member.get("privacy_protection")) == 0 ? " checked='checked'" : "") %> required name="privacy_protection" value="0" id="privacy_protection_1" onclick='return privacy(this.value);'>
                                                <label for="privacy_protection_1">Hide contact information</label>
                                            </div>
                                            <div class="rdio rdio-primary">
                                                <input type="radio"<%= (Int.get(member.get("privacy_protection")) == 1 ? " checked='checked'" : "") %> required name="privacy_protection" value="1" id="privacy_protection_2" onclick='return privacy(this.value);'>
                                                <label for="privacy_protection_2">Don't hide contact information</label>
                                            </div>
                                            
                                            <div id="privacy_information">
                                                
                                            </div>
                                        </div>
                                    </div><!-- form-group -->
                                    
                                    

                                </div><!-- panel-body -->
                                <div class="panel-footer ta-right">
                                    <button type="reset" class="btn btn-default" onclick="document.location = 'Dashboard'">Cancel</button>
                                    <button type="reset" class="btn btn-default" onclick="document.location = 'DomainSearch'">Back</button>
                                    <button type="submit" class="btn btn-primary" onclick='return validateForm();'>Continue</button>
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
        
        <script type='text/javascript'>
            function validateForm() {
                if(document.getElementById('password').value != '' && document.getElementById('password_2').value != '') {
                    if(document.getElementById('password').value != document.getElementById('password_2').value) {
                        alert('Password doesn`t match. Re-type password.');
                        document.getElementById('password').focus();
                        return false;
                    }
                    else {
                        return true;
                    }
                }
                else {
                    return true;
                }
            }
        </script>

    </body>
</html>
