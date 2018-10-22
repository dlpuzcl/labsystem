package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Admini;

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
}
