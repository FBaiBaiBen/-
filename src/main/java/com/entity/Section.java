package com.entity;

import lombok.Data;

/**
 * @author baibaiben
 * @create 2020-05-10 16:54
 * 部门表
 */
@Data
public class Section {

    private Integer id;
    private String name;//部门名称
    private String details;//详细信息
}
