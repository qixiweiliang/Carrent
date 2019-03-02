package cn.sxt.bus.controller;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.service.CustomerService;
import cn.sxt.bus.utils.ExprotCustomerExcelUtils;
import cn.sxt.bus.vo.CustomerVo;
import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:20
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    /**
     * 跳转到客户管理界面
     * @return "business/customerManager.jsp"
     */
    @RequestMapping("toCustomerManager")
    public String toCustomer() {
        return "business/customerManager";
    }

    /**
     * 加载客户信息 加模糊查询加分页
     * @param customerVo 接收页面传参 page(pageNumber) rows(PageSize)
     * @return DataGradeView 封装模糊查询结果集 PageHelper分页
     *
     */
    @RequestMapping("loadAllCustomer")
    @ResponseBody
    public DataGridView loadAllCustomer(CustomerVo customerVo) {
        return this.customerService.queryAllCustomer(customerVo);
    }

    /**
     * 添加客户
     * @param customerVo 接收页面传参
     * @return ResultObj
     */
    @RequestMapping("addCustomer")
    @ResponseBody
    public ResultObj addCustomer(CustomerVo customerVo) {
        ResultObj obj;
        try {
            this.customerService.insertCustomer(customerVo);
            obj= new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj= new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    /**
     *  添加客户 返回resultObj 处理结果
     * @param customerVo 封装客户
     * @return ResultObj
     */
    @RequestMapping("updateCustomer")
    @ResponseBody
    public ResultObj updateCustomer(CustomerVo customerVo) {
        ResultObj obj = null;
        try {
            this.customerService.updateCustomer(customerVo);
            obj= new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj= new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    /**
     *  根据 客户 identity 身份 删除 客户
     * @param customerVo customerVo.getIdentity()
     * @return ResultObj
     */
    @RequestMapping("deleteCustomer")
    @ResponseBody
    public ResultObj deleteCustomer(CustomerVo customerVo) {
        ResultObj obj;
        try {
            this.customerService.deleteCustomer(customerVo.getIdentity());
            obj= new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj= new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_DELETE_ERROR);
        }
        return obj;
    }

    /**
     *  车辆出租 根据 客户身份证号 来判断 是否有这个客户
     *
     * @param customerVo ByIndetity
     * @return 返回处理结果  customer!=null  result.flag
     */
    @RequestMapping("queryCustomerByIndetity")
    @ResponseBody
    public Map<String,Boolean> queryCustomerByIndetity(CustomerVo customerVo) {
      Customer customer = this.customerService.queryCustomerByIndetity(customerVo.getIdentity());
        Map<String,Boolean> map =new HashMap<>();
        map.put("flag",customer!=null);
        return map;
    }

    /**
     *  导出 根据查询条件查询到的客户信息 到excl
     * @param customerVo customerVo.getIdentity()
     * @param response response获取输出流 响应给浏览器
     */
    @RequestMapping("exportCustomerBySearch")
    @ResponseBody
    public void exportCustomerBySearch(CustomerVo customerVo, HttpServletResponse response) {
        List<Customer> customerList = this.customerService.queryCustomerBySearch(customerVo);
        String fileName="客户数据.xls";
        String sheetName="客户数据";
        /*导出 Excl 工具类  参数客户结果集  文件名  sheet名  response获取输出流 响应给浏览器*/
        ExprotCustomerExcelUtils.ExportExcl(customerList,fileName,sheetName,response);
    }


}
