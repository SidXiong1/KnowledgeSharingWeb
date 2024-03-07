package net.dss.forum.service;

import net.dss.forum.domain.User;

public interface UserService {
  //  int register(User user);


    User login(String phone, String pwd);

    void getImg(User user);
}
