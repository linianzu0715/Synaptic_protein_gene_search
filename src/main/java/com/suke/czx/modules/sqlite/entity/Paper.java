package com.suke.czx.modules.sqlite.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 论文
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-15 16:39:27
 */
@Data
@TableName("paper")
@EqualsAndHashCode(callSuper = true)
public class Paper extends Model<Paper> implements Serializable {
	private static final long serialVersionUID = 1L;

		//列id
		@TableId
		private Integer rowid;
		//PMID
		private BigDecimal pmid;
		//年份
		private Integer year;
		//名字
		private String name;
		//描述
		private String description;
	
}
