package cn.sxt.sys.service;

import cn.sxt.sys.domain.LoginInfo;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LoginInfoVo;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:19
 * @Author: Mr.Wen
 * @Description:
 */
public interface LoginInfoService {

    DataGridView queryLoginInfos(LoginInfoVo loginInfoVo);


    void deleteLoginInfo(Integer id);

    void addLoginInfo(LoginInfo lo);
}
