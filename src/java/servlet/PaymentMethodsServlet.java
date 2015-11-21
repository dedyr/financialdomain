/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.MemberPaymentBTCDAO;
import dao.MemberPaymentCCDAO;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "PaymentMethods", urlPatterns = {"/PaymentMethods"})
public class PaymentMethodsServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);

        String action = getString("action");
        int id = getInt("id");
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {

            int memberId = auth.getId();

            // Credit Card
            if(action.equalsIgnoreCase("create_cc")) {
                setAttribute("member_id", memberId);
                forward("payment_methods_create_cc.jsp");
            }
            else if(action.equalsIgnoreCase("edit_cc")) {
                setAttribute("member_id", memberId);
                setAttribute("member_payment_cc", new MemberPaymentCCDAO().findById(id));
                forward("payment_methods_edit_cc.jsp");
            }
            else if(action.equalsIgnoreCase("delete_cc")) {
                new MemberPaymentCCDAO().delete(id);
                redirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("make_cc_default")) {
                new MemberPaymentCCDAO().makeDefault(memberId, id);
                redirect("PaymentMethods");
            }
            // Bitcoin
            if(action.equalsIgnoreCase("create_btc")) {
                setAttribute("member_id", memberId);
                forward("payment_methods_create_btc.jsp");
            }
            else if(action.equalsIgnoreCase("edit_btc")) {
                setAttribute("member_id", memberId);
                setAttribute("member_payment_btc", new MemberPaymentBTCDAO().findById(id));
                forward("payment_methods_edit_btc.jsp");
            }
            else if(action.equalsIgnoreCase("delete_btc")) {
                new MemberPaymentBTCDAO().delete(id);
                redirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("make_btc_default")) {
                new MemberPaymentBTCDAO().makeDefault(memberId, id);
                redirect("PaymentMethods");
            }
            // Default
            else {
                setAttribute("list_member_payment_cc", new MemberPaymentCCDAO().findByMemberId(memberId));
                setAttribute("list_member_payment_btc", new MemberPaymentBTCDAO().findByMemberId(memberId));
                forward("payment_methods.jsp");
            }

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

        if(Auth.isValid(request)) {
            
            // Credit Card
            if(action.equalsIgnoreCase("create_cc_save")) {
                
                int is_default = getInt("is_default");
                int memberId = getInt("member_id");

                MemberPaymentCCDAO memberCC = new MemberPaymentCCDAO();

                if(is_default == 1) {
                    memberCC.makeAllNoDefault(memberId);
                }

                memberCC.set("member_id", memberId);
                memberCC.set("credit_card", getString("credit_card"));
                memberCC.set("name_on_card", getString("name_on_card"));
                memberCC.set("expires_on", getString("expires_on"));
                memberCC.set("is_default", is_default);
                memberCC.save();

                redirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("edit_cc_save")) {
                
                int is_default = getInt("is_default");
                int memberId = getInt("member_id");

                MemberPaymentCCDAO memberCC = new MemberPaymentCCDAO();

                if(is_default == 1) {
                    memberCC.makeAllNoDefault(memberId);
                }

                memberCC.set("id", getInt("id"));
                memberCC.set("member_id", memberId);
                memberCC.set("credit_card", getString("credit_card"));
                memberCC.set("name_on_card", getString("name_on_card"));
                memberCC.set("expires_on", getString("expires_on"));
                memberCC.set("is_default", is_default);
                memberCC.update();
                redirect("PaymentMethods");
            }
            // Bitcoin
            if(action.equalsIgnoreCase("create_btc_save")) {
                
                int is_default = getInt("is_default");
                int memberId = getInt("member_id");

                MemberPaymentBTCDAO memberBTC = new MemberPaymentBTCDAO();

                if(is_default == 1) {
                    memberBTC.makeAllNoDefault(memberId);
                }

                memberBTC.set("member_id", memberId);
                memberBTC.set("btc_address", getString("btc_address"));
                memberBTC.set("name_on_address", getString("name_on_address"));
                memberBTC.set("current_ballance", getDbl("current_ballance"));
                memberBTC.set("is_default", is_default);
                memberBTC.save();

                redirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("edit_btc_save")) {
                
                int is_default = getInt("is_default");
                int memberId = getInt("member_id");

                MemberPaymentBTCDAO memberBTC = new MemberPaymentBTCDAO();

                if(is_default == 1) {
                    memberBTC.makeAllNoDefault(memberId);
                }

                memberBTC.set("id", getInt("id"));
                memberBTC.set("member_id", memberId);
                memberBTC.set("btc_address", getString("btc_address"));
                memberBTC.set("name_on_address", getString("name_on_address"));
                memberBTC.set("current_ballance", getDbl("current_ballance"));
                memberBTC.set("is_default", is_default);
                memberBTC.update();
                redirect("PaymentMethods");
            }
        }
        else {
            Auth.doLogin(response);
        }

    }

}
