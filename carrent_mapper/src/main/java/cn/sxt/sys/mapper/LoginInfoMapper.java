package cn.sxt.sys.mapper;

import cn.sxt.sys.domain.LoginInfo;

import java.util.List;

public interface LoginInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LoginInfo record);

    int insertSelective(LoginInfo record);

    LoginInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoginInfo record);

    int updateByPrimaryKey(LoginInfo record);

    List<LoginInfo> queryAllLoginInfo(LoginInfo loginInfo);
}