package net.dss.forum.service;

import net.dss.forum.domain.Reply;
import net.dss.forum.domain.Topic;
import net.dss.forum.domain.User;
import net.dss.forum.dto.PageDTO;

public interface TopicService {

    PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize);

    Topic findById(int topicId);

    PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize);

    int addTopic(User loginUser, String title, String content, int cId);

    int replyByTopicId(User loginUser, int topicId, String content);

    void addOnePV(int topicId);
}
