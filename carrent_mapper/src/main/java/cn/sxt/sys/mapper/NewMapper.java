package cn.sxt.sys.mapper;

import cn.sxt.sys.domain.New;

import java.util.List;

public interface NewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(New record);

    int insertSelective(New record);

    New selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(New record);

    int updateByPrimaryKey(New record);

    List<New> queryAllNew(New newz);
}