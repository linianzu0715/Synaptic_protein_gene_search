package com.suke.czx.modules.sqlite.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.suke.czx.common.utils.CSVUtils;
import com.suke.czx.common.utils.JDBCUtils;
import com.suke.czx.modules.sqlite.entity.Fullall;
import com.sun.media.sound.SoftTuning;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.suke.czx.modules.sqlite.mapper.FullallMapper;
import com.suke.czx.modules.sqlite.entity.Fullall;
import com.suke.czx.modules.sqlite.service.FullallService;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Condition;


@Service
public class FullallServiceImpl extends ServiceImpl<FullallMapper, Fullall> implements FullallService {

    @Value("${sqlite.serverURI}")
    private String sqliteUrl;

    @Value("${view.path}")
    private String csvPath;

    @Value("${export.num}")
    private Integer exportNum;

    static {
        FullallService.ppiSqlMap.put("ppiSql", "SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ");
    }

    @Override
    public Map findAllBySqlite(IPage<Fullall> page, QueryWrapper<Fullall> queryWrapper, String vueSql) {
        HashMap<Object, Object> pageData = new HashMap<>();


        System.out.println(exportNum);
        try {

            Connection conn = JDBCUtils.getConn(sqliteUrl);

            if (conn == null) {
                return pageData;
            }

            Statement state = conn.createStatement();

            int index = vueSql.indexOf("FullAll");


            String countSql = "select count(0) count from FullAll " + vueSql.substring(index + "FullAll".length(), vueSql.length());
            System.out.println(countSql);
            ResultSet rs = state.executeQuery(countSql); //查询总条数
            int totalCount = rs.getInt("count");

            String sql = vueSql + " limit " + (page.getCurrent() - 1) * page.getSize() + "," + page.getSize();


            System.out.println(sql);
            rs = state.executeQuery(sql); //查询数据

            List<Fullall> itemList = new ArrayList<>();

            String columnStr = vueSql.substring(0, index);

            while (rs.next()) {
                Fullall item = new Fullall();

                item.setGeneid(rs.getInt("GeneID"));
                if (columnStr.contains("Compartment")) {
                    item.setCompartment(rs.getString("Compartment"));
                }
                item.setHumanentrez(rs.getString("Humanentrez"));
                item.setHumanname(rs.getString("Humanname"));
                item.setMouseentrez(rs.getString("Mouseentrez"));
                item.setMousename(rs.getString("Mousename"));
                item.setRatentrez(rs.getString("Ratentrez"));
                item.setRatname(rs.getString("Ratname"));


                if (columnStr.contains("PMID")) {
                    item.setPmid(rs.getInt("PMID"));
                }
                if (columnStr.contains("Year")) {
                    item.setYear(rs.getString("Year"));
                }
                if (columnStr.contains("Paper")) {
                    item.setPaper(rs.getString("Paper"));
                }
                if (columnStr.contains("Brain_Region")) {
                    item.setBrainRegion(rs.getString("Brain_Region"));
                }
                if (columnStr.contains("Disease")) {
                    item.setDisease(rs.getString("Disease"));
                }
                if (columnStr.contains("Species")) {
                    item.setSpecies(rs.getString("Species"));
                }
                if (columnStr.contains("Method")) {
                    item.setMethod(rs.getString("Method"));
                }
//                item.setPmid(rs.getInt("PMID"));
//                item.setYear(rs.getString("Year"));
//                item.setPaper(rs.getString("Paper"));
//                item.setBrainRegion(rs.getString("Brain_Region"));
//                item.setDisease(rs.getString("Disease"));
//                item.setSpecies(rs.getString("Species"));
//                item.setMethod(rs.getString("Method"));
//                item.setCompartment();
                itemList.add(item);
            }

            pageData.put("totalCount", totalCount);
            System.out.println("totalCount = " + totalCount);
            pageData.put("list", itemList);
            pageData.put("pageSize", page.getSize());
            pageData.put("currPage", page.getCurrent());
            long totalPage = (totalCount / page.getSize() == 0) ? totalCount / page.getSize() : totalCount / page.getSize() + 1;
            pageData.put("totalPage", totalPage);

            FullallService.ppiSqlMap.put("ppiSql", vueSql);

            System.out.println(FullallService.ppiSqlMap.get("ppiSql"));
            JDBCUtils.release(rs, conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @Override
    public void export(Map<String, Object> params) {
        String ppiSql = ppiSqlMap.get("ppiSql");
        try {
            Connection conn = JDBCUtils.getConn(sqliteUrl);

            if (conn == null) {
                return;
            }
            Statement state = conn.createStatement();
            String sql = ppiSql;

            System.out.println(sql);
            ResultSet rs = state.executeQuery(sql); //查询数据

            List<String> dataList = new ArrayList<>();
            int x = 0;
            StringBuilder title = new StringBuilder(50);
//GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method
            if (ppiSql.contains("GeneID")) {
                title.append("," + "GeneID");
            }
            if (ppiSql.contains("Compartment")) {
                title.append("," + "Compartment");
            }
            if (ppiSql.contains("HumanEntrez")) {
                title.append("," + "HumanEntrez");
            }
            if (ppiSql.contains("HumanName")) {
                title.append("," + "HumanName");
            }
            if (ppiSql.contains("MouseEntrez")) {
                title.append("," + "MouseEntrez");
            }
            if (ppiSql.contains("MouseName")) {
                title.append("," + "MouseName");
            }
            if (ppiSql.contains("RatEntrez")) {
                title.append("," + "RatEntrez");
            }
            if (ppiSql.contains("RatName")) {
                title.append("," + "RatName");
            }
            if (ppiSql.contains("PMID")) {
                title.append("," + "PMID");
            }
            if (ppiSql.contains("Year")) {
                title.append("," + "Year");
            }
            if (ppiSql.contains("Paper")) {
                title.append("," + "Paper");
            }
            if (ppiSql.contains("Brain_Region")) {
                title.append("," + "Brain_Region");
            }
            if (ppiSql.contains("Disease")) {
                title.append("," + "Disease");
            }
            if (ppiSql.contains("Species")) {
                title.append("," + "Species");
            }
            if (ppiSql.contains("Method")) {
                title.append("," + "Method");
            }

            String realTitle = title.toString().substring(1, title.length());

            System.out.println("realTitle:" + realTitle);
            while (rs.next()) {
                if (dataList.size() == 0) {
                    dataList.add(realTitle);
                }
                StringBuilder exportData = new StringBuilder(50);
                if (ppiSql.contains("GeneID")) {
                    exportData.append("," + rs.getInt("GeneID"));
                }
                if (ppiSql.contains("Compartment")) {
                    exportData.append("," + "Compartment");
                }
                if (ppiSql.contains("HumanEntrez")) {
                    exportData.append("," + rs.getString("HumanEntrez"));
                }
                if (ppiSql.contains("HumanName")) {
                    exportData.append("," + rs.getString("HumanName"));
                }
                if (ppiSql.contains("MouseEntrez")) {
                    exportData.append("," + rs.getString("MouseEntrez"));
                }
                if (ppiSql.contains("MouseName")) {
                    exportData.append("," + rs.getString("MouseName"));
                }
                if (ppiSql.contains("RatEntrez")) {
                    exportData.append("," + rs.getString("RatEntrez"));
                }
                if (ppiSql.contains("RatName")) {
                    exportData.append("," + rs.getString("RatName"));
                }
                if (ppiSql.contains("PMID")) {
                    exportData.append("," + rs.getInt("PMID"));
                }
                if (ppiSql.contains("Year")) {
                    exportData.append("," + rs.getString("Year"));
                }
                if (ppiSql.contains("Paper")) {
                    exportData.append("," + rs.getString("Paper"));
                }
                if (ppiSql.contains("Brain_Region")) {
                    exportData.append("," + rs.getString("Brain_Region"));
                }
                if (ppiSql.contains("Disease")) {
                    exportData.append("," + rs.getString("Disease"));
                }
                if (ppiSql.contains("Species")) {
                    exportData.append("," + rs.getString("Species"));
                }
                if (ppiSql.contains("Method")) {
                    exportData.append("," + rs.getString("Method"));
                }


//                String exportData = rs.getInt("GeneID") + "," + rs.getString("Compartment") + "," + rs.getString("Humanentrez") + "," + rs.getString("Humanname") + "," + rs.getString("Mouseentrez") + "," + rs.getString("Mousename") + "," + rs.getString("Ratentrez") + "," + rs.getString("Ratname") + "," + rs.getInt("PMID") + "," + rs.getString("Year") + "," + rs.getString("Paper") + "," + rs.getString("Brain_Region") + "," + rs.getString("Disease") + "," + rs.getString("Species") + "," + rs.getString("Method");
                String exData = exportData.toString().substring(1, exportData.length());
                dataList.add(exData);
//                System.out.println("exData = " + exData);
                if (dataList.size() == exportNum + 1) {
                    x++;
                    String fileName = csvPath + "(" + exportNum * (x - 1) + 1 + "-" + exportNum * x + ")" + ".csv";
                    System.out.println(fileName);
                    System.out.println("dataList.size() = " + dataList.size());
                    CSVUtils.exportCsv(new File(fileName), dataList);
                    dataList.clear();
                }
            }

            String lastName = csvPath + "(" + exportNum * (x - 1) + 1 + "-" + (exportNum * x + dataList.size() - 1) + ")" + ".csv";
            System.out.println(lastName);
            CSVUtils.exportCsv(new File(lastName), dataList);

            JDBCUtils.release(rs, conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
