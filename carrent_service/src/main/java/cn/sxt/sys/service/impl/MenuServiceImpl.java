package cn.sxt.sys.service.impl;

import cn.sxt.sys.domain.Menu;
import cn.sxt.sys.mapper.MenuMapper;
import cn.sxt.sys.service.MenuService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.MenuVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 9:58
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenus(MenuVo menuVo) {
        return menuMapper.queryAllMenus(menuVo);
    }

    @Override
    public List<Menu> queryAllMenusByUserId(MenuVo menuVo, Integer userId) {
        return menuMapper.queryAllMenusByuserId(userId);
    }

    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page page = PageHelper.startPage(menuVo.getPage(), menuVo.getRows());
        List<Menu> menus = this.menuMapper.queryAllMenus(menuVo);
        return new DataGridView(page.getTotal(), menus);
    }

    @Override
    public void addMenu(MenuVo menuVo) {
        this.menuMapper.insertSelective(menuVo);
    }

    @Override
    public void updateMenu(MenuVo menuVo) {
        this.menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    @Override
    public Integer queryMenuCount(Integer id) {
        Integer count = this.menuMapper.queryCountForSon(id);
        return count;
    }

    @Override
    public void deleteMenu(Integer id) {
        /*删除role_menu 对应的角色*/
        this.menuMapper.deleteRoleMenuByMid(id);
        this.menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Menu> queryMenuByRoleId(Integer roleid) {
        return this.menuMapper.queryMenuByRoleId(roleid);
    }
}
