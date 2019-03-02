package cn.sxt.bus.controller;

import cn.sxt.bus.constast.BUSConstast;
import cn.sxt.bus.service.CheckService;
import cn.sxt.bus.utils.CarrentRandomUtils;
import cn.sxt.bus.vo.CheckVo;
import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Map;

/**
 * @program: Checkrent_SSM
 * @Date: 2019/1/16 16:20
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("check")
public class CheckController {
    @Autowired
    private CheckService checkService;


    /**
     * 跳转车辆入库管理
     *
     * @return
     */
    @RequestMapping("toCheckCarManager")
    public String toCheckCarManager() {
        return "business/checkCarManager";
    }

    @RequestMapping("loadAllCheck")
    @ResponseBody
    public DataGridView loadAllCheck(CheckVo checkVo) {
        DataGridView gridView = this.checkService.queryAllCheck(checkVo);
        return gridView;
    }

    /**
     * 检查单管理
     *
     * @return
     */
    @RequestMapping("toCheckManager")
    public String toCheck() {
        return "business/checkManager";
    }

    @RequestMapping("initCheckFormAndAllMessage")
    @ResponseBody
    public Map<String, Object> initCheckFormAndAllMessage(CheckVo checkVo) {
        Map<String, Object> map = this.checkService.queryCarRentCustomerMsgByRentIdForMap(checkVo.getRentid());
        /*传值已将封装了租车Id*/
        checkVo.setCheckdate(new Date());
        checkVo.setOpername(WebUtils.getCurrentUser(User.class, "login").getRealname());
        checkVo.setCheckid(CarrentRandomUtils.createRandomStringId(BUSConstast.PROFIX_JC));
        map.put("check", checkVo);
        return map;
    }

    @RequestMapping("addCheck")
    @ResponseBody
    public ResultObj addCheck(CheckVo checkVo) {
        ResultObj obj = null;
        try {
            this.checkService.insertCheck(checkVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    @RequestMapping("updateCheck")
    @ResponseBody
    public ResultObj uploadCheck(CheckVo checkVo) {
        ResultObj obj = null;
        try {
            this.checkService.uploadCheck(checkVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    @RequestMapping("deleteCheck")
    @ResponseBody
    public ResultObj deleteCheck(CheckVo checkVo) {
        ResultObj obj = null;

        try {
            this.checkService.deleteCheck(checkVo.getCheckid());
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DELETE_ERROR);
        }
        return obj;
    }

}
