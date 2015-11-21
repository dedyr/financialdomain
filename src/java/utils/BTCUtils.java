/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**

 @author LENOVO
 */
public class BTCUtils {
    
    public static double bitToMoney(double bit) {
        return bit * 10000000.0;
    }

    public static double moneyToBit(double money) {
        return money / 10000000.0;
    }
    
}
