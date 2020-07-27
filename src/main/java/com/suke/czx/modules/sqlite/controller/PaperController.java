package com.suke.czx.modules.sqlite.controller;

import java.util.Map;

import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.suke.czx.modules.student.entity.SysStudent;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.suke.czx.modules.sqlite.entity.Paper;
import com.suke.czx.modules.sqlite.service.PaperService;
import com.suke.czx.common.utils.R;
import lombok.AllArgsConstructor;
import com.suke.czx.common.annotation.SysLog;
import com.suke.czx.common.base.AbstractController;
import org.springframework.security.access.prepost.PreAuthorize;
import java.util.Arrays;



/**
 * 论文
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-15 16:39:27
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sqlite/paper")
public class PaperController  extends AbstractController {
    private final  PaperService paperService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('sqlite:paper:list')")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        QueryWrapper<Paper> queryWrapper = new QueryWrapper<>();

        String sql = "select rowid,PMID,Year,Name,Description from paper ";
        if(StringUtils.isNotBlank(MapUtil.getStr(params,"sql"))){
            sql = MapUtil.getStr(params, "sql");
        }

        Map map = paperService.findAllBySqlite(mpPageConvert.<Paper>pageParamConvert(params),queryWrapper, sql);


        return R.ok().put("page", map);

    }


    /**
     * 信息
     */
    @RequestMapping("/info/{rowid}")
    @PreAuthorize("hasRole('sqlite:paper:info')")
    public R info(@PathVariable("rowid") Integer rowid){
        return R.ok().put("paper", paperService.getById(rowid));
    }


    /**
     * 新增论文
     */
    @SysLog("新增论文数据")
    @RequestMapping("/save")
    @PreAuthorize("hasRole('sqlite:paper:save')")
    public R save(@RequestBody Paper paper){
        paperService.save(paper);
        return R.ok();
    }


    /**
     * 修改
     */
    @SysLog("修改论文数据")
    @RequestMapping("/update")
    @PreAuthorize("hasRole('sqlite:paper:update')")
    public R update(@RequestBody Paper paper){
		paperService.updateById(paper);
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除论文数据")
    @RequestMapping("/delete")
    @PreAuthorize("hasRole('sqlite:paper:delete')")
    public R delete(@RequestBody Integer[] rowids){
		paperService.removeByIds(Arrays.asList(rowids));
        return R.ok();
    }
    /**
     * 删除
     */
    @SysLog("导出论文数据")
    @RequestMapping("/export")
    @PreAuthorize("hasRole('sqlite:paper:save')")
    public R export(@RequestBody Map<String, Object> params){

        String vueSql = "select rowid,PMID,Year,Name,Description from paper ";
        if(StringUtils.isNotBlank(MapUtil.getStr(params,"sql"))){
            vueSql = MapUtil.getStr(params, "sql");
        }

		paperService.export(params,vueSql);
        return R.ok();
    }

}
