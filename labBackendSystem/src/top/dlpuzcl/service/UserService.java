package top.dlpuzcl.service;

import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.LabRoom;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.utils.Page;

/**
 * 用户信息业务逻辑接口
 */
public interface UserService {
    /**
     * 根据查询条件分页查询列表
     * @param queryVo
     * @return
     */
    Page<User> getUserByQueryVo(QueryVo queryVo);

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
    User getUserById(Integer id);

    /**
     * 跟新用户信息
     * @param user
     */
    void updateUser(User user);

    /**
     * 通过ID删除用户
     * @param id
     */
    void deleteUserById(Integer id);

    /**
     * 添加用户信息
     * @param user
     */
    LabResult addUser(User user);

}
