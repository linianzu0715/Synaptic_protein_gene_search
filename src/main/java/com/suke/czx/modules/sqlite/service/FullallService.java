package com.suke.czx.modules.sqlite.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.suke.czx.modules.sqlite.entity.Fullall;

import com.baomidou.mybatisplus.extension.service.IService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-17 14:33:15
 */
public interface FullallService extends IService<Fullall> {

    Map<String,String> ppiSqlMap = new HashMap<>();

    Map findAllBySqlite(IPage<Fullall> fullallIPage, QueryWrapper<Fullall> queryWrapper,String sql);

    void export(Map<String,Object> params);
}
