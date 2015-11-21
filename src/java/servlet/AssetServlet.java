/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AssetDAO;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "AssetServlet", urlPatterns = {"/Asset"})
public class AssetServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);

        String action = getString("action");
        int id = getInt("id");

        if(Auth.isValid(request)) {

            if(action.equalsIgnoreCase("create")) {
                forward("asset_create.jsp");
            }
            else if(action.equalsIgnoreCase("edit")) {
                setAttribute("data", new AssetDAO().findById(id));
                forward("asset_edit.jsp");
            }
            else if(action.equalsIgnoreCase("delete")) {
                new AssetDAO().delete(id);
                redirect("Asset");
            }
            else if(action.equalsIgnoreCase("")) {
                setAttribute("list", new AssetDAO().findAll());
                forward("asset.jsp");
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

        if(Auth.isValid(request)) {
            
            if(action.equalsIgnoreCase("create_save")) {
                AssetDAO asset = new AssetDAO();
                asset.set("name", getString("name"));
                asset.set("address", getString("address"));
                asset.set("phone", getString("phone"));
                asset.set("fax", getString("fax"));
                asset.set("email", getString("email"));
                asset.set("website", getString("website"));
                asset.set("note", getString("note"));
                asset.set("bits", getDbl("bits"));
                asset.set("status", getInt("status"));
                asset.save();
                redirect("Asset");
            }
            else if(action.equalsIgnoreCase("edit_save")) {
                AssetDAO asset = new AssetDAO();
                asset.set("id", getInt("id"));
                asset.set("name", getString("name"));
                asset.set("address", getString("address"));
                asset.set("phone", getString("phone"));
                asset.set("fax", getString("fax"));
                asset.set("email", getString("email"));
                asset.set("website", getString("website"));
                asset.set("note", getString("note"));
                asset.set("bits", getDbl("bits"));
                asset.set("status", getInt("status"));
                asset.update();
                redirect("Asset");
            }
        }
        else {
            Auth.doLogin(response);
        }
    }

}
