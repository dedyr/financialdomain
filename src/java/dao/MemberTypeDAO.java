/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.sql.orm.ORM;

/**

 @author LENOVO
 */
public class MemberTypeDAO extends ORM {

    public MemberTypeDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("member_type");
        super.setPrimaryKey("id");
    }
}
