package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.*;
import top.dlpuzcl.service.BaseDictService;
import top.dlpuzcl.service.LabService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Controller
@RequestMapping("lab")
public class LabController {

    @Autowired
    private LabService labService;

    @Autowired
    private BaseDictService baseDictService;

    private String college = "002";
    /**
     * 显示添加实验室界面
     * @param model
     * @return
     */
    @RequestMapping("addview")
    public String labview(Model model){
        //查询学院
        List<BaseDict> fromCollege = baseDictService.getBaseDictByCode(college);
        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);

        return ("addLab");
    }


    /**
     * 添加实验室
     * @param lab
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public LabResult addLab(LabRoom lab){

        LabResult labResult = labService.addLab(lab);

        return labResult;
    }

    /**
     * 显示实验室列表
     * @param model
     * @param queryVo
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, QueryVo queryVo){
        //查询学院
        List<BaseDict> fromCollege = baseDictService.getBaseDictByCode(college);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);

        //根据查询条件分页查询用户列表
        Page<LabRoom> page = labService.getLabByQueryVo(queryVo);

        //设置分页返回
        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);
        return "labManagement";
    }

    /**
     * 修改时数据回显
     * @param id
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public LabRoom edit(Integer id){

        LabRoom labRoomById = labService.getLabRoomById(id);
        return  labRoomById;
    }

    /**
     * 更新实验室信息
     * @param labRoom
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    public String update (LabRoom labRoom){

        String msg = "1";
        try{
            labService.updateLab(labRoom);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete (Integer id){
        String msg = "1";
        try{
            labService.deleteLabById(id);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

}
