package com.in.colorsapparels.service;

import com.in.colorsapparels.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
