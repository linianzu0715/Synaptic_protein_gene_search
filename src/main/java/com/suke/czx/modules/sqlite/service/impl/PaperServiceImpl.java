package com.suke.czx.modules.sqlite.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.suke.czx.common.utils.CSVUtils;
import com.suke.czx.common.utils.JDBCUtils;
import com.suke.czx.modules.sqlite.entity.Paper;
import com.suke.czx.modules.sqlite.mapper.PaperMapper;
import com.suke.czx.modules.sqlite.service.PaperService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper> implements PaperService {

    @Value("${sqlite.serverURI}")
    private String sqliteUrl;

    @Value("${csv.path}")
    private String csvPath;



    @Override
    public Map findAllBySqlite(IPage<Paper> page, QueryWrapper<Paper> queryWrapper,String vueSql) {
        HashMap<Object, Object> pageData = new HashMap<>();

        try {

            Connection conn = JDBCUtils.getConn(sqliteUrl);

            if (conn == null) {
                return pageData;
            }

            Statement state = conn.createStatement();
            String countSql = "select count(0) count from paper";
            ResultSet rs = state.executeQuery(countSql); //查询总条数

            int totalCount = rs.getInt("count");
            pageData.put("totalCount", totalCount);

//            String sql = "select rowid,PMID,Year,Name,Description from paper  order by rowid asc limit " + (page.getCurrent() - 1) * page.getSize() + "," + page.getSize();
              String sql = vueSql + " order by rowid asc limit " + (page.getCurrent() - 1) * page.getSize() + "," + page.getSize();

            System.out.println(sql);
            rs = state.executeQuery(sql); //查询数据

            List<Paper> itemList = new ArrayList<>();
            while (rs.next()) {
                Paper item = new Paper();
                item.setRowid(rs.getInt("rowid"));
                item.setPmid(rs.getBigDecimal("PMID"));
                item.setYear(rs.getInt("Year"));
                item.setName(rs.getString("Name"));
                item.setDescription(rs.getString("Description"));
                itemList.add(item);
            }

            pageData.put("list", itemList);
            pageData.put("pageSize", page.getSize());
            pageData.put("currPage", page.getCurrent());
            long totalPage = (totalCount / page.getSize() == 0) ? totalCount / page.getSize() : totalCount / page.getSize() + 1;
            pageData.put("totalPage", totalPage);


            JDBCUtils.release(rs,conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @Override
    public void export(Map<String, Object> params,String vueSql) {
        try {
            Connection conn = JDBCUtils.getConn(sqliteUrl);

            if (conn == null) {
                return;
            }
            Statement state = conn.createStatement();
            String sql = vueSql + " order by rowid asc " ;

            System.out.println(sql);
            ResultSet rs = state.executeQuery(sql); //查询数据

            List<String> dataList = new ArrayList<>();
            while (rs.next()) {
                String exportData = rs.getInt("rowid") + "," + rs.getBigDecimal("PMID")
                        + "," + rs.getInt("Year") + "," + rs.getString("Name")
                        + "," + rs.getString("Description");
                dataList.add(exportData);
            }

            CSVUtils.exportCsv(new File(csvPath), dataList);

            JDBCUtils.release(rs,conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
