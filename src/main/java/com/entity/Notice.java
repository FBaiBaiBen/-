package com.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author baibaiben
 * @create 2020-05-10 16:50
 * 公告表
 */
@Data
public class Notice {

    private Integer id;
    private Integer accountId;//发布人ID
    private String name;//公告名称
    private String content;//公告内容
    private Integer state;//状态
    @DateTimeFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private Date time;//发布时间
    private Account account;//发布人
}
