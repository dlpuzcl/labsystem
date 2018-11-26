package top.dlpuzcl.service;

import top.dlpuzcl.pojo.*;
import top.dlpuzcl.utils.Page;

import java.util.List;

public interface ApplyService {
    /**
     * 查询申请表
     * @return
     */
    List<Apply> getApplyList(Apply apply);

//    /**
//     * 查询申请表2
//     * @return
//     */
//    void getApply(Apply apply);

    /**
     * 添加单向申请
     * @param apply
     */
    LabResult addApply(Apply apply);

    /**
     * 添加批量申请
     * @param applyBatch
     * @return
     */
    LabResult addBatchApply (ApplyBatch applyBatch);

    /**
     * 通过user查询申请
     * @param queryVo
     * @return
     */
    Page<Apply> queryApplyByUser (QueryVo queryVo);

    /**
     * 删除申请通过id
     */

    void deleteById(Integer id);


    /**
     * 删除申请通过idall
     */

    void deleteAllById(String[] ids);

    /**
     *查询当前学年学期
     * @return
     */

    ItermYear queryItermYear ();

    /**
     * 学期设置
     */
    LabResult setItermYear(ItermYear itermYear);

    /**
     * 通过学期·学年和实验室查询利用率
     */

    List<LabRatio> labRatioByItermYear ();

    /**
     * 通过学期·学年和实验室查询总利用率
     */
    LabRatio labRatioSum();

    List<Apply> querySelectApply(Apply apply);


    /**
     * 统计实验室数据
     * @param apply
     * @return
     */
    List<Apply> data(Apply apply);


    int queryApplyByYear();

}
