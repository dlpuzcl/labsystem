package top.dlpuzcl.service;

import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.LabRoom;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.utils.Page;

import java.util.List;

public interface LabService {
    /**
     * 添加实验室信息
     * @param lab_room
     */
     LabResult addLab(LabRoom lab_room);
    /**
     * 根据查询条件分页查询列表
     * @param queryVo
     * @return
     */
    Page<LabRoom> getLabByQueryVo(QueryVo queryVo);

    /**
     * 根据ID查询实验室
     * @param id
     * @return
     */
    LabRoom getLabRoomById(Integer id);

    /**
     * 更新实验室信息
     * @param labRoom
     */
    void updateLab(LabRoom labRoom);
}
