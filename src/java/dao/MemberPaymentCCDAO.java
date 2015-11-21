/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.rdbms.Database;
import fx.sql.orm.ORM;
import java.util.List;
import java.util.Map;

/**

 @author LENOVO
 */
public class MemberPaymentCCDAO extends ORM {

    public static final int NO_DEFAULT = 0;
    public static final int DEFAULT = 1;

    public MemberPaymentCCDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("member_payment_cc");
        super.setPrimaryKey("id");
    }

    public List<Map> findByMemberId(int memberId) {
        try {
            return super.findBySQL("SELECT * FROM member_payment_cc WHERE member_id = " + memberId + " ORDER BY id ASC;");
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean makeDefault(int memberId, int memberPaymentCcId) {
        try {
            makeAllNoDefault(memberId);
            
            super.set("id", memberPaymentCcId);
            super.set("is_default", MemberPaymentCCDAO.DEFAULT);
            return super.update();
        }
        catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean makeAllNoDefault(int memberId) {
        try {
            Database db = Config.getDataSource();
            db.connect();
            db.execute("UPDATE member_payment_cc SET is_default = 0 WHERE member_id = " + memberId + ";");
            db.close();
            return true;
        }
        catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
