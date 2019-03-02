package cn.sxt.bus.service;

import cn.sxt.bus.vo.CheckVo;
import cn.sxt.sys.utils.DataGridView;

import java.util.Map;

/**
 * @program: Checkrent_SSM
 * @Date: 2019/1/16 16:18
 * @Author: Mr.Wen
 * @Description:
 */
public interface CheckService {

    DataGridView queryAllCheck(CheckVo checkVo);

    void insertCheck(CheckVo checkVo);

    void deleteCheck(String checkid);

    void uploadCheck(CheckVo checkVo);

    Map<String, Object> queryCarRentCustomerMsgByRentIdForMap(String rentid);
}
