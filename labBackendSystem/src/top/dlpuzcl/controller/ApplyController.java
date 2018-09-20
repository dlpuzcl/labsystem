package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.Apply;
import top.dlpuzcl.service.ApplyService;

import java.util.List;

@Controller
@RequestMapping("apply")
public class ApplyController {

    @Autowired
    ApplyService applyService;

    @RequestMapping("one")
    public String one(Model model){

        List<Apply> applyList = applyService.getApplyList();

        model.addAttribute("applyList",applyList);

        return "applyLab";
    }


    @RequestMapping("query")
    @ResponseBody
    public List<Apply> query(){

        List<Apply> applyList = applyService.getApplyList();

        return applyList;
    }

}
