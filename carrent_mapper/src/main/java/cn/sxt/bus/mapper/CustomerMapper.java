package cn.sxt.bus.mapper;

import cn.sxt.bus.domain.Customer;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String identity);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    /*模糊查询   及   导出 excl 根据模糊查询查出结果集*/
    List<Customer> queryAllCustomer (Customer customer);
}