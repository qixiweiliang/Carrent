package cn.sxt.sys.controller;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.Menu;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.service.MenuService;
import cn.sxt.sys.service.RoleService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.TreeNodes;
import cn.sxt.sys.vo.MenuVo;
import cn.sxt.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:30
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    @RequestMapping("toRoleManager")
    public String toRole() {
        return "system/RoleManager";
    }

    @RequestMapping("loadAllRole")
    @ResponseBody
    public DataGridView loadAllRole(RoleVo roleVo) {
        DataGridView dataGridView = this.roleService.queryRole(roleVo);
        return dataGridView;
    }

    @RequestMapping("deleteRole")
    @ResponseBody
    public ResultObj deleteRole(RoleVo roleVo) {
        ResultObj rsob = null;
        try {
            this.roleService.deleteRole(roleVo.getRoleid());
            rsob = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            rsob = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DELETE_ERROR);
        }

        return rsob;
    }

    @RequestMapping("addRole")
    @ResponseBody
    public ResultObj addRole(RoleVo roleVo) {
        ResultObj obj = null;
        try {
            this.roleService.addRole(roleVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    @RequestMapping("updateRole")
    @ResponseBody
    public ResultObj updateRole(RoleVo roleVo) {
        ResultObj obj = null;
        try {
            this.roleService.updateRole(roleVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    @RequestMapping("loadRoleMenuTreeJson")
    @ResponseBody
    public List<TreeNodes> loadRoleMenuTreeJson(RoleVo roleVo) {
        //根据roleId 查询角色拥有的菜单
        List<Menu> currentRoleMenus = this.menuService.queryMenuByRoleId(roleVo.getRoleid());
        //查询所有菜单
        MenuVo menuVo = new MenuVo();
        menuVo.setAvailable(SYSConstast.AVAILABLE_TRUE);
        List<Menu> menus = this.menuService.queryAllMenus(menuVo);

        List<TreeNodes> treeNodes = new ArrayList<>();
        for (Menu menu1 : menus) {
            Boolean checked = false;
            for (Menu menu2 : currentRoleMenus) {
                if (menu1.getId() == menu2.getId()) {
                    checked = true;
                    break;
                }
            }
            Integer id = menu1.getId();
            Integer pid = menu1.getPid();
            String name = menu1.getName();
            Boolean isParent = menu1.getParent() == SYSConstast.PARENT_TRUE;
            Boolean open = menu1.getOpen() == SYSConstast.OPEN_TRUE;
            String icon = menu1.getIcon();
            treeNodes.add(new TreeNodes(id, pid, name, isParent, open, icon, checked));

        }
        return treeNodes;
    }
    @RequestMapping("savaChooseRoleMenu")
    @ResponseBody
    public ResultObj savaChooseRoleMenu(RoleVo roleVo) {
        ResultObj obj = null;
        try {
            this.roleService.savaChooseRoleMenu(roleVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DESPATCHAR_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DESPPATCHAR_ERROR);
        }
        return obj;
    }
}
