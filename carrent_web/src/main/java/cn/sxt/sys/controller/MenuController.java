package cn.sxt.sys.controller;


import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.Menu;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.MenuService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.TreeNodeBuilder;
import cn.sxt.sys.utils.TreeNodes;
import cn.sxt.sys.utils.WebUtils;
import cn.sxt.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 9:43
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    /**
     * @param menuVo
     * @Description:
     * @Return: java.util.List<cn.sxt.sys.utils.TreeNodes>
     * @Author: Mr.Wen
     * @Date: 2019/1/20 14:41
     */
    @ResponseBody
    @RequestMapping("loadIndexMenuTreeJson")
    public List<TreeNodes> loadIndexMenuTreeJson(MenuVo menuVo) {
        User login = WebUtils.getCurrentUser(User.class, "login");
        List<Menu> menus = null;
        menuVo.setAvailable(SYSConstast.AVAILABLE_TRUE);
        // 如果用户管理权限为1
        if (login.getType() == SYSConstast.USER_TYPE_SUPER) {
            menus = menuService.queryAllMenus(menuVo);
        } else {
            menus = menuService.queryAllMenusByUserId(menuVo, login.getUserid());
        }
        List<TreeNodes> list = new ArrayList<>();
        for (Menu menu : menus) {
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String name = menu.getName();
            Boolean isParent = menu.getParent() == SYSConstast.PARENT_TRUE;
            Boolean open = menu.getOpen() == SYSConstast.OPEN_TRUE;
            String href = menu.getHref();
            String icon = menu.getIcon();
            String tabicon = menu.getTabicon();
            list.add(new TreeNodes(id, pid, name, isParent, open, href, icon, tabicon));

        }
        return list;
    }

    /**
     * 跳转
     *
     * @return
     */
    @RequestMapping("toMenuManager")
    public String toMenuManager() {
        return "system/menuManager";
    }

    /**
     * @param menuVo
     * @Description: 树结构
     * @Return: cn.sxt.sys.utils.DataGridView
     * @Author: Mr.Wen
     * @Date: 2019/1/20 14:39
     */
    @RequestMapping("loadAllMenu")
    @ResponseBody
    public DataGridView loadAllMenu(MenuVo menuVo) {
        return this.menuService.queryAllMenu(menuVo);
    }

    /**
     * @param menuVo
     * @Description: 树结构信息列表
     * @Return: java.util.List<cn.sxt.sys.utils.TreeNodes>
     * @Author: Mr.Wen
     * @Date: 2019/1/20 14:39
     */
    @ResponseBody
    @RequestMapping("loadMenuManagerTreeJson")
    public List<TreeNodes> loadMenuManagerTreeJson(MenuVo menuVo) {
        List<Menu> menus = this.menuService.queryAllMenus(menuVo);
        List<TreeNodes> list = new ArrayList<>();
        for (Menu menu : menus) {
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String name = menu.getName();
            Boolean isParent = menu.getParent() == SYSConstast.PARENT_TRUE;
            Boolean open = menu.getOpen() == SYSConstast.OPEN_TRUE;
            String href = menu.getHref();
            String icon = menu.getIcon();
            String tabicon = menu.getTabicon();
            list.add(new TreeNodes(id, pid, name, isParent, open, href, icon, tabicon));
        }
        return list;
    }

    /**
     * @param menuVo
     * @Description: 添加菜单
     * @Return: cn.sxt.sys.domain.ResultObj
     * @Author: Mr.Wen
     * @Date: 2019/1/20 14:36
     */
    @RequestMapping("addMenu")
    @ResponseBody
    public ResultObj addMenu(MenuVo menuVo) {
        System.out.println(menuVo);
        ResultObj obj = null;
        try {
            this.menuService.addMenu(menuVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    /**
     * @param menuVo
     * @Description: 弹出层添加及修改 ComboTree 并转为标准格式
     * @Return: java.util.List<cn.sxt.sys.utils.TreeNodes>
     * @Author: Mr.Wen
     * @Date: 2019/1/20 14:34
     */
    @ResponseBody
    @RequestMapping("loadMenuManagerComboTreeJson")
    public List<TreeNodes> loadMenuManagerComboTreeJson(MenuVo menuVo) {
        menuVo.setAvailable(SYSConstast.AVAILABLE_TRUE);
        List<Menu> menus = this.menuService.queryAllMenus(menuVo);
        List<TreeNodes> treeNodes = new ArrayList<>();
        for (Menu menu : menus) {
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String name = menu.getName();
            treeNodes.add(new TreeNodes(id, pid, name));
        }
        Integer topId = 0;
        return TreeNodeBuilder.bulid(treeNodes, topId);
    }

    /**
     * @param menuVo
     * @Description: 修改菜单
     * @Return: cn.sxt.sys.domain.ResultObj
     * @Author: Mr.Wen
     * @Date: 2019/1/20 23:30
     */
    @RequestMapping("updateMenu")
    @ResponseBody
    public ResultObj updateMenu(MenuVo menuVo) {
        ResultObj obj = null;
        try {
            this.menuService.updateMenu(menuVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    @RequestMapping("queryMenuCount")
    @ResponseBody
    public ResultObj queryMenuCount(MenuVo menuVo) {
        ResultObj obj = null;
        try {
            Integer count = this.menuService.queryMenuCount(menuVo.getId());
            if (count > 0) {
                obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_MSG);
            } else {
                /*0代表没有根节点可以删除*/
                obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
            }
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }
    /**
    * @Description: 删除菜单  
    * @param menuVo
    * @Return: cn.sxt.sys.domain.ResultObj
    * @Author: Mr.Wen
    * @Date: 2019/1/20 23:59
    */
    @RequestMapping("deleteMenu")
    @ResponseBody
    public ResultObj deleteMenu(MenuVo menuVo){
        ResultObj rsob =null;
        try {
            this.menuService.deleteMenu(menuVo.getId());
            rsob=new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_DELETE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            rsob=new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_DELETE_ERROR);
        }

        return rsob;
    }
}
