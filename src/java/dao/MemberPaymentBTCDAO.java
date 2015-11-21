/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.lang.Dbl;
import fx.rdbms.Database;
import fx.sql.orm.ORM;
import java.util.List;
import java.util.Map;
import utils.BTCUtils;

/**

 @author LENOVO
 */
public class MemberPaymentBTCDAO extends ORM {

    public static final int NO_DEFAULT = 0;
    public static final int DEFAULT = 1;

    public MemberPaymentBTCDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("member_payment_btc");
        super.setPrimaryKey("id");
    }

    public List<Map> findByMemberId(int memberId) {
        List<Map> list = null;
        try {
            list = super.findBySQL("SELECT * FROM member_payment_btc WHERE member_id = " + memberId + " ORDER BY id ASC;");
            if(list != null) {
                if(list.size() > 0) {
                    for(int i = 0; i < list.size(); i++) {
                        list.get(i).put("current_ballance_btc", BTCUtils.moneyToBit(Dbl.get((float)list.get(i).get("current_ballance"))));
                    }
                }
            }
            return list;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean makeDefault(int memberId, int memberPaymentBtcId) {
        try {
            makeAllNoDefault(memberId);
            
            super.set("id", memberPaymentBtcId);
            super.set("is_default", MemberPaymentBTCDAO.DEFAULT);
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
            db.execute("UPDATE member_payment_btc SET is_default = 0 WHERE member_id = " + memberId + ";");
            db.close();
            return true;
        }
        catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
