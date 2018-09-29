package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.ApplyMapper;
import top.dlpuzcl.pojo.Apply;
import top.dlpuzcl.pojo.ApplyData;
import top.dlpuzcl.pojo.QueryApply;
import top.dlpuzcl.service.ApplyService;

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
     * 添加申请
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
}
