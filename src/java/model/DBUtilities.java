/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
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
        conn = getVcouldDB().getConnection();
    }

    private DataSource getVcouldDB() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/vcouldDB");
    }

    //TODO
    public void regisUser(UserRegis userRegis) throws SQLException {
        insertUsername(userRegis.getLoginInfo());
        insertAddress(userRegis.getAddress());
        String sql = "INSERT INTO ";
    }

    public void insertUsername(LoginInfo loginInfo) throws SQLException {
        String sql = "INSERT INTO User_Login VALUES(?, ?, ?);";
        PreparedStatement sqlStatement = conn.prepareStatement(sql);
        sqlStatement.setString(1, loginInfo.getUsername());
        sqlStatement.setString(2, loginInfo.getPassword());
        sqlStatement.setString(3, loginInfo.getRole());
        sqlStatement.execute();
    }

    public void insertAddress(Address address) throws SQLException {
        String sql = "insert into Address(house_no, street, sub_distric, distric, provice, zipcode, country) values(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement sqlStatement = conn.prepareStatement(sql);
        sqlStatement.setString(1, address.getHouseNo());
        sqlStatement.setString(2, address.getStreet());
        sqlStatement.setString(3, address.getSubDistrict());
        sqlStatement.setString(4, address.getDistrict());
        sqlStatement.setString(5, address.getProvince());
        sqlStatement.setInt(6, address.getZipcode());
        sqlStatement.setString(7, address.getCountry());
        sqlStatement.execute();
    }

    public void userAskQuestion(AskQuestionModel askQuestionInfo) throws SQLException {
        String sql = "INSERT INTO Question (question_desc, Questioner_email, Questioner_name, Question_title) VALUES (?, ?, ?, ?);";
        PreparedStatement sqlStatement = conn.prepareStatement(sql);
        sqlStatement.setString(1, askQuestionInfo.getQuestionDesc());
        sqlStatement.setString(2, askQuestionInfo.getEmail());
        sqlStatement.setString(3, askQuestionInfo.getName());
        sqlStatement.setString(4, askQuestionInfo.getTitle());
        sqlStatement.execute();
    }

    public void insertComment(String comment) throws SQLException {
        String sql = "INSERT INTO Comment(comment) VALUES('" + comment + "');";
        Statement sqlStatement = conn.createStatement();
        sqlStatement.execute(sql);
    }

    public String checkForgetPassword(ForgetPassModel forgetPassModel) throws SQLException {
        boolean found;
        String role;
        ResultSet result;
        Statement sqlStatement = conn.createStatement();
        String sql = "SELECT User_Login.role FROM %s JOIN User_Login USING (username) WHERE username = '" + forgetPassModel.getUsername() + "' AND email = '" + forgetPassModel.getEmail() + "';";
        result = sqlStatement.executeQuery(String.format(sql, "Employees"));
        found = result.next();
        if (found) {
            return result.getString("role");
        }
        result = sqlStatement.executeQuery(String.format(sql, "Customer"));
        found = result.next();
        if (found) {
            return result.getString("role");
        }
        return null;
    }

    public String setNewPassword(ForgetPassModel forgetPassModel) {
        Random random = new Random();
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String generatedPass = sb.toString();
        String sql = "UPDATE User_Login SET password = SHA2('" + generatedPass + "', 256) WHERE username = '" + forgetPassModel.getUsername() + "';";
        return generatedPass;
    }

    public void close() throws SQLException {
        conn.close();
    }
}
