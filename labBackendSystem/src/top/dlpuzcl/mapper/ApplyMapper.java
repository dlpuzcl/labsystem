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

    /**
     * 通过user查询申请
     * @param queryVo
     * @return
     */
    List<Apply> queryApplyByUser (QueryVo queryVo);

    /**
     * 查询总记录数
     * @param queryVo
     * @return
     */

    Integer getCountByQueryVo(QueryVo queryVo);

    /**
     * 删除申请通过id
     */

    void deleteById(Integer id);
}
