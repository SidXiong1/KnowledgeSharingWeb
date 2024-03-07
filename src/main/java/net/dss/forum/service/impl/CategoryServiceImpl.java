package net.dss.forum.service.impl;

import net.dss.forum.dao.CategoryDao;
import net.dss.forum.domain.Category;
import net.dss.forum.service.CategoryService;

import java.util.List;
public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao = new CategoryDao();
    @Override
    public List<Category> list(){
        return categoryDao.list();
    }
}
