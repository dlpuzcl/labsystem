package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Apply;
import top.dlpuzcl.pojo.ApplyData;
import top.dlpuzcl.pojo.QueryApply;

import java.util.List;

public interface ApplyMapper {

    /**
     * 查询申请表
     * @return
     */
    List<Apply> getApplyList(Apply apply);

    /**
     * 添加申请
     * @param apply
     */
    void addApply(Apply apply);
}
