/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.lang.Int;
import fx.sql.orm.ORM;
import java.util.List;
import java.util.Map;

/**

 @author LENOVO
 */
public class MemberRequestDAO extends ORM {

    public MemberRequestDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("member_request");
        super.setPrimaryKey("id");
    }
    
    public Map findByDomainId(int domainId, int memberId) {
        List<Map> list = null;
        try {
            list = super.findBySQL("SELECT * FROM member_request WHERE domain_id = " + domainId + " AND member_id = " + memberId + ";");
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
        finally {
            list = null;
        }
    }

    public boolean addToCart(int memberId, int domainId, String requestDate) {
        try {
            if(findByDomainId(domainId, memberId) == null) {
                super.set("member_id", memberId);
                super.set("domain_id", domainId);
                super.set("request_date", requestDate);
                super.set("payment_status_id", PaymentStatusDAO.UNPAID);
                return super.save();
            }
            else {
                return false;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int countOrder(int memberId) {
        List<Map> list = null;
        try {
            list = super.findBySQL("SELECT COUNT(*) AS jml FROM member_request WHERE member_id = " + memberId + ";");
            return Int.get(list.get(0).get("jml"));
        }
        catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
        finally {
            list = null;
        }
    }
    
    public List<Map> findAllOrder(int memberId) {
        List<Map> list = null;
        try {
            return super.findBySQL("SELECT member_request.*, domain.domain, domain.asset_id, domain.price_per_year, asset.name AS asset_name FROM member_request, domain, asset WHERE member_request.member_id = " + memberId + " AND member_request.domain_id = domain.id AND domain.asset_id = asset.id ORDER BY member_request.id ASC;");
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            list = null;
        }
    }
}
