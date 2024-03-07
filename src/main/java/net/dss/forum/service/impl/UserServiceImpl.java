package net.dss.forum.service.impl;

import com.mysql.cj.protocol.a.LocalDateTimeValueEncoder;
import net.dss.forum.dao.UserDao;
import net.dss.forum.domain.User;
import net.dss.forum.service.UserService;
import net.dss.forum.util.CommonUtil;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Random;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDao();//   @Override
//    public int register(User user) {
//
//        user.setImg(getRandomImg());
//
//        user.setPwd(CommonUtil.MD5(user.getPwd()));
//        try {
//            return userDao.save(user);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return 0;
//    }

    @Override
    public User login(String phone, String pwd) {

        String md5pwd = CommonUtil.MD5(pwd);

        User user = userDao.findByPhoneAndPwd(phone,md5pwd);

        return user;
    }

    @Override
    public void getImg(User user) {
        user.setImg(getRandomImg());
        try {
            userDao.setImg(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 放在CDN上的随机头像
     */
    private static final String [] headImg = {
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/11.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/13.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/15.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/16.jpeg",
            "https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/17.jpeg"
    };

    private String getRandomImg(){
        int size =  headImg.length;
        Random random = new Random();
        int index = random.nextInt(size);
        return headImg[index];
    }
}
