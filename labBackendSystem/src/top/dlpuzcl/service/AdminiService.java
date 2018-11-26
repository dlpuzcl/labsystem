package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;

public interface AdminiService {

    /**
     * 添加管理员
     * @param admini
     */
    LabResult addAdmini(Admini admini);
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
     * 根据ID查询管理员
     */
    Admini queryAdminiById(Integer id);

    /**
     * 更新管理员信息
     * @param admini
     */
    LabResult updateAdmini(Admini admini);
}
