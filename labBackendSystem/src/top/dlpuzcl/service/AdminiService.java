package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;

public interface AdminiService {

    /**
     * 添加管理员
     * @param admini
     */
    LabResult addAdmini(Admini admini);
}
