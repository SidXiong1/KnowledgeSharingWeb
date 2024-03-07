package net.dss.forum.service.impl;

import net.dss.forum.dao.CategoryDao;
import net.dss.forum.dao.ReplyDao;
import net.dss.forum.dao.TopicDao;
import net.dss.forum.domain.Category;
import net.dss.forum.domain.Reply;
import net.dss.forum.domain.Topic;
import net.dss.forum.domain.User;
import net.dss.forum.dto.PageDTO;
import net.dss.forum.service.TopicService;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class TopicServiceImpl implements TopicService {

    private TopicDao topicDao = new TopicDao();

    private ReplyDao replyDao = new ReplyDao();

    private CategoryDao categoryDao = new CategoryDao();
    /**
     *帖子分页
     */
    @Override
    public PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize) {

        //查询总记录数
        int totalRecordNum = topicDao.countTotalTopicByCid(cId);
        //从from开始读取pageSize条信息
        int from = (page-1) * pageSize;

        //分页查询显示的分页页面
        List<Topic> topicList = topicDao.findListByCid(cId,from,pageSize);

        PageDTO<Topic> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(topicList);

        return pageDTO;
    }
    @Override
    public Topic findById(int topicId) {

        return topicDao.findById(topicId);
    }
    /**
     * 回复分页
     */
    @Override
    public PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize) {

        //查询总的回复
        int totalRecordNum = replyDao.countTotalReplyByCid(topicId);

        int from = (page-1) * pageSize;

        //分页查询
        List<Reply> replyList =  replyDao.findListByTopicId(topicId,from,pageSize);

        PageDTO<Reply> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(replyList);

        return pageDTO;

    }
    /**
     * 发帖
     */
    @Override
    public int addTopic(User loginUser, String title, String content, int cId) {

        //查找该主题是否存在
        Category category = categoryDao.findById(cId);
        if(category == null){ return 0;}

        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setCreateTime(LocalDateTime.now());
        topic.setUpdateTime(LocalDateTime.now());
        topic.setPv(1);
        topic.setDelete(0);
        topic.setUserId(loginUser.getId());
        topic.setUsername(loginUser.getUsername());
        topic.setUserImg(loginUser.getImg());
        topic.setcId(cId);
        topic.setHot(0);
        topic.setImg(getRandomImg());

        int rows = 0;
        try {
            rows = topicDao.save(topic);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows;
    }

    /**
     *回复
     */
    @Override
    public int replyByTopicId(User loginUser, int topicId, String content) {

        int floor = topicDao.findLatestFloorByTopicId(topicId);

        Reply reply = new Reply();
        reply.setContent(content);
        reply.setCreateTime(LocalDateTime.now());
        reply.setUpdateTime(LocalDateTime.now());
        reply.setFloor(floor+1);
        reply.setTopicId(topicId);
        reply.setUserId(loginUser.getId());
        reply.setUsername(loginUser.getUsername());
        reply.setUserImg(loginUser.getImg());
        reply.setDelete(0);

        int rows = replyDao.save(reply);

        return rows;
    }

    @Override
    public void addOnePV(int topicId) {

        Topic topic = topicDao.findById(topicId);

        int newPV = topic.getPv()+1;

        topicDao.updatePV(topicId,newPV,topic.getPv());
    }
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
