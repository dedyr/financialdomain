/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDAO;
import fx.network.http.WebApplication;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);
        
        if(getParameter("action") == null) {
            forward("login.jsp");
        }
        else if(getString("action").equalsIgnoreCase("logout")) {
            sessionDestroy();
            redirect("Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
        }
        
        clear();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);

        String email = "";
        String password = "";
        try {
            email = getString("email");
            password = md5(getString("password"));
            
            // Login Process
            Map data = new MemberDAO().login(email, password);
            
            if(data != null) {
                if(data.size() > 0) {
                    sessionStart();
                    sessionPut("id", data.get("id"));
                    sessionPut("full_name", data.get("full_name"));
                    sessionPut("email", data.get("email"));
                }
            }
            // End Login Process
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            redirect("Dashboard?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
        }
    }

}
