package top.dlpuzcl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.service.AdminiService;

@Controller
@RequestMapping("admini")
public class AdminiController {
    @Autowired
    AdminiService adminiService;


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
}
