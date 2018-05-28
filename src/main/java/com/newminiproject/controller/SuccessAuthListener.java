package com.newminiproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.newminiproject.dao.MenuDao;
import com.newminiproject.dao.UserDao;
import com.newminiproject.model.User;



@Component
public class SuccessAuthListener implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	MenuDao menuDao;
	
	@Autowired
	private HttpSession httpSession;
	
	public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
		// TODO Auto-generated method stub
		//System.out.println("You are successfully log in..");
		UserDetails userDetails = (UserDetails) event.getAuthentication().getPrincipal();
		String username = userDetails.getUsername();
		/*User user = userDao.findUserByUsername(username);
		List<String> menus= menuDao.findMenuByUsername(username);
		User appUser=new User();
		appUser.setUsername(username);
		appUser.setmEmployeeId(user.getmEmployeeId());
		appUser.setMenus(menus);
		httpSession.setAttribute("app-user", appUser);*/	
	}
}