package com.suke.czx.modules.sqlite.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-17 14:33:15
 */
@Data
@TableName("fullall")
@EqualsAndHashCode(callSuper = true)
public class Fullall extends Model<Fullall> implements Serializable {
	private static final long serialVersionUID = 1L;

		//
		private Integer geneid;
		//
		private String compartment;
		//
		private String humanentrez;
		//
		private String humanname;
		//
		private String mouseentrez;
		//
		private String mousename;
		//
		private String ratentrez;
		//
		private String ratname;
		//
		private Integer pmid;
		//
		private String year;
		//
		private String paper;
		//
		private String brainRegion;
		//
		private String disease;
		//
		private String species;
		//
		private String method;
	
}
