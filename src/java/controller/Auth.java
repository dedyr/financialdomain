/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import fx.lang.Int;
import fx.lang.Str;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**

 @author LENOVO
 */
public class Auth {
    
    private HttpServletRequest request;
    private HttpSession session;
    
    public Auth() {
        
    }
    
    public Auth(HttpServletRequest request) {
        this.request = request;
        this.request.getSession(false);
        this.session = Auth.getSession(request);
    }

    public static HttpSession getSession(HttpServletRequest request) {
        return request.getSession(false);
    }
    
    public static void doLogin(HttpServletResponse response) {
        try {
            response.sendRedirect("Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isValid(HttpServletRequest request) {
        HttpSession session = null;
        try {
            session = getSession(request);
            if(session.getAttribute("id") == null) {
                System.out.println("User not logged");
                return false;
            }
            else {
                return true;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            return false;
        }
        finally {
            session = null;
        }
    }
    
    public static void onlyLogged(HttpServletRequest request, HttpServletResponse response) {
        try {
            if(!isValid(request)) {
                doLogin(response);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public int getId() {
        try {
            return Int.get(this.session.getAttribute("id"));
        }
        catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
        finally {
            
        }
    }
    
    public String getFullName() {
        try {
            return Str.get(this.session.getAttribute("full_name"));
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            
        }
    }
    
    public String getEmail() {
        try {
            return Str.get(this.session.getAttribute("email"));
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            
        }
    }
    
    public void clear() {
        try {
            this.request = null;
            this.session = null;
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    protected void finalize() {
        try {
            super.finalize();
            clear();
        }
        catch(Throwable e) {
            e.printStackTrace();
        }
    }
}
