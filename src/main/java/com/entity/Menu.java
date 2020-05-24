package com.entity;

import lombok.Data;

/**
 * @author baibaiben
 * @create 2020-05-10 16:44
 * 菜单表
 */
@Data
public class Menu {

    private Integer id;
    private Integer parentId;//父菜单ID
    private String name;//菜单名
    private String location;//链接
    private Menu menu;//父菜单
}
