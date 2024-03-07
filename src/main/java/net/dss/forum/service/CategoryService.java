package net.dss.forum.service;

import net.dss.forum.domain.Category;

import java.util.List;

public interface CategoryService {
    /**
     * 全部分类
     */
    List<Category> list();
}
