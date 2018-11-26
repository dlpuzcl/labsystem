package top.dlpuzcl.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.ApplyService;
import top.dlpuzcl.service.CourseService;
import top.dlpuzcl.service.LabService;
import top.dlpuzcl.service.UserService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Controller
@RequestMapping("front")
public class FrontApplyController {
    @Autowired
    UserService userService;
    @Autowired
    private LabService labService;
    @Autowired
    CourseService courseService;
    @Autowired
    ApplyService applyService;

    @RequestMapping("apply")
    public String apply(Model model) {

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);


        return "frontApplyLab";
    }

    /**
     * 跟据user_id查询课程
     *
     * @param id
     * @return
     */
    @RequestMapping("courseByUser")
    @ResponseBody
    public List<Course> courseByUser(Integer id) {

        List<Course> courseList = courseService.courseByUser(id);

        return courseList;
    }

    /**
     * 单向预约提交申请
     *
     * @param apply
     * @return
     */
    @RequestMapping("submit")
    @ResponseBody
    public LabResult submit(Apply apply) {
        LabResult labResult = applyService.addApply(apply);


        return labResult;
    }

    /**
     * 查询申请列表
     *
     * @param apply
     * @return
     */
    @RequestMapping("query")
    @ResponseBody
    public List<Apply> query(Apply apply) {

        List<Apply> applyList = applyService.getApplyList(apply);

        return applyList;
    }


    /**
     * 批量预约提交申请
     *
     * @param applyBatch
     * @return
     */
    @RequestMapping("batchSubmit")
    @ResponseBody
    public LabResult batchSubmit(ApplyBatch applyBatch) {


        LabResult labResult = applyService.addBatchApply(applyBatch);

        return labResult;
    }


    @RequestMapping("queryApplyByUser")
    public String queryApplyByUser(QueryVo queryVo, Model model) {

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);


        //根据查询条件分页查询用户列表
        Page<Apply> page = applyService.queryApplyByUser(queryVo);

        //设置分页返回
        model.addAttribute("page", page);

        //返回查询条件
        model.addAttribute("vo", queryVo);
        return "frontUserApply";
    }


    /**
     * 修改用户密码
     */
    @RequestMapping("updatePassword")
    @ResponseBody
    public String updatePassword(User user) {

        String msg = "1";
        try {
            userService.updatePassword(user);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }


    /**
     * 删除申请
     *
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id) {
        String msg = "1";
        try {
            applyService.deleteById(id);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return msg;
    }



    /**
     * 批量删除申请
     * @param ids
     * @return
     */
    @RequestMapping("deleteAll")
    @ResponseBody
    public String deleteAll(String[] ids){
        String msg = "1";
        try {
            applyService.deleteAllById(ids);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }

        return msg;
    }

    /**
     * 显示课程表界面
     *
     * @return
     */
    @RequestMapping("courseTable")
    public String courseTable(Model model) {

        //查询实验室信息
        List<LabRoom> labRooms = labService.queryLabCode();
        model.addAttribute("labRooms", labRooms);
        return "frontCourseTable";
    }

    @RequestMapping("updatePasswordView")
    public String updatePasswordView(){
        return "frontUpdatePassword";
    }

}
