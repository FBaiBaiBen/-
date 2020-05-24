package com.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author baibaiben
 * @create 2020-05-10 16:55
 * 员工表
 */
@Data
public class Staff {

    private Integer id;
    private Integer postId;//职位ID
    private Integer sectionId;//部门ID
    private String name;//名字
    private String sex;//性别
    private String phone;//电话号码
    private String mailbox;//邮箱
    private String education;//学历
    private String identity;//身份证号码
    private String site;//地址
    private Integer state;//状态
    @DateTimeFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private Date time;//建档日期
    private Post post;//职位
    private Section section;//部门
}
