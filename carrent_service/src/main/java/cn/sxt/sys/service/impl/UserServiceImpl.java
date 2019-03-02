package cn.sxt.sys.service.impl;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.Role;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.mapper.RoleMapper;
import cn.sxt.sys.mapper.UserMapper;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.RoleVo;
import cn.sxt.sys.vo.UserVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/15 19:43
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public User login(UserVo userVo) {
        return userMapper.login(userVo);
    }

    @Override
    public void changePwd(UserVo userVo) {
        this.userMapper.updateByPrimaryKeySelective(userVo);
    }

    /**
     * 模糊查询所有客户
     *
     * @param userVo
     * @return 包装分页后的对象
     */
    @Override
    public DataGridView queryAllUser(UserVo userVo) {
        Page page = PageHelper.startPage(userVo.getPage(), userVo.getRows());
        List<User> users = this.userMapper.queryAllUser(userVo);
        return new DataGridView(page.getTotal(), users);
    }

    /**
     * 添加客户
     *
     * @param userVo
     */
    @Override
    public void insertUser(UserVo userVo) {
        this.userMapper.insertSelective(userVo);
    }

    /**
     * 根据identity删除
     *
     * @param userId
     */
    @Override
    public void deleteUser(Integer userId) {
        this.userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public void updateUser(UserVo userVo) {
        this.userMapper.updateByPrimaryKeySelective(userVo);
    }

    /**
     * @param userid
     * @Description: 需要查询出客户所拥有的角色  及所有可用角色 将用户拥有的角色添加checked属性
     * @Return: cn.sxt.sys.utils.DataGridView
     * @Author: Mr.Wen
     * @Date: 2019/1/21 21:58
     */
    @Override
    public DataGridView queryAllByRoleUserid(Integer userid) {
        Role role = new Role();
        role.setAvailable(SYSConstast.AVAILABLE_TRUE);
        List<Role> roles = this.roleMapper.queryAllRole(role);
        List<Role> userRole = this.roleMapper.queryAllByRoleUserid(userid);
        List<RoleVo> list = new ArrayList<>();
        for (Role ro1 : roles) {
            Boolean checked = false;
            for (Role ro2 : userRole) {
                if (ro1.getRoleid() == ro2.getRoleid()) {
                    checked = true;
                    break;
                }
            }
            RoleVo roleVo = new RoleVo();
            BeanUtils.copyProperties(ro1, roleVo);
            roleVo.setChecked(checked);
            list.add(roleVo);

        }
        return new DataGridView((long) list.size(), list);
    }

    /**
     * @param userVo userid 用户id |ids[] 所有角色rid
     * @Description: 删除用户当前拥有角色 在进行添加操作
     * @Return: void
     * @Author: Mr.Wen
     * @Date: 2019/1/22 10:34
     */
    @Override
    public void saveUserRole(UserVo userVo) {
        Integer userid = userVo.getUserid();
        Integer[] ids = userVo.getIds();
        if (null != userid && ids.length > 0) {
            this.roleMapper.deleteByprimaryKeyByUserid(userid);
            for (Integer rid : ids) {
                this.roleMapper.insertUserRole(userid,rid);
            }

        }

    }
}
