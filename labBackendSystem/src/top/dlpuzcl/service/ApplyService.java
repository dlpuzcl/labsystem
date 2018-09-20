package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Apply;

import java.util.List;

public interface ApplyService {
    /**
     * 查询申请表
     * @return
     */
    List<Apply> getApplyList();
}
