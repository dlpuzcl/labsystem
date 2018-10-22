package top.dlpuzcl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.LabRoom;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.AdminiService;
import top.dlpuzcl.service.LabService;
import top.dlpuzcl.service.UserService;

import java.util.List;

@Controller
@RequestMapping("admini")
public class AdminiController {
    @Autowired
    AdminiService adminiService;

    @Autowired
    LabService labService;

    @Autowired
    UserService userService;

    /**
     * 添加管理员
     * @param admini
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public LabResult add(Admini admini){

        LabResult labResult = adminiService.addAdmini(admini);
        return labResult;
    }

    /**
     * 显示首页
     */
    @RequestMapping("first")
    public String first(Model model){
        //查询实验室信息
        List<LabRoom> labRoom = labService.queryLabCode();
        model.addAttribute("labRoom",labRoom);

        return "first";
    }

    /**
     * 重设密码
     */
    @RequestMapping("updatePassword")
    @ResponseBody
    public String updatePassword(Admini admini)
    {
        String msg = "1";
        try {
            adminiService.updatePassword(admini);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }

        return msg;
    }

    @RequestMapping("updatePasswordView")
    public String updatePasswordView(Model model){
        List<User> users = userService.queryAllUser();

        model.addAttribute("users",users);

        return "updatePassword";
    }


}
