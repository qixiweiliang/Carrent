package cn.sxt.bus.controller;


import cn.sxt.bus.constast.BUSConstast;
import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.domain.Rents;
import cn.sxt.bus.service.CustomerService;
import cn.sxt.bus.service.RentsService;
import cn.sxt.bus.utils.CarrentRandomUtils;
import cn.sxt.bus.utils.ExprotRentExcelUtils;
import cn.sxt.bus.vo.RentsVo;
import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * @program: Rentsrent_SSM
 * @Date: 2019/1/16 16:20
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("rent")
public class RentsController {
    @Autowired
    private RentsService rentsService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("toRentsCarManager")
    public String toRents() {
        return "business/rentCarManager";
    }

    @RequestMapping("addRents")
    @ResponseBody
    public ResultObj addRents(RentsVo rentsVo) {
        ResultObj obj = null;
        try {
            this.rentsService.insertRents(rentsVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    @RequestMapping("initRentCarForm")
    @ResponseBody
    public RentsVo initRentCarForm(RentsVo rentsVo) {
        rentsVo.setOpername(WebUtils.getCurrentUser(User.class, "login").getRealname());
        rentsVo.setBegindate(new Date());
        rentsVo.setRentflag(BUSConstast.RENT_FLAG_FALSE);
        rentsVo.setRentid(CarrentRandomUtils.createRandomStringId(BUSConstast.PROFIX_CZ));
        System.out.println(rentsVo.getIdentity());
        return rentsVo;
    }

    /******************************************/

    @RequestMapping("toRentsManager")
    public String toRentsManager() {
        return "business/rentManager";
    }

    @RequestMapping("loadAllRent")
    @ResponseBody
    public DataGridView loadAllRents(RentsVo rentsVo) {
        System.out.println(rentsVo);
        DataGridView gridView = this.rentsService.queryAllRents(rentsVo);
        return gridView;
    }

    @RequestMapping("updateRents")
    @ResponseBody
    public ResultObj uploadRents(RentsVo rentsVo) {
        ResultObj obj = null;
        try {
            this.rentsService.uploadRents(rentsVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    @RequestMapping("deleteRents")
    @ResponseBody
    public ResultObj deleteRents(RentsVo rentsVo) {
        ResultObj obj = null;
        try {
            this.rentsService.deleteRents(rentsVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DELETE_ERROR);
        }
        return obj;
    }

    /***********车辆入库业务**************/

    @RequestMapping("queryRentByRentid")
    @ResponseBody
    public Rents queryRentByRentid(RentsVo rentsVo) {
        System.out.println(rentsVo);
        Rents rent = this.rentsService.queryRentByRentid(rentsVo.getRentid());
        return rent;
    }

    /**
     * 导出excl 租车订单订单
     *
     * @param rentsVo
     * @param response
     */
    @RequestMapping("exportRentBySearch")
    @ResponseBody
    public void exportRentBySearch(RentsVo rentsVo, HttpServletResponse response) {
        Rents rent = this.rentsService.queryRentForExportExcl(rentsVo);
        Customer customer = this.customerService.queryCustomerByIndetity(rent.getIdentity());
        String fileName = customer.getCustname()+"客户的出租单表.xls";
        String sheetName = customer.getCustname()+"客户的出租单表";
        ExprotRentExcelUtils.ExportExcl(rent,customer, fileName, sheetName, response);
    }
}
