/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.CountryDAO;
import dao.MemberDAO;
import dao.MemberTypeDAO;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/MyAccount"})
public class AccountServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);
        
        Auth auth = new Auth(request);
        int memberId = auth.getId();

        if(Auth.isValid(request)) {
            
            String action = getString("action");

            if(action.equalsIgnoreCase("edit")) {
                setAttribute("member", new MemberDAO().findById(memberId));
                setAttribute("list_member_type", new MemberTypeDAO().findAll());
                setAttribute("list_country", new CountryDAO().findAll());
                forward("my_account_edit.jsp");
            }
            else {
                setAttribute("member", new MemberDAO().findById(memberId));
                forward("my_account.jsp");
            }

        }
        else {
            Auth.doLogin(response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);
        
        Auth.onlyLogged(request, response);
        
        String action = getString("action");
        Auth auth = new Auth(request);

        if(action.equalsIgnoreCase("edit_save")) {
            MemberDAO member = new MemberDAO();
            member.set("id", auth.getId());
            member.set("first_name", getString("first_name"));
            member.set("middle_name", getString("middle_name"));
            member.set("last_name", getString("last_name"));
            member.set("full_name", getString("first_name") + " " + getString("middle_name") + " " + getString("last_name").replace("  ", " "));
            member.set("company_name", getString("company_name"));
            member.set("email", getString("email"));
            member.set("phone", getString("phone"));
            member.set("address", getString("address"));
            member.set("country", getString("country"));
            member.set("province", getString("province"));
            member.set("city", getString("city"));
            member.set("postal_code", getString("postal_code"));
            member.set("privacy_protection", getInt("privacy_protection"));
            member.set("website", getString("website"));
            
            if(getParameter("password") != null) {
                member.set("password", md5(getString("password")));
            }
            
            member.update();
            
            redirect("MyAccount");
        }
    }

}
