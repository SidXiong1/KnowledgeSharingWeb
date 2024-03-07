package net.dss.forum.dao;

import net.dss.forum.domain.Topic;
import net.dss.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class TopicDao {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());
    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);


    /**
     * 根据cid查询总行数
     */
    public int countTotalTopicByCid(int cId) {

        String sql = "select count(*) from topic where c_id=? and `delete`=0";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),cId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    /**
     * 分页查询
     */
    public List<Topic> findListByCid(int cId, int from, int pageSize) {

        String sql = "select * from topic where c_id=? and `delete`=0 order by update_time desc limit ?,?";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),cId,from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }
    public Topic findById(int topicId) {

        String sql = "select * from topic where id = ?";

        Topic topic = null;

        try{

            topic = queryRunner.query(sql,new BeanHandler<>(Topic.class,processor),topicId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return  topic;

    }

    public int save(Topic topic) throws Exception{

        String sql = "insert into topic(c_id,title,content,pv,user_id,username,user_img,create_time,update_time,hot,img,`delete`) " +
                "values(?,?,?,?,?,?,?,?,?,?,?,?)";

        Object [] params = {
                topic.getcId(),
                topic.getTitle(),
                topic.getContent(),
                topic.getPv(),
                topic.getUserId(),
                topic.getUsername(),
                topic.getUserImg(),
                topic.getCreateTime(),
                topic.getUpdateTime(),
                topic.getHot(),
                topic.getImg(),
                topic.getDelete()
        };

        int i =0;

        try{
            i= queryRunner.update(sql,params);

        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }

        return i;



    }
    /**
     * 查找最新楼层的问题
     */
    public int findLatestFloorByTopicId(int topicId) {

        //楼层是0，返回后才加1
        int defaultFloor = 0;

        String sql = "select floor from reply where topic_id=? order by floor desc limit 1";

        Integer floor = null;

        try {
            floor = (Integer) queryRunner.query(sql,new ScalarHandler<>(),topicId);

            if(floor == null){
                return defaultFloor;

            }else {
                return floor.intValue();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * 浏览量增加
     */
    public int updatePV(int topicId, int newPV, int oldPV) {

        String sql = "update topic set pv=? where pv=? and id=?";

        int rows = 0;

        try {

            rows =  queryRunner.update(sql,newPV,oldPV,topicId);

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows;


    }
}
