package cn.sxt.sys.constast;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/15 20:05
 * @Author: Mr.Wen
 * @Description:
 */
public interface SYSConstast {
    // 错误登陆提示
    String LOGIN_ERROR = "用户名或密码错误";

    // 用户登录类型
    Integer USER_TYPE_SUPER = 1;
    Integer USER_TYPE_NORMAL = 2;

    //是否有有效
    Integer AVAILABLE_TRUE = 1;
    Integer AVAILABLE_FALSE = 0;

    //是否打开
    Integer OPEN_TRUE = 1;
    Integer OPEN_FALSE = 0;

    // 是否是父节点
    Integer PARENT_TRUE = 1;
    Integer PARENT_FALSE = 0;

    /**
     * 操作相关的配置
     */
    Integer CODE_SUCCESS=1;
    Integer CODE_ERROR=-1;

    String OPERATION_DELETE_SUCCESS="删除成功";
    String OPERATION_DELETE_ERROR="删除失败";

    String OPERATION_ADD_SUCCESS="添加成功";
    String OPERATION_ADD_ERROR="添加失败";

    String OPERATION_UPDATE_SUCCESS="更新成功";
    String OPERATION_UPDATE_ERROR="更新失败";

    /*
    *    1代表有子节点
    *    0代表没有子节点
    */
    String QUERYCOUNT_HASSON_TRUE="1";
    String QUERYCOUNT_HASSON_FALSE="0";

    String OPERATION_DELETE_MSG="该菜单下有子菜单,请先删除子菜单！";

    /*
    * 菜单分配
    * */
    String OPERATION_DESPATCHAR_SUCCESS="分配成功";
    String OPERATION_DESPPATCHAR_ERROR="分配失败";

    /*初始登录密码*/
    String DEFAULT_PASSWORD="12345";
    /*重置密码成功 失败*/
    String OPERATION_UPDATE_SUCCESS_PWD="重置密码成功";
    String OPERATION_UPDATE_ERROR_PWD="重置密码失败";
}
