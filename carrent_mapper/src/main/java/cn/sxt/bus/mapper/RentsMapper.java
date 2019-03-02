package cn.sxt.bus.mapper;

import cn.sxt.bus.domain.Rents;
import cn.sxt.bus.vo.RentsVo;

import java.util.List;

public interface RentsMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(Rents record);

    int insertSelective(Rents record);

    Rents selectByPrimaryKey(String rentid);

    int updateByPrimaryKeySelective(Rents record);

    int updateByPrimaryKey(Rents record);


    List<Rents> queryAllRents(RentsVo rentsVo);
}