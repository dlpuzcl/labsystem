package top.dlpuzcl.service.impl;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.ApplyMapper;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.ApplyService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    ApplyMapper applyMapper;

    @Override
    public List<Apply> getApplyList(Apply apply) {
        return applyMapper.getApplyList(apply);
    }


    /**
     * 添加单向申请
     * @param apply
     */
    @Override
    public void addApply(Apply apply) {

        //获取表格中的数据
        String[] day_section = apply.getDay_section();

        //将表格中的所有数据分开
        for (int i=0; i<day_section.length; i++){

            String daySection = day_section[i];
            //将那节课跟周几分开
            int applySection = daySection.charAt(0) - '0';
            int applyDay = daySection.charAt(1) - '0';

            apply.setApply_day(applyDay);
            apply.setApply_section(applySection);
            applyMapper.addApply(apply);

        }
    }

    @Override
    public LabResult addBatchApply(ApplyBatch applyBatch) {
        int apply_week_first = applyBatch.getApply_week_first();
        int apply_week_last = applyBatch.getApply_week_last();
        int apply_section_first = applyBatch.getApply_section_first();
        int apply_section_last = applyBatch.getApply_section_last();

        int week = apply_week_last - apply_week_first;
        int section = apply_section_last - apply_section_first;
        if(week < 0 ){
            return LabResult.build(400, "预约失败：周次必须先小后大，如：第一周——>第五周");
        }
        if(section < 0){
            return LabResult.build(400, "预约失败：节次必须先小后大,如：第一节——>第五节");
        }

        try {
            for (int i=apply_week_first; i <= apply_week_last; i++){
                for(int j=apply_section_first; j <= apply_section_last; j++ ){
                    applyBatch.setApply_week(i);
                    applyBatch.setApply_section(j);
                    applyMapper.addBatchApply(applyBatch);
                    System.out.println(applyBatch.toString());
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return LabResult.build(400, "预约失败：时间重复，请重新选择！");
        }


        return  LabResult.ok();

    }

    @Override
    public Page<Apply> queryApplyByUser(QueryVo queryVo) {
        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage()-1)*queryVo.getRows());

        //查询总记录数
        Integer total = applyMapper.getCountByQueryVo(queryVo);

        List<Apply> list = applyMapper.queryApplyByUser(queryVo);

        //包装分页数据
        Page<Apply> page = new Page<>(total,queryVo.getPage(),queryVo.getRows(),list);

        return page;
    }

    @Override
    public void deleteById(Integer id) {
        applyMapper.deleteById(id);
    }
}
