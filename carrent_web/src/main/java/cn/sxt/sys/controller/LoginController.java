package cn.sxt.sys.controller;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.LoginInfo;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.LoginInfoService;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.WebUtils;
import cn.sxt.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/15 19:48
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private LoginInfoService loginInfoService;

    @RequestMapping("toLogin")
    public String toLogin() {
        return "system/main/login";
    }

    @RequestMapping("login")
    public String login(UserVo userVo, Model model) {
        User login = userService.login(userVo);
        if (null != login) {
            WebUtils.getCurrentSession().setAttribute("login", login);
            //记录日志
            LoginInfo lo =new LoginInfo();
            lo.setLoginip(WebUtils.getCurrentHttpServletRequest().getRemoteAddr());
            lo.setLoginname(login.getRealname());
            lo.setLogintime(new Date());
            this.loginInfoService.addLoginInfo(lo);

            return "system/main/index";
        } else {
            model.addAttribute("error", SYSConstast.LOGIN_ERROR);
            return "system/main/login";
        }

    }
    /**
    * @Description: 退出登录
    * @param
    * @Return: java.lang.String
    * @Author: Mr.Wen
    * @Date: 2019/1/22 11:30
    */
    @RequestMapping("loginOut")
    @ResponseBody
    public String loginOut() {
        WebUtils.getCurrentSession().invalidate();
        return null;
    }
}
