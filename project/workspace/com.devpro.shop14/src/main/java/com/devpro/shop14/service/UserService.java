package com.devpro.shop14.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.User;

@Service
public class UserService extends BaseService<User>{

	@Override
	protected Class<User> clazz() {
		return User.class;
	}
	
	public User loadUserByUserName(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.executeNativeSql(sql);
		if(users == null || users.size() <= 0) {
			return null;
		}
		return users.get(0);
	}

}
