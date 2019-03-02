package cn.sxt.sys.service;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.UserVo;

public interface UserService {

	//登陆
	User login(UserVo userVo);

	void changePwd(UserVo userVo);

	DataGridView queryAllUser (UserVo userVo);

	void insertUser(UserVo userVo);

	void deleteUser(Integer userId);

	void updateUser(UserVo userVo);

	DataGridView queryAllByRoleUserid(Integer userid);

    void saveUserRole(UserVo userVo);
}
