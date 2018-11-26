package top.dlpuzcl.controller;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
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
import top.dlpuzcl.utils.ExcelBeanUtil;
import top.dlpuzcl.utils.ExcelUtil;
import top.dlpuzcl.utils.Page;
import top.dlpuzcl.utils.WebUtil;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {



    @Autowired
    private BaseDictService baeDictService;

    @Autowired
    private UserService userService;

    private String college = "002";

    private String professional_title = "001";

    private String profession = "004";

    private String excelUserName = "用户信息.xls";

    private String sheetUserName = "用户信息";

    /**
     *显示用户列表
     */
    @RequestMapping("list")
    public String list(Model model,QueryVo queryVo){

        queryVo.setUser_mark(1);

        //查询学院
        List<BaseDict> fromCollege = baeDictService.getBaseDictByCode(college);

        //查询职称
        List<BaseDict> fromProfessionalTitle = baeDictService.getBaseDictByCode(professional_title);

        //查询专业
        List<BaseDict> professionList = baeDictService.getBaseDictByCode(profession);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);
        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);
        model.addAttribute("profession",professionList);

        //根据查询条件分页查询用户列表
        Page<User> page = userService.getUserByQueryVo(queryVo);


        //设置分页返回
        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);

        return"userManagement";
    }


    /**
     *用户回收站
     */
    @RequestMapping("recycleUser")
    public String recycleUser(Model model,QueryVo queryVo){
        queryVo.setUser_mark(0);
        //查询学院
        List<BaseDict> fromCollege = baeDictService.getBaseDictByCode(college);

        //查询职称
        List<BaseDict> fromProfessionalTitle = baeDictService.getBaseDictByCode(professional_title);

        //查询专业
        List<BaseDict> professionList = baeDictService.getBaseDictByCode(profession);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);
        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);
        model.addAttribute("profession",professionList);

        //根据查询条件分页查询用户列表
        Page<User> page = userService.getUserByQueryVo(queryVo);


        //设置分页返回
        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);

        return"recycleUser";
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
     * 找回用户
     * @param id
     * @return
     */

    @RequestMapping("back")
    @ResponseBody
    public String back(Integer id){
        String msg = "1";
        try{
            userService.backUserById(id);
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

        //查询专业
        List<BaseDict> professionList = baeDictService.getBaseDictByCode(profession);

        //设置数据模型返回
        model.addAttribute("fromCollege",fromCollege);
        model.addAttribute("fromProfessionalTitle",fromProfessionalTitle);
        model.addAttribute("profession",professionList);
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

    /**
     * 修改用户密码
     */
    @RequestMapping("updatePassword")
    @ResponseBody
    public String updatePassword(User user){

        String msg = "1";
        try{
            userService.updatePassword(user);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }


    /**
     * 导出用户excel
     * @param response
     * @return
     */
    @RequestMapping("userExcel")
    @ResponseBody
    public String downlodeUser(HttpServletResponse response){

        try {
        List<User> users = userService.queryAllUser();
        String[] headers = new String[]{"姓名","电话","邮箱","职称","学院"};

        List<Map<Integer, Object>> dataList = ExcelBeanUtil.manageUserList(users);

        Workbook wb = new HSSFWorkbook();

        ExcelUtil.fillExcelSheetData(dataList,wb,headers,sheetUserName);


            WebUtil.downloadExcel(response,wb,excelUserName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }






}
