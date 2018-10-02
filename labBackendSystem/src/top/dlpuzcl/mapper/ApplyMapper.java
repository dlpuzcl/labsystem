package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.*;

import java.util.List;

public interface ApplyMapper {

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
    void addBatchApply (ApplyBatch applyBatch);


}
