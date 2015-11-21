/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import fx.lang.Int;
import fx.rdbms.Database;

public class Config {

    public static final String TITLE = "Financial Domain, Inc.";
    
    /* **** DATABASE CONFIGURATION **** */
    public static final String PROVIDER = "PostgreSQL";
    public static final String DRIVER = "org.postgresql.Driver";
    public static final String HOSTNAME = "localhost";
    public static final int PORT = 5432;
    public static final String USERNAME = "postgres";
    public static final String PASSWORD = "admin";
    public static final String DATABASE = "FinancialDomain";

    public static Database getDataSource() {
        return new Database(Config.PROVIDER, Config.HOSTNAME, Int.get(Config.PORT), Config.USERNAME, Config.PASSWORD, Config.DATABASE);
    }
}
