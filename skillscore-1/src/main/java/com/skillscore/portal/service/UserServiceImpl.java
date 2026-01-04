package com.skillscore.portal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillscore.portal.entity.User;
import com.skillscore.portal.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User registerUser(User user) {
        user.setRole("STUDENT");
        user.setAvatar("avatar1.png"); // default role
        return userRepository.save(user);
    }
    

    @Override
    public User login(String email, String password) {
        User user = userRepository.findByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            return user; // login success
        }
        return null; // login failed
    }

	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		
	}
}
