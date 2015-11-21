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
import utils.BTCUtils;

/**

 @author LENOVO
 */
public class AssetDAO extends ORM {

    public AssetDAO() {
        super.setDatabaseSource(Config.getDataSource());
        super.setTable("asset");
        super.setPrimaryKey("id");
    }

    @Override
    public List<Map> findAll() {
        List<Map> list = null;
        try {
            list = super.findAll();
            if(list != null) {
                if(list.size() > 0) {
                    for(int i = 0; i < list.size(); i++) {
                        list.get(i).put("btc", BTCUtils.moneyToBit((double)list.get(i).get("bits")));
                    }
                }
            }
            return list;
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
