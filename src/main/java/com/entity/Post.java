package com.entity;

import lombok.Data;

/**
 * @author baibaiben
 * @create 2020-05-10 16:52
 * 职位表
 */
@Data
public class Post {

    private Integer id;
    private String name;//职位名称
    private String details;//详细信息
}
