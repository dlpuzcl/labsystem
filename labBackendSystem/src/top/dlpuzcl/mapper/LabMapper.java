package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.LabRoom;
import top.dlpuzcl.pojo.QueryVo;

import java.util.List;

public interface LabMapper {
    /**
     * 添加实验室信息
     * @param lab_room
     */
    void addLab(LabRoom lab_room);

    /**
     * 根据查询条件分页查询列表
     * @param queryVo
     * @return
     */
    List<LabRoom> getLabByQueryVo(QueryVo queryVo);

    /**
     * 根据条件查询总记录数
     * @param queryVo
     * @return
     */
    Integer getCountByQueryVo(QueryVo queryVo);


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

    /**
     * 通过ID删除实验室
     * @param id
     */
    void deleteLabById(Integer id,Integer room_mark);

    /**
     * 通过ID彻底删除实验室
     * @param id
     */
    void thoroughDeleteLabById(Integer id);


    /**
     * 查询所有实验室
     *
     */

    List<LabRoom> queryLabCode();


}
