package com.suke.czx.modules.sqlite.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.suke.czx.modules.sqlite.entity.Paper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.suke.czx.modules.student.entity.SysStudent;

import java.util.Map;

/**
 * 论文
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-15 16:39:27
 */
public interface PaperService extends IService<Paper> {
    Map findAllBySqlite(IPage<Paper> page, QueryWrapper<Paper> queryWrapper,String sql);

    void export(Map<String,Object> params,String vueSql);
}
