package com.controller;

import com.entity.Jurisdiction;
import com.service.JurisdictionService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Jurisdiction)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:19:01
 */
@RestController
@RequestMapping("jurisdiction")
public class JurisdictionController {
    /**
     * 服务对象
     */
    @Resource
    private JurisdictionService jurisdictionService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Jurisdiction selectOne(Integer id) {
        return this.jurisdictionService.selectId(id);
    }

}