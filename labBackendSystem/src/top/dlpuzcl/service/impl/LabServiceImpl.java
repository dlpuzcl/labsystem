package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.LabMapper;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.LabRoom;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.service.LabService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Service
public class LabServiceImpl implements LabService {

    @Autowired
    private LabMapper labMapper;


    @Override
    public LabResult addLab(LabRoom lab_room) {
        labMapper.addLab(lab_room);
        return  LabResult.ok();
    }

    @Override
    public Page<LabRoom> getLabByQueryVo(QueryVo queryVo) {

        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage()-1)*queryVo.getRows());

        //查询总记录数
        Integer total = labMapper.getCountByQueryVo(queryVo);

        //查询每页数据列表
        List<LabRoom> list = labMapper.getLabByQueryVo(queryVo);

        //包装分页数据
        Page<LabRoom> page = new Page<>(total,queryVo.getPage(),queryVo.getRows(),list);

        return page;
    }

    @Override
    public LabRoom getLabRoomById(Integer id) {
        return labMapper.getLabRoomById(id);
    }

    @Override
    public void updateLab(LabRoom labRoom) {
       labMapper.updateLab(labRoom);
    }

    @Override
    public void deleteLabById(Integer id,Integer room_mark) {
        labMapper.deleteLabById(id,room_mark);
    }

    @Override
    public List<LabRoom> queryLabCode() {
        return labMapper.queryLabCode();
    }


}

