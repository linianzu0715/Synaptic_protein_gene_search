package com.suke.czx.modules.person.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.suke.czx.common.utils.JDBCUtils;
import com.suke.czx.modules.sqlite.entity.PPI;
import com.suke.czx.modules.sqlite.entity.Paper;
import com.suke.czx.modules.sqlite.service.FullallService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.suke.czx.modules.person.mapper.TbPersonMapper;
import com.suke.czx.modules.person.entity.TbPerson;
import com.suke.czx.modules.person.service.TbPersonService;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class TbPersonServiceImpl extends ServiceImpl<TbPersonMapper, TbPerson> implements TbPersonService {

    @Value("${sqlite.serverURI}")
    private String sqliteUrl;

    @Value("${gene.num}")
    private String geneNum;

    @Override
    public Map findPpi() {
        HashMap<Object, Object> ppiData = new HashMap<>();

        try {

            Connection conn = JDBCUtils.getConn(sqliteUrl);

            if (conn == null) {
                return ppiData;
            }

            Statement state = conn.createStatement();


//            String sql = "select A,B from PPI where A <= " + geneNum + " and B <= " + geneNum;
            String ppiSql = FullallService.ppiSqlMap.get("ppiSql");

            String sql = "SELECT distinct A , B FROM PPI JOIN (" + ppiSql +
                    ") r1 on PPI.A = r1.GeneID JOIN (" + ppiSql + ") r2 on PPI.B = r2.GeneID";


            System.out.println("sql = " + sql);
            ResultSet rs = state.executeQuery(sql); //查询数据;


            List<PPI> itemList = new ArrayList<>();
            while (rs.next()) {
                PPI item = new PPI();
                item.setA(rs.getInt("A"));
                item.setB(rs.getInt("B"));

                itemList.add(item);
            }

            int index = ppiSql.indexOf("FullAll");

            String whereSql = ppiSql.substring(index + "FullAll".length(), ppiSql.length());

            String geneIdSql = "SELECT distinct GeneID FROM FullAll" + whereSql;

            rs = state.executeQuery(geneIdSql); //查询数据;

            List<Integer> geneIdList = new ArrayList<>();
            while (rs.next()) {
                geneIdList.add(rs.getInt("GeneID"));
            }


            ppiData.put("abList", itemList);
            ppiData.put("geneIdList", geneIdList);

            JDBCUtils.release(rs, conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ppiData;
    }
}
