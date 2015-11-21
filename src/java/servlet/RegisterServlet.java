/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDAO;
import fx.lang.Str;
import fx.network.http.WebApplication;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        init(request, response);
        
        String action = getString("action");
        
        if(action.equalsIgnoreCase("")) {
            sessionDestroy();
            forward("signup.jsp");
        }
        else if(action.equalsIgnoreCase("checkAvailable")) {
            String email = getString("email");
            
            setContentType("text/html;charset=UTF-8");
            
            print(new MemberDAO().avaliable(email));
            flush();
        }
        else if(action.equalsIgnoreCase("logout")) {
            redirect("Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);
        
        String first_name = "";
        String last_name = "";
        String email = "";
        String password = "";
        try {
            first_name = getString("first_name");
            last_name = getString("last_name");
            email = getString("email");
            password = md5(getString("password"));
            
            Map member = new HashMap();
            member.put("member_type_id", 1);
            member.put("full_name", Str.fit(first_name + " " + last_name));
            member.put("first_name", first_name);
            member.put("last_name", last_name);
            member.put("email", email);
            member.put("password", password);
            member.put("register_date", date("yyyy-MM-dd HH:mm:ss"));
            member.put("last_update_date", date("yyyy-MM-dd HH:mm:ss"));
            member.put("last_login_date", date("yyyy-MM-dd HH:mm:ss"));
            member.put("status", 1);
            new MemberDAO().save(member);
            
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
