package com.suke.czx.modules.sqlite.controller;

import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.suke.czx.common.annotation.SysLog;
import com.suke.czx.common.base.AbstractController;
import com.suke.czx.common.utils.R;
import com.suke.czx.modules.sqlite.entity.Fullall;
import com.suke.czx.modules.sqlite.service.FullallService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-17 14:33:15
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sqlite/fullall")
public class FullallController  extends AbstractController {
    private final  FullallService fullallService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        QueryWrapper<Fullall> queryWrapper = new QueryWrapper<>();
        String sqlWhere = MapUtil.getStr(params, "sqlWhere");
        String showCol = MapUtil.getStr(params, "showCol");

        String vueSql = "SELECT GeneID,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName "
                +(showCol == null?",Compartment,PMID,Year,Paper,Brain_Region,Disease,Species,Method ":showCol)+
                " FROM FullAll " +(sqlWhere == null?"":sqlWhere);

//        String vueSql = "SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ";

        Map map = fullallService.findAllBySqlite(mpPageConvert.<Fullall>pageParamConvert(params),queryWrapper,vueSql);
        return R.ok().put("page", map);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{geneid}")
    @PreAuthorize("hasRole('sqlite:fullall:info')")
    public R info(@PathVariable("geneid") Integer geneid){
        return R.ok().put("fullall", fullallService.getById(geneid));
    }


    /**
     * 新增
     */
    @SysLog("新增数据")
    @RequestMapping("/save")
    @PreAuthorize("hasRole('sqlite:fullall:save')")
    public R save(@RequestBody Fullall fullall){
        fullallService.save(fullall);
        return R.ok();
    }


    /**
     * 修改
     */
    @SysLog("修改数据")
    @RequestMapping("/update")
    @PreAuthorize("hasRole('sqlite:fullall:update')")
    public R update(@RequestBody Fullall fullall){
		fullallService.updateById(fullall);
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除数据")
    @RequestMapping("/delete")
    @PreAuthorize("hasRole('sqlite:fullall:delete')")
    public R delete(@RequestBody Integer[] geneids){
		fullallService.removeByIds(Arrays.asList(geneids));
        return R.ok();
    }

    /**
     * 导出数据
     */
    @SysLog("导出数据")
    @RequestMapping("/export")
    @PreAuthorize("hasRole('sqlite:fullall:delete')")
    public R export(@RequestBody Map<String, Object> params){
        fullallService.export(params);
        return R.ok();
    }

}
