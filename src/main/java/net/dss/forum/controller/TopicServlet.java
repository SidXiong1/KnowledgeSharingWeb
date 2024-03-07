package net.dss.forum.controller;

import net.dss.forum.domain.Reply;
import net.dss.forum.domain.Topic;
import net.dss.forum.domain.User;
import net.dss.forum.dto.PageDTO;
import net.dss.forum.service.CategoryService;
import net.dss.forum.service.TopicService;
import net.dss.forum.service.impl.CategoryServiceImpl;
import net.dss.forum.service.impl.TopicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "topicServlet", urlPatterns = {"/topic"})
public class TopicServlet extends BaseServlet {

    private TopicService topicService = new TopicServiceImpl();

    private CategoryService categoryService = new CategoryServiceImpl();

    /**
     * 默认分页大小
     */
    private static final int pageSize =10;

    /**
     *进入论坛首页调用list方法
     */
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int cId = Integer.parseInt(request.getParameter("c_id"));

        int page = 1;//默认第一页

        String currentPage = request.getParameter("page");

        if (currentPage != null && currentPage != "") {
            page = Integer.parseInt(currentPage);
        }


        PageDTO<Topic> pageDTO = topicService.listTopicPageByCid(cId, page, pageSize);

        System.out.println(pageDTO.toString());

        request.getSession().setAttribute("categoryList",categoryService.list());

        request.setAttribute("topicPage", pageDTO);

        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }


    /**
     * 查看主题的全部回复
     */
    public void findDetailById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取topicId
        int topicId = Integer.parseInt(request.getParameter("topic_id"));

        //默认第一页
        int page = 1;

        String currentPage = request.getParameter("page");

        if (currentPage != null && currentPage != "") {
            page = Integer.parseInt(currentPage);
        }

        //处理浏览量,单一session算一次
        String sessionReadKey = "reading"+topicId;

        //每次进入新主题页面，isRead会为null
        Boolean isRead = (Boolean) request.getSession().getAttribute(sessionReadKey);

        if(isRead == null){
            request.getSession().setAttribute(sessionReadKey,true);
            //增加pv
            topicService.addOnePV(topicId);

        }



        Topic topic = topicService.findById(topicId);

        PageDTO<Reply> pageDTO = topicService.findReplyPageByTopicId(topicId, page, pageSize);

        System.out.println(pageDTO.toString());


        request.setAttribute("topic", topic);
        request.setAttribute("replyPage", pageDTO);

        request.getRequestDispatcher("/topic_detail.jsp").forward(request,response);


    }

    /**
     * 发布主题
     */
    public void addTopic(HttpServletRequest request,HttpServletResponse response) throws IOException {

        User loginUser = (User)request.getSession().getAttribute("loginUser");
        if(loginUser == null){
            request.setAttribute("msg","请登录");
            response.sendRedirect("/user/login.jsp");
            return;
            //页面跳转
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int cId = Integer.parseInt(request.getParameter("c_id"));

        int rows =  topicService.addTopic(loginUser,title,content,cId);

        if(rows ==1){
            //发布主题成功
            response.sendRedirect("/topic?method=list&c_id="+cId);

        }


    }

    /**
     * 回复
     */
    public void replyByTopicId(HttpServletRequest request,HttpServletResponse response) throws IOException {

        User loginUser = (User)request.getSession().getAttribute("loginUser");
        if(loginUser == null){
            request.setAttribute("msg","请登录");
            response.sendRedirect("/user/login.jsp");
            return;
        }

        int topicId = Integer.parseInt(request.getParameter("topic_id"));

        String content = request.getParameter("content");


        int rows = topicService.replyByTopicId(loginUser,topicId,content);

        if(rows ==1){

            response.sendRedirect("/topic?method=findDetailById&topic_id="+topicId+"&page=1");

        }

    }





}
