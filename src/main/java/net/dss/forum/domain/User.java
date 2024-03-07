package net.dss.forum.domain;

import java.time.LocalDateTime;
import java.util.Date;

/*
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) DEFAULT NULL,
  `pwd` varchar(128) DEFAULT NULL,
  `sex` int DEFAULT NULL COMMENT '0是女，1是男，2未知',
  `img` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `role` int DEFAULT NULL COMMENT '1是普通用户，2是管理员',
  `username` varchar(128) DEFAULT NULL,

 */

/**
 *    论坛功能 user类
 */
public class User {

    private int id;
    private String phone;
    private String pwd;
    private String img;
    private String username;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", pwd='" + pwd + '\'' +
                ", img='" + img + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}

