package com.bjsxt.serviceImp;

import com.bjsxt.dao.UserDao;
import com.bjsxt.daoImp.UserDaoImp;
import com.bjsxt.domain.User;
import com.bjsxt.service.UserService;

public class UserServiceImp implements UserService {
	UserDao ud=new UserDaoImp();
	@Override
	public User getUserInfoService(String name) {

		return ud.getUserInfo(name);
	}

}
