package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.CourseService;
import top.dlpuzcl.service.UserService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Controller
@RequestMapping("course")
public class CourseController {

    @Autowired
    private UserService userService;

    @Autowired
    CourseService courseService;

    /**
     * 查询课程
     * @param model
     * @param queryVo
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, QueryVo queryVo){

        //查询所有用户
        List<User> userList = userService.queryAllUser();
        //设置数据模型返回
        model.addAttribute("userList",userList);
        //根据查询条件分页查询课程列表
        Page<Course> page = courseService.getCourseByQueryVo(queryVo);

        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);
        return "courseManagement";
    }

    /**
     * 修改时数据回显
     * @param id
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public Course edit(Integer id){
        return courseService.courseById(id);
    }

    /**
     * 更新课程数据
     */
    @RequestMapping("update")
    @ResponseBody
    public String update(Course course){
        String msg = "1";
        try{
            courseService.updateCourse(course);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 添加课程
     * @param course
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public String add(Course course){
        String msg = "1";
        try{
            courseService.addCourse(course);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 删除课程
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        String msg = "1";
        try{
            courseService.deleteCourse(id);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }
}
