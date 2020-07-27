package com.suke.czx.modules.student.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;


/**
 * 学号管理
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2020-06-14 12:42:50
 */
@Data
@TableName("sys_student")
@EqualsAndHashCode(callSuper = true)
public class SysStudent extends Model<SysStudent> implements Serializable {
	private static final long serialVersionUID = 1L;

		//
		@TableId
		private Long id;
		//用户名
		private String username;
		//密码
		private String password;
		//盐
		private String salt;
		//邮箱
		private String email;
		//手机号
		private String mobile;
		//状态  0：禁用   1：正常
		private Integer status;
		//创建者ID
		private Long createUserId;
		//创建时间
		private Date createTime;
	
}
