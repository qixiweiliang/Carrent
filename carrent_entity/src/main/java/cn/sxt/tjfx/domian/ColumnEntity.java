package cn.sxt.tjfx.domian;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 17:48
 * @Author: Mr.Wen
 * @Description:
 */
public class ColumnEntity {
    private List<String> names=new ArrayList<>();
    private  List<Double> values =new ArrayList<>();

    public List<String> getNames() {
        return names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }

    public List<Double> getValues() {
        return values;
    }

    public void setValues(List<Double> values) {
        this.values = values;
    }
}
