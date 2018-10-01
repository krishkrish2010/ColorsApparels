package com.in.colorsapparels.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
