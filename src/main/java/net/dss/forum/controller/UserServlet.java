package net.dss.forum.controller;

import net.dss.forum.domain.User;
import net.dss.forum.service.UserService;
import net.dss.forum.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.BagUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "userServlet",urlPatterns = {"/user"})
public class UserServlet extends BaseServlet{

    private UserService userService = new UserServiceImpl();


    public void login(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {


//        String phone = request.getParameter("phone");
//        String pwd = request.getParameter("pwd");
        String phone = (String)request.getSession().getAttribute("zhanghu");
        String pwd = (String)request.getSession().getAttribute("mima");
         User user = userService.login(phone,pwd);

         if (user !=null){
             String img = user.getImg();
             if(img==null){
                 userService.getImg(user);
             }
             request.getSession().setAttribute("loginUser",user);
             //跳转页面
             response.sendRedirect("/topic?method=list&c_id=1");
         }
         else {
             request.setAttribute("msg","用户名或密码错误");
             request.getRequestDispatcher("/user/login.jsp").forward(request,response);
         }
    }

//    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
//        request.getSession().invalidate();
//        //页面跳转，退出登录
//        response.sendRedirect("/topic?method=list&c_id=1");
//    }


//    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = new User();
//
//        Map<String,String[]> map = request.getParameterMap();
//
//        try {
//            BeanUtils.populate(user,map);
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            e.printStackTrace();
//        }
//
//        int i = userService.register(user);
//
//        if (i>0){
//            //注册成功,跳转到登录页面
//            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
//        }else {
//            //注册失败，跳转到注册页面
//            request.getRequestDispatcher("/user/register.jsp").forward(request,response);
//        }
//
//    }
}
