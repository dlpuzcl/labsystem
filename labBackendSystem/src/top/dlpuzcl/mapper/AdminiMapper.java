package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Admini;

import java.util.List;

public interface AdminiMapper {

    /**
     * 添加管理员
     * @param admini
     */
    void addAdmini(Admini admini);

    /**
     * 登录
     * @param admini
     * @return
     */
    Admini login(Admini admini);

    /**
     * 修改密码
     */
    void updatePassword(Admini admini);

    /**
     * 查询所有管理员
     * @return
     */
    List<Admini> queryAdmini();

    /**
     * 根据ID查询管理员
     */
    Admini queryAdminiById(Integer id);

    /**
     * 更新管理员信息
     * @param admini
     */
    void updateAdmini(Admini admini);

    /**
     * 根据ID查询管理员 用户名是否存在验证
     * @param admini_name
     */
    Integer queryAdminiByName(String admini_name);
}
