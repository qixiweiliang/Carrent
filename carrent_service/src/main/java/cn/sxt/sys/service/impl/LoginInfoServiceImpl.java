package cn.sxt.sys.service.impl;

import cn.sxt.sys.domain.LoginInfo;
import cn.sxt.sys.mapper.LoginInfoMapper;
import cn.sxt.sys.service.LoginInfoService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LoginInfoVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:19
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class LoginInfoServiceImpl implements LoginInfoService {
    @Autowired
    private LoginInfoMapper loginInfoMapper;

    @Override
    public DataGridView queryLoginInfos(LoginInfoVo loginInfoVo) {
        Page<Object> page = PageHelper.startPage(loginInfoVo.getPage(), loginInfoVo.getRows());
        List<LoginInfo> loginInfos = this.loginInfoMapper.queryAllLoginInfo(loginInfoVo);
        return new DataGridView(page.getTotal(),loginInfos);
    }

    @Override
    public void deleteLoginInfo(Integer id) {
        this.loginInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addLoginInfo(LoginInfo lo) {
        this.loginInfoMapper.insertSelective(lo);
    }
}
