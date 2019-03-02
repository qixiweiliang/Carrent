package cn.sxt.sys.mapper;

import cn.sxt.sys.domain.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    List<Menu> queryAllMenus(Menu menu);

    Integer queryCountForSon(@Param("id") Integer id);

    void deleteRoleMenuByMid(Integer id);

    List<Menu> queryMenuByRoleId(Integer roleid);


    List<Menu> queryAllMenusByuserId(Integer userId);
}