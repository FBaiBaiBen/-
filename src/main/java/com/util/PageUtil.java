package com.util;

import org.springframework.stereotype.Controller;

/**
 * @author baibaiben
 * @create 2020-04-22 10:04
 */
@Controller
public class PageUtil<T> {

    private Integer num = 1;// 当前页码
    private Integer size = 9;// 每页显示记录数
    private Integer sum;// 总页数
    private Integer total=1;// 总记录条数
    private Integer begin;// 查询起始值
    private Boolean prev;// 是否有上一页
    private Boolean next;// 是否有下一页
    private T condition;// 条件

    public Integer getBegin() {
        return (getNum() - 1) * getSize();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getSum() {
        return (getTotal() - 1) / getSize() + 1;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Boolean getPrev() {
        return getNum() > 1;
    }

    public Boolean getNext() {
        return getNum() < getSum();
    }

    public T getParam() {
        return condition;
    }

    public void setParam(T condition) {
        this.condition = condition;
    }

}
