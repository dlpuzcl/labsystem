package top.dlpuzcl.controller;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.*;
import top.dlpuzcl.utils.ExcelBeanUtil;
import top.dlpuzcl.utils.ExcelUtil;
import top.dlpuzcl.utils.Page;
import top.dlpuzcl.utils.WebUtil;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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


    private String excelApplyName = "实验室课表.xls";

    private String sheetApplyName = "实验室课表";

    @RequestMapping("one")
    public String one(Model model){

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

    @RequestMapping("batch")
    public String batch(Model model){
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom",labRoom);

        List<User> userList = userService.queryAllUser();

        model.addAttribute("userList",userList);
        return "batchApply";
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
     * 单向预约提交申请
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

    /**
     * 批量预约提交申请
     * @param applyBatch
     * @return
     */
    @RequestMapping("batchSubmit")
    @ResponseBody
    public LabResult batchSubmit(ApplyBatch applyBatch){


        LabResult labResult = applyService.addBatchApply(applyBatch);

        return labResult;
    }

    @RequestMapping("queryApplyByLab")
    public String  queryApplyByLab(Model model){

        //查询实验室信息
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom",labRoom);

        return "queryApplyByLab";

    }

    @RequestMapping("queryApplyByUser")
    public String queryApplyByUser(QueryVo queryVo,Model model){

        List<User> userList = userService.queryAllUser();

        model.addAttribute("userList",userList);

        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom", labRoom);


        //根据查询条件分页查询用户列表
        Page<Apply> page = applyService.queryApplyByUser(queryVo);

        //设置分页返回
        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);
        return "queryApplyByUser";
    }

    /**
     * 删除申请
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        String msg = "1";
        try {
            applyService.deleteById(id);
            msg = "0";
        }catch (Exception e){
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

    @RequestMapping("setItermView")
    public String setItermView(Model model){

        ItermYear itermYear = applyService.queryItermYear();
        model.addAttribute("itermYear",itermYear);

        return "setIterm";
    }

    /**
     * 设置学期和学年
     * @param itermYear
     * @return
     */

    @RequestMapping("setIterm")
    @ResponseBody
    public LabResult setIterm(ItermYear itermYear){
        LabResult labResult = applyService.setItermYear(itermYear);
        return labResult;
    }

    @RequestMapping("labRatioView")
    public String labRatioView(){
        return "labRatio";
    }

    /**
     * 查询实验室本学期利用率
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






}

