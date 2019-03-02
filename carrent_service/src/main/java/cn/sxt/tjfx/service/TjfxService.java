package cn.sxt.tjfx.service;

import cn.sxt.tjfx.domian.ColumnEntity;
import cn.sxt.tjfx.domian.PieEntity;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 15:33
 * @Author: Mr.Wen
 * @Description:
 */
public interface TjfxService {
    List<PieEntity> queryCustomer();

    ColumnEntity queryjYearMonthLineForJchen(String year);

    ColumnEntity queryjYearMonthColumn(String year);
}
