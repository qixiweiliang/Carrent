package cn.sxt.bus.service.impl;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.mapper.CustomerMapper;
import cn.sxt.bus.service.CustomerService;
import cn.sxt.bus.vo.CustomerVo;
import cn.sxt.sys.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:19
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 模糊查询所有客户  使用PageHelper分页
     *
     * @param customerVo
     * @return 包装分页后的对象
     */
    @Override
    public DataGridView queryAllCustomer(CustomerVo customerVo) {
        Page page = PageHelper.startPage(customerVo.getPage(), customerVo.getRows());
        List<Customer> customers = this.customerMapper.queryAllCustomer(customerVo);
        return new DataGridView(page.getTotal(), customers);
    }

    /**
     * 添加客户
     *
     * @param customerVo 客户信息
     */
    @Override
    public void insertCustomer(CustomerVo customerVo) {
        this.customerMapper.insertSelective(customerVo);
    }

    /**
     * @param identity 根据identity删除
     */
    @Override
    public void deleteCustomer(String identity) {
        this.customerMapper.deleteByPrimaryKey(identity);
    }

    /*修改客户信息 updateByPrimaryKeySelective*/
    @Override
    public void updateCustomer(CustomerVo customerVo) {
        this.customerMapper.updateByPrimaryKeySelective(customerVo);
    }

    /*根据主键查询客户*/
    @Override
    public Customer queryCustomerByIndetity(String identity) {
        return this.customerMapper.selectByPrimaryKey(identity);
    }

    /*导出 excl 根据模糊查询查出结果集*/
    @Override
    public List<Customer> queryCustomerBySearch(CustomerVo customerVo) {
        return this.customerMapper.queryAllCustomer(customerVo);
    }
}
