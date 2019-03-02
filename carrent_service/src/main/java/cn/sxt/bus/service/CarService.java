package cn.sxt.bus.service;

import cn.sxt.bus.vo.CarVo;
import cn.sxt.sys.utils.DataGridView;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:18
 * @Author: Mr.Wen
 * @Description: 对车辆 的DRUD  查询使用模糊查询加分页 DataGridView  PageHelper
 */
public interface CarService {

    DataGridView queryAllCar(CarVo carVo);

    void insertCar(CarVo carVo);

    void deleteCar(String carnumber);

    void uploadCar(CarVo carVo);
}
