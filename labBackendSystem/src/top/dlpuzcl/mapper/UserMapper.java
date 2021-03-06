package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;

import java.util.List;

/**
 * 用户信息业务逻辑接口
 */
public interface UserMapper {
    /**
     * 根据查询条件分页查询列表
     * @param queryVo
     * @return
     */
   List<User> getUserByQueryVo(QueryVo queryVo);


    /**
     * 根据条件查询总记录数
     * @param queryVo
     * @return
     */
   Integer getCountByQueryVo(QueryVo queryVo);

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
   User getUserById(Integer id);

    /**
     * 更新用户信息
     * @param user
     */
   void updateUser(User user);

    /**
     * 通过ID删除用户
     * @param id
     */
   void deleteUserById(Integer id);
    /**
     * 彻底通过ID删除用户
     * @param id
     */
    void thoroughDeleteUserById(Integer id);
    /**
     * 通过ID找回用户
     * @param id
     */
    void backUserById(Integer id);
    /**
     * 添加用户信息
     * @param user
     */
    void addUser(User user);

    /**
     * 查询所有用户
     * @return
     */

    List<User> queryAllUser();

    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 修改密码
     */
    void updatePassword(User user);

//    /**
//     * 根据邮箱查询用户
//     */
//
//    User selectUserByemail(String email);

    /**
     * 更新激活状态
     * @param email
     */
    void updateState(String email);

    /**
     * 根据ID查询 用户名是否存在验证
     * @param user_number
     */
    Integer queryUserByNumber(String user_number);
    /**
     * 根据phone查询 用户名是否存在验证
     * @param user_phone
     */
    Integer queryUserByPhone(String user_phone);
    /**
     * 根据email查询 用户名是否存在验证
     * @param user_email
     */
    Integer queryUserByEmail(String user_email);
}
