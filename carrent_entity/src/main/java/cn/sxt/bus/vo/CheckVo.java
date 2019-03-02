package cn.sxt.bus.vo;

import cn.sxt.bus.domain.Check;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:21
 * @Author: Mr.Wen
 * @Description:
 */
public class CheckVo extends Check {
    private Integer page;
    private Integer rows;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public CheckVo() {
    }

    public CheckVo(Integer page, Integer rows, Date startTime, Date endTime) {
        this.page = page;
        this.rows = rows;
        this.startTime = startTime;
        this.endTime = endTime;
    }
}
