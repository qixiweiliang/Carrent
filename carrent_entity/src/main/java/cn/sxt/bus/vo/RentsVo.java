package cn.sxt.bus.vo;

import cn.sxt.bus.domain.Rents;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/18 14:22
 * @Author: Mr.Wen
 * @Description:
 */
public class RentsVo extends Rents {
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

    public RentsVo() {
    }

    public RentsVo(Integer page, Integer rows) {
        this.page = page;
        this.rows = rows;
    }
}
