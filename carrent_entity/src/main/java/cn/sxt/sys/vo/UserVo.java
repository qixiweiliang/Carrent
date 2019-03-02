package cn.sxt.sys.vo;

import cn.sxt.sys.domain.User;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/15 19:42
 * @Author: Mr.Wen
 * @Description:
 */
public class UserVo extends User {
    private Integer page;
    private Integer rows;
    private Integer[] ids;
    private Boolean checked;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

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
