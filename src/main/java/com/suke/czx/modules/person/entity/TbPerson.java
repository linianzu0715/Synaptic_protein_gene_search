package com.suke.czx.modules.person.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;


/**
 * 人员表
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 11:53:58
 */
@Data
@TableName("tb_person")
@EqualsAndHashCode(callSuper = true)
public class TbPerson extends Model<TbPerson> implements Serializable {
	private static final long serialVersionUID = 1L;

		//
		@TableId
		private Long id;
		//名字
		private String name;
		//年龄
		private String age;
		//地址
		private String address;
	
}
