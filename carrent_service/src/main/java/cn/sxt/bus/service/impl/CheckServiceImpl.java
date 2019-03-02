package cn.sxt.bus.service.impl;

import cn.sxt.bus.constast.BUSConstast;
import cn.sxt.bus.domain.Car;
import cn.sxt.bus.domain.Check;
import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.domain.Rents;
import cn.sxt.bus.mapper.CarMapper;
import cn.sxt.bus.mapper.CheckMapper;
import cn.sxt.bus.mapper.CustomerMapper;
import cn.sxt.bus.mapper.RentsMapper;
import cn.sxt.bus.service.CheckService;
import cn.sxt.bus.vo.CheckVo;
import cn.sxt.sys.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: Checkrent_SSM
 * @Date: 2019/1/16 16:19
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    private CheckMapper checkMapper;
    @Autowired
    private RentsMapper rentsMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private CarMapper carMapper;

    /**
     * 模糊查询所有检查单
     *
     * @param checkVo
     * @return 包装分页后的对象
     */
    @Override
    public DataGridView queryAllCheck(CheckVo checkVo) {
        Page page = PageHelper.startPage(checkVo.getPage(), checkVo.getRows());
        List<Check> checks = this.checkMapper.queryAllCheck(checkVo);
        return new DataGridView(page.getTotal(), checks);
    }

    /**
     * 添加检查单 需要对车辆状态 订单状态修改
     *
     * @param checkVo
     */
    @Override
    public void insertCheck(CheckVo checkVo) {
        this.checkMapper.insertSelective(checkVo);
        /*修改租车订单状态*/
        Rents rents = this.rentsMapper.selectByPrimaryKey(checkVo.getRentid());
        rents.setRentflag(BUSConstast.ISRENT_FLAG_TRUE);
        rents.setRentid(checkVo.getRentid());
        this.rentsMapper.updateByPrimaryKeySelective(rents);
        /*修改车辆状态*/
        Car car = new Car();
        car.setCarnumber(rents.getCarnumber());
        car.setIsrenting(BUSConstast.ISRENT_FLAG_FALSE);
        this.carMapper.updateByPrimaryKeySelective(car);
    }

    /**
     * 根据identity删除
     *
     * @param checkid
     */
    @Override
    public void deleteCheck(String checkid) {
        this.checkMapper.deleteByPrimaryKey(checkid);
    }

    @Override
    public void uploadCheck(CheckVo checkVo) {
        this.checkMapper.updateByPrimaryKeySelective(checkVo);
    }

    /**
     * 生成检查单时需要查询出出租单信息 车辆信息 客户信息
     *
     * @param rentid
     * @return
     */
    @Override
    public Map<String, Object> queryCarRentCustomerMsgByRentIdForMap(String rentid) {
        Rents rents = this.rentsMapper.selectByPrimaryKey(rentid);
        Customer customer = this.customerMapper.selectByPrimaryKey(rents.getIdentity());
        Car car = this.carMapper.selectByPrimaryKey(rents.getCarnumber());
        Map<String, Object> map = new HashMap<>();
        map.put("rent", rents);
        map.put("car", car);
        map.put("customer", customer);
        return map;
    }

}
