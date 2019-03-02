package cn.sxt.tjfx.mapper;

import cn.sxt.tjfx.domian.BaseEntity;
import cn.sxt.tjfx.domian.LineEntity;
import cn.sxt.tjfx.domian.PieEntity;

import java.util.List;

public interface TjfxMapper {
    List<PieEntity> queryAllCustomerArea();

    List<LineEntity> queryjYearMonthLineForJchen(String year);

    List<BaseEntity> queryjYearMonthColumn(String year);
}