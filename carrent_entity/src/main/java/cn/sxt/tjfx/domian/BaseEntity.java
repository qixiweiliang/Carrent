package cn.sxt.tjfx.domian;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 17:47
 * @Author: Mr.Wen
 * @Description:
 */
public class BaseEntity {
    private String name;
    private Double value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
