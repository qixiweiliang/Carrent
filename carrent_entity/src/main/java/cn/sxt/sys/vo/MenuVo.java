package cn.sxt.sys.vo;

import cn.sxt.sys.domain.Menu;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 9:58
 * @Author: Mr.Wen
 * @Description:
 */
public class MenuVo extends Menu {
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
}
