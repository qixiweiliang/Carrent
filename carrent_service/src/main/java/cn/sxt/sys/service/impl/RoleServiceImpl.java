package cn.sxt.sys.service.impl;

import cn.sxt.sys.domain.Role;
import cn.sxt.sys.mapper.RoleMapper;
import cn.sxt.sys.service.RoleService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.RoleVo;
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
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataGridView queryRole(RoleVo roleVo) {
        Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getRows());
        List<Role> roles = this.roleMapper.queryAllRole(roleVo);
        return new DataGridView(page.getTotal(), roles);
    }

    @Override
    public void deleteRole(Integer id) {
        this.roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addRole(Role role) {
        this.roleMapper.insertSelective(role);
    }

    @Override
    public void updateRole(RoleVo roleVo) {
        this.roleMapper.updateByPrimaryKeySelective(roleVo);
    }

    @Override
    public void savaChooseRoleMenu(RoleVo roleVo) {
        /*插入分配角色前需要先清空 角色rid 及对应 的 分配的菜单 mid*/
        Integer rid = roleVo.getRoleid();
        this.roleMapper.deleteByPrimaryByRoleid(rid);
        Integer[] ids = roleVo.getIds();
        for (Integer mid : ids) {
            this.roleMapper.savaChooseRoleMenu(rid,mid);
        }

    }

}
