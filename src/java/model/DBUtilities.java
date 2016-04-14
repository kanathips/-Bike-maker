/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author kanathip
 */
public class DBUtilities {
    Connection conn;
    public void init() throws NamingException, SQLException {
      conn =  getVcouldDB().getConnection();
    }

    private DataSource getVcouldDB() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/vcouldDB");
    }
    
    public void regisUser(){
        
    }
    
    public void close() throws SQLException{
        conn.close();
    }
}
