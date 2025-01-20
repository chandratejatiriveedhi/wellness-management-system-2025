package com.wellness.service;

import com.wellness.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User register(User user);
    User findByUsername(String username);
}