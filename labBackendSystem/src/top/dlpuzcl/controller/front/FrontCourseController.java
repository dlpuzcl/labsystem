package top.dlpuzcl.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.BaseDict;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.service.BaseDictService;
import top.dlpuzcl.service.CourseService;

import java.util.List;

@Controller
@RequestMapping("frontCourse")
public class FrontCourseController {
    @Autowired
    CourseService courseService;
    @Autowired
    private BaseDictService baeDictService;

    private String course_nature = "003";


    @RequestMapping("list")
    public String list(Model model,Integer id) {
        //查询课程性质
        List<BaseDict> course_nature_list = baeDictService.getBaseDictByCode(course_nature);
        List<Course> courseList = courseService.courseByUser(id);
        model.addAttribute("course_nature_list",course_nature_list);
        model.addAttribute(courseList);
        return "frontCourseManagement";
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
}


