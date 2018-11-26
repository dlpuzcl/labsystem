package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.BaseDict;
import top.dlpuzcl.service.BaseDictService;
import top.dlpuzcl.service.UserService;

import java.util.List;

@Controller
@RequestMapping("baseDict")
public class BaseDictController {
    @Autowired
    private BaseDictService baeDictService;

    @Autowired
    private UserService userService;

    private String college = "002";

    private String professional_title = "001";

    private String profession = "004";

    @RequestMapping("professional")
    public String professional (Model model){
        //查询专业
        List<BaseDict> professionList = baeDictService.getBaseDictByCode(profession);

        //设置数据模型返回

        model.addAttribute("profession",professionList);

        return "setProfessional";
    }

    @RequestMapping("college")
    public String college (Model model){

        //查询学院
        List<BaseDict> fromCollege = baeDictService.getBaseDictByCode(college);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);

        return "setCollege";
    }

    @RequestMapping("professional_title")
    public String professional_title (Model model){

        //查询职称
        List<BaseDict> fromProfessionalTitle = baeDictService.getBaseDictByCode(professional_title);
        //设置数据模型返回

        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);

        return "setProfessional_title";
    }


    @RequestMapping("courseNature")
    public String courseNature (Model model){

        //查询职称
        List<BaseDict> course_nature = baeDictService.getBaseDictByCode("003");

        //设置数据模型返回

        model.addAttribute("course_nature",course_nature);

        return "setCourse_nature";
    }

    @RequestMapping("add")
    @ResponseBody
    public String add(BaseDict baseDict){
        String msg = "1";
        try{
            baeDictService.addBaseDict(baseDict);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;

    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(int id){
        String msg = "1";
        try{
        baeDictService.deleteBaseDict(id);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }


}
