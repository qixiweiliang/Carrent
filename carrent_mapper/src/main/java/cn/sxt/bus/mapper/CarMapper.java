package cn.sxt.bus.mapper;

import cn.sxt.bus.domain.Car;
import cn.sxt.bus.vo.CarVo;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carnumber);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);


    List<Car> queryAllCar(CarVo carVo);
}