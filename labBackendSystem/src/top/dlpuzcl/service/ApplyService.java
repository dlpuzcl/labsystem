package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Apply;
import top.dlpuzcl.pojo.ApplyBatch;
import top.dlpuzcl.pojo.ApplyData;
import top.dlpuzcl.pojo.LabResult;

import java.util.List;

public interface ApplyService {
    /**
     * 查询申请表
     * @return
     */
    List<Apply> getApplyList(Apply apply);

    /**
     * 添加单向申请
     * @param apply
     */
    void addApply(Apply apply);

    /**
     * 添加批量申请
     * @param applyBatch
     * @return
     */
    LabResult addBatchApply (ApplyBatch applyBatch);


}
