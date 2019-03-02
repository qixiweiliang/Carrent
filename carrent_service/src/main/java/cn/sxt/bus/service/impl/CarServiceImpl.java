package cn.sxt.bus.service.impl;

import cn.sxt.bus.domain.Car;
import cn.sxt.bus.mapper.CarMapper;
import cn.sxt.bus.service.CarService;
import cn.sxt.bus.vo.CarVo;
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
 * @Description: 对车辆 的DRUD的方法的实现  查询使用模糊查询加分页 DataGridView  PageHelper
 */
@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;

    /**
     * 模糊查询所有客户
     * @param carVo
     * @return 包装分页后的对象
     */
    @Override
    public DataGridView queryAllCar(CarVo carVo) {
        Page page = PageHelper.startPage(carVo.getPage(), carVo.getRows());
        List<Car> cars = this.carMapper.queryAllCar(carVo);
        return new DataGridView(page.getTotal(), cars);
    }

    /**
     * 添加客户
     *
     * @param carVo
     */
    @Override
    public void insertCar(CarVo carVo) {
        this.carMapper.insertSelective(carVo);
    }

    /**
     * 根据identity删除
     *
     * @param carnumber
     */
    @Override
    public void deleteCar(String carnumber) {
        this.carMapper.deleteByPrimaryKey(carnumber);
    }

    @Override
    public void uploadCar(CarVo carVo) {
        this.carMapper.updateByPrimaryKeySelective(carVo);
    }
}
