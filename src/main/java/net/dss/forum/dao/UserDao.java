package net.dss.forum.dao;

import net.dss.forum.domain.User;
import net.dss.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {

    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);


//    public int save(User user) throws Exception {
//
//        String sql = "insert into user (phone,pwd,img,username) values(?,?,?,?)";
//        Object[] params = {
//                user.getPhone(),user.getPwd(),user.getImg(),user.getUsername()
//        };
//
//        int i ;
//        try{
//            i = queryRunner.update(sql,params);
//        }catch (Exception e){
//            e.printStackTrace();
//            throw new Exception();
//        }
//        return i;
//    }

    public User findByPhoneAndPwd(String phone, String md5pwd) {
        String sql = "select * from user where phone= ? and pwd= ?";
        User user = null;
        try {
            user = queryRunner.query(sql, new BeanHandler<>(User.class,processor),phone,md5pwd);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;

    }
    public void setImg(User user) throws SQLException {
        String sql = "update user set img = ? where phone = ?";
        Object[] params = {user.getImg(),user.getPhone()};
        queryRunner.update(sql,params);
    }
}
