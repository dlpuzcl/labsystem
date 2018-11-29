package top.dlpuzcl.controller;

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


//    private String excelApplyName = "实验室课表.xls";
//
//    private String sheetApplyName = "实验室课表";

    @RequestMapping("one")
    public String one(Model model) {

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);

        List<User> userList = userService.queryAllUser();

        model.addAttribute("userList", userList);

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

    @RequestMapping("batch")
    public String batch(Model model) {
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);

        List<User> userList = userService.queryAllUser();

        model.addAttribute("userList", userList);
        return "batchApply";
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


    @RequestMapping("queryByWeekView")
    public String queryByWeekView(Model model) {
        //查询实验室信息
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);
        return "queryAllApply";
    }

    /**
     * 根据周查询申请列表
     *
     * @param apply
     * @return
     */
    @RequestMapping("queryByWeek")
    @ResponseBody
    public List<Apply> queryByWeek(Apply apply) {

        List<Apply> listByWeek = applyService.querySelectApply(apply);

        return listByWeek;
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

    @RequestMapping("queryApplyByLab")
    public String queryApplyByLab(Model model) {

        //查询实验室信息
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);

        return "queryApplyByLab";

    }

    @RequestMapping("queryApplyByUser")
    public String queryApplyByUser(QueryVo queryVo, Model model) {

        List<User> userList = userService.queryAllUser();
        model.addAttribute("userList", userList);

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);

        List<Course> courses = courseService.queryAllCourse();
        model.addAttribute("courses",courses);


        //根据查询条件分页查询用户列表
        Page<Apply> page = applyService.queryApplyByUser(queryVo);

        //设置分页返回
        model.addAttribute("page", page);

        //返回查询条件
        model.addAttribute("vo", queryVo);
        return "queryApplyByUser";
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
     *
     * @param ids
     * @return
     */
    @RequestMapping("deleteAll")
    @ResponseBody
    public String deleteAll(String[] ids) {
        String msg = "1";
        try {
            applyService.deleteAllById(ids);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return msg;
    }

    @RequestMapping("setItermView")
    public String setItermView(Model model) {

        ItermYear itermYear = applyService.queryItermYear();
        model.addAttribute("itermYear", itermYear);

        return "setIterm";
    }

    /**
     * 设置学期和学年
     *
     * @param itermYear
     * @return
     */

    @RequestMapping("setIterm")
    @ResponseBody
    public LabResult setIterm(ItermYear itermYear) {
        LabResult labResult = applyService.setItermYear(itermYear);
        return labResult;
    }

    @RequestMapping("labRatioView")
    public String labRatioView() {
        return "labRatio";
    }

    /**
     * 查询实验室本学期利用率
     *
     * @return
     */
    @RequestMapping("labRatio")
    @ResponseBody
    public List<LabRatio> labRatio() {

        List<LabRatio> labRatios = applyService.labRatioByItermYear();

        return labRatios;
    }


    /**
     * 查询实验室本学期总利用率
     *
     * @return
     */
    @RequestMapping("labRatioSum")
    @ResponseBody
    public LabRatio labRatioSum() {

        LabRatio labRatio = applyService.labRatioSum();

        return labRatio;
    }

    //    @RequestMapping("applyExcel")
//    @ResponseBody
//    public String downlodApply (HttpServletResponse response,Apply apply){
//
//        apply.setRoom_id(3);
//        apply.setApply_week(1);
//        try {
//            List<Apply> applyList = applyService.getApplyList(apply);
//            String[] header = new String[]{"周/节","星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
//
//            List<Map<Integer, Object>> dataList = ExcelBeanUtil.manageApplyList(applyList);
//
//            Workbook wb = new HSSFWorkbook();
//            ExcelUtil.fillExcelSheetData(dataList,wb,header,sheetApplyName);
//            WebUtil.downloadExcel(response,wb,excelApplyName);
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return null;
//    }
//
    @RequestMapping("dataStatistical")
    public String dataStatistical(Apply apply,Model model){

        List<LabRoom> labRoom = labService.queryLabCode();

        int allLab = labRoom.size();
        model.addAttribute("allLab",allLab);
        model.addAttribute("labRoom", labRoom);
        List<Apply> dataList = applyService.data(apply);

        model.addAttribute("dataList",dataList);
        model.addAttribute("apply",apply);
        return "dataStatistical";
    }


}

