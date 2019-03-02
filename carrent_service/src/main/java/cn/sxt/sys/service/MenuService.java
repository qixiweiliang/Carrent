package cn.sxt.sys.service;

import cn.sxt.sys.domain.Menu;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.MenuVo;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 9:57
 * @Author: Mr.Wen
 * @Description:
 */
public interface MenuService {
    /*超级管理员可查看所有菜单*/
    List<Menu> queryAllMenus(MenuVo menuVo);

    /*根据用户id来查询当前所拥有角色 及菜单*/
    List<Menu> queryAllMenusByUserId(MenuVo menuVo,Integer userId);

    DataGridView queryAllMenu(MenuVo menuVo);

    void addMenu(MenuVo menuVo);

    void updateMenu(MenuVo menuVo);

    Integer queryMenuCount(Integer id);

    void deleteMenu(Integer id);

    List<Menu> queryMenuByRoleId(Integer roleid);
}
