package cn.sxt.bus.vo;

import cn.sxt.bus.domain.Car;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:21
 * @Author: Mr.Wen
 * @Description:
 */
public class CarVo extends Car {
    private Integer page;
    private Integer rows;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public CarVo() {
    }

    public CarVo(Integer page, Integer rows) {
        this.page = page;
        this.rows = rows;
    }
}
