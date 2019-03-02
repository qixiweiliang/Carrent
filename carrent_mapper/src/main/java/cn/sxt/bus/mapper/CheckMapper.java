package cn.sxt.bus.mapper;

import cn.sxt.bus.domain.Check;
import cn.sxt.bus.vo.CheckVo;

import java.util.List;

public interface CheckMapper {
    int deleteByPrimaryKey(String checkid);

    int insert(Check record);

    int insertSelective(Check record);

    Check selectByPrimaryKey(String checkid);

    int updateByPrimaryKeySelective(Check record);

    int updateByPrimaryKey(Check record);

    List<Check> queryAllCheck(CheckVo checkVo);
}