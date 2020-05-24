package com.entity;

import lombok.Data;

/**
 * @author baibaiben
 * @create 2020-05-10 16:46
 * 权限表
 */
@Data
public class Jurisdiction {

    private Integer id;
    private Integer accoutnId;//用户ID
    private Integer menuId;//菜单ID
}
