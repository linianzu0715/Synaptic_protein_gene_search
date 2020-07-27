package com.suke.czx.modules.student.controller;

import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.suke.czx.modules.student.entity.SysStudent;
import com.suke.czx.modules.student.service.SysStudentService;
import com.suke.czx.common.utils.R;
import lombok.AllArgsConstructor;
import com.suke.czx.common.annotation.SysLog;
import com.suke.czx.common.base.AbstractController;
import org.springframework.security.access.prepost.PreAuthorize;
import java.util.Arrays;



/**
 * 学号管理
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 12:42:50
 */
@RestController
@AllArgsConstructor
@RequestMapping("/student/sysstudent")
public class SysStudentController  extends AbstractController {
    private final  SysStudentService sysStudentService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('student:sysstudent:list')")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        QueryWrapper<SysStudent> queryWrapper = new QueryWrapper<>();
        Map map = sysStudentService.findAllBySqlite(mpPageConvert.<SysStudent>pageParamConvert(params),queryWrapper);


        return R.ok().put("page", map);

    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @PreAuthorize("hasRole('student:sysstudent:info')")
    public R info(@PathVariable("id") Long id){
        return R.ok().put("sysStudent", sysStudentService.getById(id));
    }


    /**
     * 新增学号管理
     */
    @SysLog("新增学号管理数据")
    @RequestMapping("/save")
    @PreAuthorize("hasRole('student:sysstudent:save')")
    public R save(@RequestBody SysStudent sysStudent){
        sysStudentService.save(sysStudent);
        return R.ok();
    }


    /**
     * 修改
     */
    @SysLog("修改学号管理数据")
    @RequestMapping("/update")
    @PreAuthorize("hasRole('student:sysstudent:update')")
    public R update(@RequestBody SysStudent sysStudent){
		sysStudentService.updateById(sysStudent);
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除学号管理数据")
    @RequestMapping("/delete")
    @PreAuthorize("hasRole('student:sysstudent:delete')")
    public R delete(@RequestBody Long[] ids){
		sysStudentService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }
	
}
