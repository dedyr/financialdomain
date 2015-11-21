/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.Config;
import fx.lang.Int;
import fx.lang.Str;
import fx.sql.orm.ORM;
import java.util.List;
import java.util.Map;

/**

 @author LENOVO
 */
public class DomainDAO extends ORM {
    
    public static final int ACTIVE = 1;
    public static final int DEACTIVE = 0;

    public DomainDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("domain");
        super.setPrimaryKey("id");
    }

    public List<Map> findAllDomain() {
        return super.findBySQL("SELECT a.name AS asset_name, d.* FROM asset a, domain d WHERE a.id = d.asset_id ORDER BY d.id ASC;");
    }
    
    public List<Map> findAllRequestDomainByMemberId(int memberId, int status) {
        return super.findBySQL("SELECT a.name AS asset_name, d.*, mr.member_id FROM asset a, domain d, member_request mr WHERE a.id = d.asset_id AND d.id = mr.domain_id AND mr.member_id = " + memberId + " AND mr.status = " + status + " ORDER BY mr.id ASC;");
    }
    
    public List<Map> findAllRequestDomainByMemberId(int memberId) {
        return findAllRequestDomainByMemberId(memberId, DomainDAO.ACTIVE);
    }
    
    public List<Map> findAllPendingRequestDomainByMemberId(int memberId) {
        return findAllRequestDomainByMemberId(memberId, DomainDAO.DEACTIVE);
    }

    public List<Map> findByDomain(String domain) {
        domain = Str.get(domain);
        try {
            if(domain.equalsIgnoreCase("")) {
                return null;
            }
            else {
                return super.findBySQL("SELECT a.name AS asset_name, d.* FROM asset a, domain d WHERE a.id = d.asset_id AND domain LIKE '%" + domain + "%' ORDER BY d.id ASC;");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            domain = null;
        }
    }
    
    public List<Map> findByDomain(String domain, int assetId) {
        domain = Str.get(domain);
        try {
            if(domain.equalsIgnoreCase("")) {
                return null;
            }
            else if(assetId == 0) {
                return findByDomain(domain);
            }
            else {
                return super.findBySQL("SELECT a.name AS asset_name, d.* FROM asset a, domain d WHERE a.id = d.asset_id AND domain LIKE '%" + domain + "%' AND d.asset_id = " + assetId + " ORDER BY d.id ASC;");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            domain = null;
            assetId = 0;
        }
    }
    
    public List<Map> findAndCheckDomain(String domain, int assetId, int memberId) {
        List<Map> list = null;
        try {
            if(domain.equalsIgnoreCase("")) {
                list = null;
            }
            else if(assetId == 0) {
                list = findByDomain(domain);
            }
            else {
                list = findByDomain(domain, assetId);
            }
            
            for(int i = 0; i < list.size(); i++) {
                if(new MemberRequestDAO().findByDomainId(Int.get(list.get(i).get("id")), memberId) != null) {
                    list.get(i).put("has_request", true);
                }
                else {
                    list.get(i).put("has_request", false);
                }
            }
            
            return list;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
        finally {
            domain = null;
            assetId = 0;
            memberId = 0;
            list = null;
        }
    }
}
