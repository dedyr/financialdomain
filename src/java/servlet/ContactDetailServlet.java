/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.CountryDAO;
import dao.MemberDAO;
import dao.MemberRequestDAO;
import dao.MemberTypeDAO;
import fx.lang.Str;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "ContactDetailsServlet", urlPatterns = {"/ContactDetails"})
public class ContactDetailServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);

        String action = getString("action");
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {

            int memberId = auth.getId();

            setAttribute("member", new MemberDAO().findById(memberId));
            setAttribute("count_order", new MemberRequestDAO().countOrder(memberId));
            setAttribute("list_member_type", new MemberTypeDAO().findAll());
            setAttribute("list_country", new CountryDAO().findAll());
            forward("contact_details.jsp");

        }
        else {
            Auth.doLogin(response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);
        
        String action = getString("action");
        Auth auth = new Auth(request);

        if(action.equalsIgnoreCase("complete_register")) {
            MemberDAO member = new MemberDAO();
            member.set("id", auth.getId());
            member.set("first_name", getString("first_name"));
            member.set("middle_name", getString("middle_name"));
            member.set("last_name", getString("last_name"));
            member.set("full_name", Str.trim(getString("first_name") + " " + getString("middle_name") + " " + getString("last_name").replace("  ", " ")));
            member.set("company_name", getString("company_name"));
            member.set("email", getString("email"));
            member.set("phone", getString("phone"));
            member.set("address", getString("address"));
            member.set("country", getString("country"));
            member.set("province", getString("province"));
            member.set("city", getString("city"));
            member.set("postal_code", getString("postal_code"));
            member.set("privacy_protection", getInt("privacy_protection"));
            member.update();
            
            redirect("ReviewAndPurchase");
        }
    }

}
