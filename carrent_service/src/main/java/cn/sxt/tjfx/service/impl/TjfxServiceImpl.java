package cn.sxt.tjfx.service.impl;


import cn.sxt.tjfx.domian.BaseEntity;
import cn.sxt.tjfx.domian.ColumnEntity;
import cn.sxt.tjfx.domian.LineEntity;
import cn.sxt.tjfx.domian.PieEntity;
import cn.sxt.tjfx.mapper.TjfxMapper;
import cn.sxt.tjfx.service.TjfxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 15:33
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class TjfxServiceImpl implements TjfxService {
    @Autowired
    private TjfxMapper tjfxMapper;

    @Override
    public List<PieEntity> queryCustomer() {
        return this.tjfxMapper.queryAllCustomerArea();
    }

    @Override
    public ColumnEntity queryjYearMonthLineForJchen(String year) {
        List<LineEntity> entityList = this.tjfxMapper.queryjYearMonthLineForJchen(year);
        ColumnEntity comEntity = new ColumnEntity();
        if (entityList.size() > 0) {
            List<String> names = comEntity.getNames();
            List<Double> values = comEntity.getValues();
            for (int i = 1; i <= 12; i++) {
                names.add(i + "");
                values.add(0.0);
            }
            for (LineEntity lineEntity : entityList) {
                for (int i = 0; i < names.size(); i++) {
                    if (lineEntity.getMonth().equals(names.get(i))) {
                        System.out.println("我是已有的月份" + lineEntity.getMonth());
                        values.set(i, lineEntity.getValue());
                    }
                }
            }
        }
        return comEntity;
    }

    @Override
    public ColumnEntity queryjYearMonthColumn(String year) {
        List<BaseEntity> baseEntities = this.tjfxMapper.queryjYearMonthColumn(year);
        ColumnEntity columnEntity = new ColumnEntity();
        if (null != baseEntities) {
            for (BaseEntity baseEntity : baseEntities) {
                columnEntity.getNames().add(baseEntity.getName());
                columnEntity.getValues().add(baseEntity.getValue());
            }
        }
        return columnEntity;
    }
}
