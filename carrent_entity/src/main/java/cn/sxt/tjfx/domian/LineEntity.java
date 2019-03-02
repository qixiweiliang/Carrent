package cn.sxt.tjfx.domian;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 19:42
 * @Author: Mr.Wen
 * @Description:
 */

public class LineEntity {
    //查询出来月份
    private String month;
    //当月销售额
    private Double value;

    public LineEntity() {
    }

    public LineEntity(String month, Double value) {
        this.month = month;
        this.value = value;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
