package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.BaseDict;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.BaseDictService;
import top.dlpuzcl.service.UserService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private BaseDictService baeDictService;

    @Autowired
    private UserService userService;

    private String college = "002";

    private String professional_title = "001";
    /**
     *显示客户列表
     */
    @RequestMapping("list")
    public String list(Model model,QueryVo queryVo){

        //查询学院
        List<BaseDict> fromCollege = baeDictService.getBaseDictByCode(college);

        //查询职称
        List<BaseDict> fromProfessionalTitle = baeDictService.getBaseDictByCode(professional_title);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);
        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);

        //根据查询条件分页查询用户列表
        Page<User> page = userService.getUserByQueryVo(queryVo);


        //设置分页返回
        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);

        return"userManagement";
    }

    /**
     * 修改时数据回显
     * @param id
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public User edit(Integer id){
        User userById = userService.getUserById(id);
        return userById;
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    public String update (User user){

        String msg = "1";
        try{
            userService.updateUser(user);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 删除用户
     * @param id
     * @return
     */

    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        String msg = "1";
        try{
            userService.deleteUserById(id);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 显示添加用户时的视图
     * @param model
     * @return
     */
    @RequestMapping("addview")
    public String addview(Model model){
        //查询学院
        List<BaseDict> fromCollege = baeDictService.getBaseDictByCode(college);

        //查询职称
        List<BaseDict> fromProfessionalTitle = baeDictService.getBaseDictByCode(professional_title);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);
        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);

        return ("addUser");
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public LabResult addUser(User user){

            LabResult labResult = userService.addUser(user);

        return labResult;
    }


}
