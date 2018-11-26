package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.BaseDict;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.BaseDictService;
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

    @Autowired
    private BaseDictService baeDictService;

    private String course_nature = "003";
    /**
     * 查询课程
     * @param model
     * @param queryVo
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, QueryVo queryVo){
        queryVo.setCourse_mark(1);
        //查询课程性质
        List<BaseDict> course_nature_list = baeDictService.getBaseDictByCode(course_nature);

        //查询所有用户
        List<User> userList = userService.queryAllUser();
        //设置数据模型返回
        model.addAttribute("userList",userList);
        model.addAttribute("course_nature_list",course_nature_list);

        //根据查询条件分页查询课程列表
        Page<Course> page = courseService.getCourseByQueryVo(queryVo);

        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);
        return "courseManagement";
    }

    /**
     * 显示已经删除的课程列表
     * @param model
     * @param queryVo
     * @return
     */
    @RequestMapping("recycleCourse")
    public String recycleCourse(Model model, QueryVo queryVo){
        queryVo.setCourse_mark(0);
        //查询课程性质
        List<BaseDict> course_nature_list = baeDictService.getBaseDictByCode(course_nature);

        //查询所有用户
        List<User> userList = userService.queryAllUser();
        //设置数据模型返回
        model.addAttribute("userList",userList);
        model.addAttribute("course_nature_list",course_nature_list);

        //根据查询条件分页查询课程列表
        Page<Course> page = courseService.getCourseByQueryVo(queryVo);

        model.addAttribute("page",page);

        //返回查询条件
        model.addAttribute("vo",queryVo);
        return "recycleCourse";
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
        int course_mark = 0;
        String msg = "1";
        try{
            courseService.deleteCourse(id,course_mark);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 找回课程
     * @param id
     * @return
     */
    @RequestMapping("back")
    @ResponseBody
    public String back(Integer id){
        int course_mark = 1;
        String msg = "1";
        try{
            courseService.deleteCourse(id,course_mark);
            msg = "0";
        }catch (Exception e){
            e.printStackTrace();
        }
        return msg;
    }
}
