package com.stackninjas.crudapp.auth.dao;

import com.stackninjas.crudapp.auth.model.User;

public interface UserDAO {
        void register(User user);
        User login(String username, String password);
    }
