package cn.sxt.sys.mapper;

import cn.sxt.sys.domain.Role;

import java.util.List;

public interface RoleMapper {

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> queryAllRole(Role role);

    List<Role> queryAllByRoleUserid(Integer userid);

    int deleteByPrimaryKey(Integer roleid);

    /*插入分配角色前需要先清空 角色rid 及对应 的 分配的菜单 mid*/
    void savaChooseRoleMenu(Integer rid, Integer mid);

    void deleteByPrimaryByRoleid(Integer rid);


    /*给用户分配角色 先删除用户当前拥有角色  在进行插入*/
    void deleteByprimaryKeyByUserid(Integer userid);

    void insertUserRole(Integer userid, Integer rid);

}