package com.skillscore.portal.service;

import com.skillscore.portal.entity.User;

public interface UserService {

    User registerUser(User user);

    User login(String email, String password);

	void saveUser(User user);
}
