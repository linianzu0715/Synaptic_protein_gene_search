package com.suke.czx.modules.student.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.suke.czx.modules.student.entity.SysStudent;

import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * 学号管理
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 12:42:50
 */
public interface SysStudentService extends IService<SysStudent> {

    Map findAllBySqlite(IPage<SysStudent> page, Wrapper<SysStudent> queryWrapper);


}
