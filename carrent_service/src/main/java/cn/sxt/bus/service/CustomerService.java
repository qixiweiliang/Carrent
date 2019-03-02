package cn.sxt.bus.service;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.vo.CustomerVo;
import cn.sxt.sys.utils.DataGridView;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:18
 * @Author: Mr.Wen
 * @Description:
 */
public interface CustomerService {
    /*返回模糊查询加分页后的处理结果*/
    DataGridView queryAllCustomer (CustomerVo customerVo);

    /*添加客户*/
    void insertCustomer(CustomerVo customerVo);
    /*根据主键删除客户*/
    void deleteCustomer(String identity);

    /*修改客户信息*/
    void updateCustomer(CustomerVo customerVo);

    /*根据主键查询客户*/
    Customer queryCustomerByIndetity(String identity);

    /*导出 excl 根据模糊查询查出结果集*/
    List<Customer> queryCustomerBySearch(CustomerVo customerVo);
}
