package cn.sxt.sys.service;

import cn.sxt.sys.domain.Role;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.RoleVo;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:19
 * @Author: Mr.Wen
 * @Description:
 */
public interface RoleService {

    DataGridView queryRole(RoleVo roleVo);

    void deleteRole(Integer id);

    void addRole(Role role);

    void updateRole(RoleVo roleVo);

    void savaChooseRoleMenu(RoleVo roleVo);
}
