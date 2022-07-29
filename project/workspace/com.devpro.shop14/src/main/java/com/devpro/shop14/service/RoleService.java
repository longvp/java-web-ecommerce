package com.devpro.shop14.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}
	
	public Role findById(int roleId) {
		String sql = "select * from tbl_roles where id = '" + roleId + "'";
		List<Role> roles = this.executeNativeSql(sql);
		return roles.get(0);
	}
	
	public Role findByName(String roleName) {
		String sql = "select * from tbl_roles where name = '" + roleName + "'";
		List<Role> roles = this.executeNativeSql(sql);
		return roles.get(0);
	}

}
