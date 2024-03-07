package net.dss.forum.controller;

import net.dss.forum.domain.Category;
import net.dss.forum.service.CategoryService;
import net.dss.forum.service.impl.CategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "categoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends BaseServlet{

    private CategoryService categoryService = new CategoryServiceImpl();
    /**
     * 返回全部分类，并按权重排序
     */

    public void list(HttpServletRequest request, HttpServletResponse response){

        List<Category> list = categoryService.list();
        System.out.println(list.toString());

        request.setAttribute("categoryList",list);

    }
}
