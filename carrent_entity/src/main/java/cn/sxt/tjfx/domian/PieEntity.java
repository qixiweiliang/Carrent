package cn.sxt.tjfx.domian;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 15:03
 * @Author: Mr.Wen
 * @Description:
 */
public class PieEntity {
    private String name;
    private Integer value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public PieEntity() {
    }

    public PieEntity(String name, Integer value) {
        this.name = name;
        this.value = value;
    }
}
