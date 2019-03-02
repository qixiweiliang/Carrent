package cn.sxt.sys.controller;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.service.LoginInfoService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LoginInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:30
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("loginInfo")
public class LoginInfoController {
    @Autowired
    private LoginInfoService loginInfoService;
    @RequestMapping("toLoginInfo")
    public String toLoginInfo(){
        return "system/loginInfoManager";
    }

    @RequestMapping("loadAllLoginInfo")
    @ResponseBody
    public DataGridView loadAllLoginInfo(LoginInfoVo loginInfoVo){
        DataGridView dataGridView = this.loginInfoService.queryLoginInfos(loginInfoVo);
        return dataGridView;
    }

    @RequestMapping("deleteLoginInfo")
    @ResponseBody
    public ResultObj deleteLoginInfo(LoginInfoVo loginInfoVo){
        ResultObj rsob =null;

        try {
          this.loginInfoService.deleteLoginInfo(loginInfoVo.getId());
            rsob=new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_DELETE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            rsob=new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_DELETE_ERROR);
        }

        return rsob;
    }
}
