package cn.sxt.sys.controller;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.PinYinUtils;
import cn.sxt.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 21:32
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("toChangePwd")
    public String toChangePwd(Model model) {
        return "system/changePwd";
    }
    /**
    * @Description: 修改密码
    * @param
    * @Return: cn.sxt.sys.domain.ResultObj
    * @Author: Mr.Wen
    * @Date: 2019/1/22 11:29
    */
    @RequestMapping("changePwd")
    @ResponseBody
    public ResultObj changePwd(UserVo userVo) {
        ResultObj obj = null;
        try {
            this.userService.changePwd(userVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }


    @RequestMapping("toUserManager")
    public String toUser() {
        return "system/userManager";
    }

    @RequestMapping("loadAllUser")
    @ResponseBody
    public DataGridView loadAllUser(UserVo userVo) {
        return this.userService.queryAllUser(userVo);
    }

    @RequestMapping("addUser")
    @ResponseBody
    public ResultObj addUser(UserVo userVo) {
        ResultObj obj;
        try {
            userVo.setType(SYSConstast.USER_TYPE_NORMAL);
            userVo.setPwd(SYSConstast.DEFAULT_PASSWORD);
            this.userService.insertUser(userVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public ResultObj updateUser(UserVo userVo) {
        ResultObj obj = null;
        try {
            this.userService.updateUser(userVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public ResultObj deleteUser(UserVo userVo) {
        ResultObj obj;
        try {
            this.userService.deleteUser(userVo.getUserid());
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DELETE_ERROR);
        }
        return obj;
    }


    @RequestMapping(value = "getPinyinName", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getPinyinName(UserVo userVo) {
        return PinYinUtils.toPinyin(userVo.getRealname());
    }


    @RequestMapping("resertPwd")
    @ResponseBody
    public ResultObj resertPwd(UserVo userVo) {
        ResultObj obj = null;
        try {
            userVo.setPwd(SYSConstast.DEFAULT_PASSWORD);
            this.userService.updateUser(userVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS_PWD);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR_PWD);
        }
        return obj;
    }

    @RequestMapping("loadAllByRoleUserid")
    @ResponseBody
    public DataGridView loadAllByRoleUserid(UserVo userVo) {
        return this.userService.queryAllByRoleUserid(userVo.getUserid());
    }

    /**
     * @param [userVo]
     * @Description: 对角色分配修改
     * @Return: cn.sxt.sys.domain.ResultObj
     * @Author: Mr.Wen
     * @Date: 2019/1/21 23:23
     */
    @RequestMapping("saveUserRole")
    @ResponseBody
    public ResultObj saveUserRole(UserVo userVo) {
        ResultObj obj = null;
        try {
            this.userService.saveUserRole(userVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DESPATCHAR_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DESPPATCHAR_ERROR);
        }
        return obj;
    }

}
