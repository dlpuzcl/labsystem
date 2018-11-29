package top.dlpuzcl.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.*;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.ApplyService;
import top.dlpuzcl.utils.EmailUtil;
import top.dlpuzcl.utils.Page;

import java.util.ArrayList;
import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    ApplyMapper applyMapper;

    @Autowired
    LabMapper labMapper;

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    AdminiMapper adminiMapper;

    @Autowired
    UserMapper userMapper;

    @Override
    public List<Apply> getApplyList(Apply apply) {

        ItermYear itermYear = applyMapper.queryItermYear();

        //设置学期
        apply.setIterm(itermYear.getIterm());
        apply.setYears(itermYear.getYears());

        return applyMapper.getApplyList(apply);
    }

//

    /**
     * 添加单向申请
     *
     * @param apply
     */
    @Override
    public LabResult addApply(Apply apply) {
        if(apply.getDay_section() == null) {
            return LabResult.build(400, "请先选择预约时间！");
        }
        if(apply.getCourse_id() == null || apply.getCourse_id()=="") {
            return LabResult.build(400, "请选择预约课程！");
        }

        ItermYear itermYear = applyMapper.queryItermYear();
        //设置学期
        apply.setIterm(itermYear.getIterm());

        //设置学年
        apply.setYears(itermYear.getYears());

        //获取申请的用户id值
        int user_id = apply.getUser_id();

        //根据ID查询用户信息
        User user = userMapper.getUserById(user_id);

        //获取申请的实验室id值
        int room_id = apply.getRoom_id();

        //根据ID查询实验室信息
        LabRoom lab= labMapper.getLabRoomById(room_id);

        //获取申请的课程id值
        int course_id = Integer.parseInt(apply.getCourse_id());
        //根据id值查询课程信息
        Course course = courseMapper.courseById(course_id);
        //获取当前课程的学时
        int course_time = course.getCourse_time();

        //获取已预约的学时
        int course_timed = applyMapper.queryCourseByIdYI(apply);





        //获取表格中的数据
        String[] day_section = apply.getDay_section();
        int l =  day_section.length;

        int course_time_sum = course_timed + l;

        if (course_time_sum > course_time){
            return LabResult.build(400, "您预约的学时已经超过了当前课程的学时！");
        }

        String sumdaysection="";
        //将表格中的所有数据分开
        for (int i = 0; i <l; i++) {

            String daySection = day_section[i];
            //将那节课跟周几分开
            int applySection;
            int applyDay;
            if (daySection.length() == 2) {
                applySection = daySection.charAt(0) - '0';
                applyDay = daySection.charAt(1) - '0';
            } else {
//                applySection = Integer.parseInt(daySection.substring(0,1));
//                applyDay = Integer.parseInt(daySection.substring(2,2));
                applySection = (daySection.charAt(0) - '0') * 10 + (daySection.charAt(1) - '0');
                applyDay = daySection.charAt(2) - '0';

            }

            System.out.println("...............applySection:" + applySection);
            System.out.println("...............applyDay:" + applyDay);

            apply.setApply_day(applyDay);
            apply.setApply_section(applySection);

            try {
                applyMapper.addApply(apply);
            }catch (Exception e) {
                e.printStackTrace();
                return LabResult.build(400, "预约失败：时间重复，请重新选择！");
            }


            String daysection = "星期"+String.valueOf(applyDay)+"第"+String.valueOf(applySection)+"节</br>";
            sumdaysection = daysection+sumdaysection;
        }

        String week = String.valueOf(apply.getApply_week());

        //查询所有管理员
        List<Admini> adminis = adminiMapper.queryAdmini();
        try {
            for (int t = 0;t<adminis.size();t++){
                Admini admini = adminis.get(t);
                //给管理员发送邮件
                EmailUtil.applyInform(admini,user,lab,course,week,sumdaysection,course_time_sum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //给用户发送邮件
        try {

                EmailUtil.userInform(user,lab,course,week,sumdaysection,course_time_sum);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return  LabResult.ok();
    }

    /**
     * 添加批量申请
     *
     * @param applyBatch
     * @return
     */
    @Override
    public LabResult addBatchApply(ApplyBatch applyBatch) {

        ItermYear itermYear = applyMapper.queryItermYear();
        //设置学期
        applyBatch.setIterm(itermYear.getIterm());

        //设置学年
        applyBatch.setYears(itermYear.getYears());

        int apply_week_first = applyBatch.getApply_week_first();
        int apply_week_last = applyBatch.getApply_week_last();
        int apply_section_first = applyBatch.getApply_section_first();
        int apply_section_last = applyBatch.getApply_section_last();

        int week = apply_week_last - apply_week_first;
        int section = apply_section_last - apply_section_first;
        //获取申请的用户id值
        int user_id = applyBatch.getUser_id();

        //根据ID查询用户信息
        User user = userMapper.getUserById(user_id);

        //获取申请的实验室id值
        int room_id = applyBatch.getRoom_id();

        //根据ID查询实验室信息
        LabRoom lab= labMapper.getLabRoomById(room_id);
        //获取申请的实验室id值
        int course_id = applyBatch.getCourse_id();
        //根据id值查询课程信息
        Course course = courseMapper.courseById(course_id);
        //获取当前课程的学时
        int course_time = course.getCourse_time();

        //获取已预约的学时
        int course_timed = applyMapper.queryCourseByIdYIn(applyBatch);

        //批量预约的节数
        int sum = (week+1) * (section+1);

        int course_time_sum = course_timed + sum;
        if (course_time_sum > course_time){
            return LabResult.build(400, "您预约的学时已经超过了当前课程的学时！");
        }
        if (week < 0) {
            return LabResult.build(400, "预约失败：周次必须先小后大，如：第一周——>第五周");
        }

        if (section < 0) {
            return LabResult.build(400, "预约失败：节次必须先小后大,如：第一节——>第五节");
        }

        try {
            for (int i = apply_week_first; i <= apply_week_last; i++) {
                for (int j = apply_section_first; j <= apply_section_last; j++) {

                    //设置周
                    applyBatch.setApply_week(i);

                    //设置节
                    applyBatch.setApply_section(j);


                    applyMapper.addBatchApply(applyBatch);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return LabResult.build(400, "预约失败：时间重复，请重新选择！");
        }

        String weeks = String.valueOf(apply_week_first)  +"-"+ String.valueOf(apply_week_last);

        String sections = String.valueOf(apply_section_first) +"—"+ String.valueOf(apply_section_last);

        int day = applyBatch.getApply_day();

        //查询所有管理员
        List<Admini> adminis = adminiMapper.queryAdmini();
        try {
            for (int t = 0;t<adminis.size();t++){
                Admini admini = adminis.get(t);
                //给管理员发送邮件
                EmailUtil.applyInform(admini,user,lab,course,weeks,sections,day,course_time_sum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //给用户发送邮件
        try {

            EmailUtil.userInform(user,lab,course,weeks,sections,day,course_time_sum);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return LabResult.ok();

    }

    /**
     * 查询所有申请
     *
     * @param queryVo
     * @return
     */
    @Override
    public Page<Apply> queryApplyByUser(QueryVo queryVo) {
        ItermYear itermYear = applyMapper.queryItermYear();

        //查询前提前设置学年学期
        queryVo.setIterm(itermYear.getIterm());
        queryVo.setYears(itermYear.getYears());

        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());

        //查询总记录数
        Integer total = applyMapper.getCountByQueryVo(queryVo);

        List<Apply> list = applyMapper.queryApplyByUser(queryVo);

        //包装分页数据
        Page<Apply> page = new Page<>(total, queryVo.getPage(), queryVo.getRows(), list);

        return page;
    }

    /**
     * 删除申请
     *
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        applyMapper.deleteById(id);
    }

    /**
     * 删除申请
     *
     * @param ids
     */
    @Override
    public void deleteAllById(String[] ids) {

        for (int i = 0; i < ids.length; i++) {
            int id = Integer.parseInt(ids[i]);
            applyMapper.deleteById(id);
        }

    }


    /**
     * 设置学期
     *
     * @param itermYear
     * @return
     */
    @Override
    public LabResult setItermYear(ItermYear itermYear) {

        if (StringUtils.isEmpty(itermYear.getYears())) {
            return LabResult.build(400, "添加失败.请校验数据后请再提交数据！");
        }

        if (itermYear.getIterm() == 1 || itermYear.getIterm() == 2) {

            try {
                applyMapper.setItermYear(itermYear);
                return LabResult.ok();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return LabResult.build(400, "添加失败.SQl异常！");

        } else {
            return LabResult.build(400, "添加失败.学期只能为1或2！");
        }
    }

    /**
     * 查询实验室利用率
     *
     * @return
     */
    @Override
    public List<LabRatio> labRatioByItermYear() {

        ItermYear itermYear = applyMapper.queryItermYear();

        Apply apply = new Apply();

        //设置学期，学年
        apply.setYears(itermYear.getYears());
        apply.setIterm(itermYear.getIterm());

        //查询所有的实验室
        List<LabRoom> labRooms = labMapper.queryLabCode();

        ArrayList<LabRatio> labRatios = new ArrayList<>();

        int length = labRooms.size();

        //根据实验室数量循环查询每个实验室的利用率
        for (int i = 0; i < length; i++) {

            LabRatio labRatio = new LabRatio();

            //获得LabRoom
            LabRoom labRoom = labRooms.get(i);

            apply.setRoom_id(labRoom.getRoom_id());

            Integer labCount = applyMapper.queryApplyByItermYear(apply);

            //计算单个利用率
            float useRatio = (float) labCount / (20 * 40);

            //添加数据
            labRatio.setValue(useRatio);
            labRatio.setLabel(labRoom.getRoom_code());


            //将值加入list
            labRatios.add(labRatio);
        }


        return labRatios;
    }

    @Override
    public LabRatio labRatioSum() {

        ItermYear itermYear = applyMapper.queryItermYear();




        //查询所有的实验室
        List<LabRoom> labRooms = labMapper.queryLabCode();

        int length = labRooms.size();
        //查询本学期所有预约的数量
        int allApplys = applyMapper.queryApplyByYear(itermYear);

        LabRatio labRatio = new LabRatio();

        float sum = (float) allApplys / (20 * 40*length);
//        //根据实验室数量循环查询每个实验室的利用率
//        for (int i = 0; i < length; i++) {
//
//            //获得LabRoom
//            LabRoom labRoom = labRooms.get(i);
//
//            apply.setRoom_id(labRoom.getRoom_id());
//
//            Integer labCount = applyMapper.queryApplyByItermYear(apply);
//
//            //计算单个利用率
//            double useRatio = (float) labCount / (20 * 40);
//
//            //计算总利用率
//            sum = sum + useRatio;
//
//
//        }

        //添加数据
        labRatio.setValue(sum);
        labRatio.setLabel("总利用率");

        System.out.println(sum + "。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。");


        return labRatio;

    }

    @Override
    public List<Apply> querySelectApply(Apply apply) {
        ItermYear itermYear = applyMapper.queryItermYear();

        //设置学期
        apply.setIterm(itermYear.getIterm());
        apply.setYears(itermYear.getYears());
        return applyMapper.querySelectApply(apply);
    }

    /**
     * 统计实验室数据
     *
     * @param apply
     * @return
     */
    @Override
    public List<Apply> data(Apply apply) {

        ItermYear itermYear = applyMapper.queryItermYear();
        //设置学期
        apply.setIterm(itermYear.getIterm());
        apply.setYears(itermYear.getYears());
        List<Apply> dataList = applyMapper.data(apply);

        return dataList;
    }

    @Override
    public int queryApplyByYear() {
        ItermYear itermYear = applyMapper.queryItermYear();
        return applyMapper.queryApplyByYear(itermYear);
    }


    /**
     * 查询当前学期
     *
     * @return
     */
    @Override
    public ItermYear queryItermYear() {
        return applyMapper.queryItermYear();
    }
}
