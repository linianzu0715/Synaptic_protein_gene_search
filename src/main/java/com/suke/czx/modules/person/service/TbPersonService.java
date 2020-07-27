package com.suke.czx.modules.person.service;

import com.suke.czx.modules.person.entity.TbPerson;

import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * 人员表
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 11:53:58
 */
public interface TbPersonService extends IService<TbPerson> {
    Map findPpi();
}
