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
public class PaymentStatusDAO extends ORM {
    
    public static final int UNPAID = 0;
    public static final int PAID = 1;

    public PaymentStatusDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("payment_status");
        super.setPrimaryKey("id");
    }
}
