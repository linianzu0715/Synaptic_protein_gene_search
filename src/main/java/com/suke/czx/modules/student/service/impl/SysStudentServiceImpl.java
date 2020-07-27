package com.suke.czx.modules.student.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.suke.czx.modules.student.mapper.SysStudentMapper;
import com.suke.czx.modules.student.entity.SysStudent;
import com.suke.czx.modules.student.service.SysStudentService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class SysStudentServiceImpl extends ServiceImpl<SysStudentMapper, SysStudent> implements SysStudentService {

    @Value("${sqlite.serverURI}")
    private String sqliteUrl ;
    @Override
    public Map findAllBySqlite(IPage<SysStudent> page, Wrapper<SysStudent> queryWrapper) {

        HashMap<Object, Object> pageData = new HashMap<>();
//        try {
//            Class.forName("org.sqlite.JDBC");
//            Connection conn = DriverManager.getConnection("jdbc:sqlite:" + sqliteUrl);
//            Statement state = conn.createStatement();
//            String countSql = "select count(0) count from PPI";
//            ResultSet rsCount = state.executeQuery(countSql); //查询总条数
//
//            int totalCount = rsCount.getInt("count");
////            while (rsCount.next()) {
//            pageData.put("totalCount", totalCount);
////            }
//
//            String sql = "select A username,B salt from PPI  order by username asc limit " + (page.getCurrent() - 1) * page.getSize() + "," + page.getSize();
//
//            System.out.println(sql);
//            ResultSet rs = state.executeQuery(sql); //查询数据
//
//
//
//
//            List<SysStudent> itemList = new ArrayList<>();
//            while (rs.next()) {
//                SysStudent item = new SysStudent();
//
//                item.setUsername(rs.getString("username"));
//                item.setSalt(rs.getString("salt"));
//
//
//                itemList.add(item);
//
//            }
//            /**
//             *         HashMap<Object,Object> pageData = new HashMap<>();
//             *         pageData.put("list",page.getRecords());
//             *         pageData.put("totalCount",page.getTotal());
//             *         pageData.put("pageSize",page.getSize());
//             *         pageData.put("currPage",page.getCurrent());
//             *         pageData.put("totalPage",page.getPages());
//             */
//
//            pageData.put("list", itemList);
//
//            pageData.put("pageSize", page.getSize());
//            pageData.put("currPage", page.getCurrent());
//
//            long totalPage = (totalCount / page.getSize() == 0) ? totalCount / page.getSize() : totalCount / page.getSize() + 1;
//            pageData.put("totalPage",totalPage );
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return pageData;
    }
}
