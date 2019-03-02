package cn.sxt.bus.service.impl;

import cn.sxt.bus.constast.BUSConstast;
import cn.sxt.bus.domain.Car;
import cn.sxt.bus.domain.Rents;
import cn.sxt.bus.mapper.CarMapper;
import cn.sxt.bus.mapper.RentsMapper;
import cn.sxt.bus.service.RentsService;
import cn.sxt.bus.vo.RentsVo;
import cn.sxt.sys.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Rentsrent_SSM
 * @Date: 2019/1/16 16:19
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class RentsServiceImpl implements RentsService {
    @Autowired
    private RentsMapper rentsMapper;
    @Autowired
    private CarMapper carMapper;

    /**
     * 模糊查询所有租车订单
     * @param rentsVo
     * @return 包装分页后的对象
     */
    @Override
    public DataGridView queryAllRents(RentsVo rentsVo) {
        Page page = PageHelper.startPage(rentsVo.getPage(), rentsVo.getRows());
        List<Rents> rentss = this.rentsMapper.queryAllRents(rentsVo);
        return new DataGridView(page.getTotal(), rentss);
    }

    /**
     * 添加租车订单
     *
     * @param rentsVo
     */
    @Override
    public void insertRents(RentsVo rentsVo) {
        this.rentsMapper.insertSelective(rentsVo);
        Car car =new Car();
        car.setIsrenting(BUSConstast.ISRENT_FLAG_TRUE);
        car.setCarnumber(rentsVo.getCarnumber());
        this.carMapper.updateByPrimaryKeySelective(car);
    }

    /**
     * 根据identity删除
     * @param rentsVo
     */
    @Override
    public void deleteRents(RentsVo rentsVo) {
        this.rentsMapper.deleteByPrimaryKey(rentsVo.getRentid());
        Car car =new Car();
        car.setCarnumber(rentsVo.getCarnumber());
        // 删除未归还车辆订单时车辆状态要发生变化
        car.setIsrenting(BUSConstast.ISRENT_FLAG_FALSE);
        this.carMapper.updateByPrimaryKeySelective(car);
    }

    @Override
    public void uploadRents(RentsVo rentsVo) {
        this.rentsMapper.updateByPrimaryKeySelective(rentsVo);
    }

    @Override
    public Rents queryRentByRentid(String rentid) {
        Rents rents = this.rentsMapper.selectByPrimaryKey(rentid);
        return rents;
    }

    /**
     * 根据租车订单查询信息 excl导出
     * @param rentsVo
     * @return
     */
    @Override
    public Rents queryRentForExportExcl(RentsVo rentsVo) {
        return this.rentsMapper.selectByPrimaryKey(rentsVo.getRentid());
    }
}
