package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Apply;

import java.util.List;

public interface ApplyMapper {

    /**
     * 查询申请表
     * @return
     */
    List<Apply> getApplyList();
}
