package com.stackninjas.crudapp.auth.dao;

import com.stackninjas.crudapp.auth.model.User;
import com.stackninjas.crudapp.auth.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAOImpl implements UserDAO {

    private static final String INSERT_SQL = "INSERT INTO users(full_name, username, password) VALUES (?,?,?)";

    private static final String LOGIN_SQL = "SELECT * FROM users WHERE username=? AND password=?";

    @Override
    public void register(User user) {
        try (Connection con = JDBCUtils.fetchConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_SQL)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public User login(String username, String password) {
        try (Connection con = JDBCUtils.fetchConnection();
             PreparedStatement ps = con.prepareStatement(LOGIN_SQL)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("username"),
                        null
                );
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
