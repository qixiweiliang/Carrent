package cn.sxt.bus.service;

import cn.sxt.bus.domain.Rents;
import cn.sxt.bus.vo.RentsVo;
import cn.sxt.sys.utils.DataGridView;

/**
 * @program: Rentsrent_SSM
 * @Date: 2019/1/16 16:18
 * @Author: Mr.Wen
 * @Description:
 */
public interface RentsService {

    DataGridView queryAllRents(RentsVo rentsVo);

    void insertRents(RentsVo rentsVo);

    void deleteRents(RentsVo rentsVo);

    void uploadRents(RentsVo rentsVo);

    Rents queryRentByRentid(String rentid);

    Rents queryRentForExportExcl(RentsVo rentsVo);
}
