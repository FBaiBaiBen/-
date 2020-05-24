package com.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author baibaiben
 * @create 2020-05-10 16:35
 * 用户表
 */
@Data
public class Account {

    private Integer id;
    private String name;//用户名
    private String loginName;//登录名
    private String password;//密码
    private Integer state;//状态（0已删除/1存在）
    @DateTimeFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private Date time;//创建时间
}
