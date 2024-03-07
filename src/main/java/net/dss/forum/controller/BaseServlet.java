package net.dss.forum.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override

    /**
     * 子类的Servlet被访问，回调用service方法，子类没有重写，所以会调用父类的service方法
     */
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //获取请求方法
        String method = req.getParameter("method");

        if (method!=null){
            try {
                //访问方法对象，获取指定的方法
                Method targetMethod = this.getClass().getMethod(method,HttpServletRequest.class,HttpServletResponse.class);
                //调用对应的方法
                targetMethod.invoke(this,req,resp);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }
}
