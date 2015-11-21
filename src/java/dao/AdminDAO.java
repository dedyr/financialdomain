/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.sql.orm.ORM;
import java.util.List;
import java.util.Map;

/**

 @author LENOVO
 */
public class AdminDAO extends ORM {

    public AdminDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("admin");
        super.setPrimaryKey("id");
    }

    public Map login(String email, String password) {
        List<Map> list = null;
        try {
            list = super.findBySQL("SELECT * FROM admin WHERE email = '" + email + "' AND password = '" + password + "';");
            if(list != null) {
                if(list.size() > 0) {
                    return list.get(0);
                }
                else {
                    return null;
                }
            }
            else {
                return null;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
