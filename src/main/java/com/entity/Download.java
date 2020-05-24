package com.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author baibaiben
 * @create 2020-05-10 16:40
 * 下载中心
 */
@Data
public class Download {

    private Integer id;
    private Integer accountId;//创建人ID
    private String name;//标题
    private String description;//描述
    private String location;//文件位置
    private Integer state;//状态
    @DateTimeFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private Date time;//创建时间
    private Account account;//创建人
}
