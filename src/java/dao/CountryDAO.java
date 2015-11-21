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
public class CountryDAO extends ORM {

    public CountryDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("country");
        super.setPrimaryKey("id");
    }
    
    public List<Map> findAll() {
        try {
            return super.findBySQL("SELECT * FROM country ORDER BY country ASC;");
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
