package com.suke.czx.modules.person.controller;

import java.util.HashMap;
import java.util.Map;

import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.suke.czx.modules.sqlite.entity.Paper;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.suke.czx.modules.person.entity.TbPerson;
import com.suke.czx.modules.person.service.TbPersonService;
import com.suke.czx.common.utils.R;
import lombok.AllArgsConstructor;
import com.suke.czx.common.annotation.SysLog;
import com.suke.czx.common.base.AbstractController;
import org.springframework.security.access.prepost.PreAuthorize;
import java.util.Arrays;



/**
 * 人员表
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 11:53:58
 */
@RestController
@AllArgsConstructor
@RequestMapping("/person/tbperson")
public class TbPersonController  extends AbstractController {
    private final  TbPersonService tbPersonService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('person:tbperson:list')")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        QueryWrapper<TbPerson> queryWrapper = new QueryWrapper<>();
        if(MapUtil.getStr(params,"key") != null){
            queryWrapper
                    .like("name",MapUtil.getStr(params,"key"))
                    .or()
                    .like("address",MapUtil.getStr(params,"key"));
        }
        IPage<TbPerson> sysConfigList = tbPersonService.page(mpPageConvert.<TbPerson>pageParamConvert(params),queryWrapper);
        return R.ok().put("page", mpPageConvert.pageValueConvert(sysConfigList));
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @PreAuthorize("hasRole('person:tbperson:info')")
    public R info(@PathVariable("id") Long id){
        return R.ok().put("tbPerson", tbPersonService.getById(id));
    }


    /**
     * 新增人员表
     */
    @SysLog("新增人员表数据")
    @RequestMapping("/save")
    @PreAuthorize("hasRole('person:tbperson:save')")
    public R save(@RequestBody TbPerson tbPerson){
        tbPersonService.save(tbPerson);
        return R.ok();
    }


    /**
     * 修改
     */
    @SysLog("修改人员表数据")
    @RequestMapping("/update")
    @PreAuthorize("hasRole('person:tbperson:update')")
    public R update(@RequestBody TbPerson tbPerson){
		tbPersonService.updateById(tbPerson);
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除人员表数据")
    @RequestMapping("/delete")
    @PreAuthorize("hasRole('person:tbperson:delete')")
    public R delete(@RequestBody Long[] ids){
		tbPersonService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }
    /**
     * get PPI
     */
    @SysLog("getPPI")
    @RequestMapping("/getPpi")
    @PreAuthorize("hasRole('person:tbperson:delete')")
    public R getPpi(){

        Map map = tbPersonService.findPpi();




        return R.ok().put("ppi", map);
    }

}
