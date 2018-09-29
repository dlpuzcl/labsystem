package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.*;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Controller
@RequestMapping("apply")
public class ApplyController {

    @Autowired
    private LabService labService;

//    @Autowired
//    private BaseDictService baseDictService;
//
//    private String college = "002";

    @Autowired
    private UserService userService;

    @Autowired
    ApplyService applyService;

    @Autowired
    CourseService courseService;


    @RequestMapping("one")
    public String one(Model model,QueryVo queryVo){

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom",labRoom);

        List<User> userList = userService.queryAllUser();

        model.addAttribute("userList",userList);

//        //查询学院
//        List<BaseDict> fromCollege = baseDictService.getBaseDictByCode(college);
//
//        //设置数据模型返回
//        model.addAttribute("fromCollege",fromCollege);
//
//        //根据查询条件分页查询实验室列表
//        Page<LabRoom> page = labService.getLabByQueryVo(queryVo);
//
//        //设置分页返回
//        model.addAttribute("page",page);
//
//        //返回查询条件
//        model.addAttribute("vo",queryVo);

        return "applyLab";
    }

    /**
     * 查询申请列表
     * @param apply
     * @return
     */
    @RequestMapping("query")
    @ResponseBody
    public List<Apply> query(Apply apply){

        List<Apply> applyList = applyService.getApplyList(apply);

        return applyList;
    }

    /**
     * 跟据user_id查询课程
     * @param id
     * @return
     */
    @RequestMapping("courseByUser")
    @ResponseBody
    public List<Course> courseByUser(Integer id){

        List<Course> courseList = courseService.courseByUser(id);

        return courseList;
    }

    /**
     * 提交申请
     * @param apply
     * @return
     */
    @RequestMapping("submit")
    @ResponseBody
    public String submit(Apply apply){

        String msg = "1";
        try{
            applyService.addApply(apply);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

}
