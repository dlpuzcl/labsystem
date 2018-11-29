package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.ApplyMapper;
import top.dlpuzcl.mapper.CourseMapper;
import top.dlpuzcl.pojo.Apply;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.ItermYear;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.service.CourseService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseMapper courseMapper;
    @Autowired
    ApplyMapper applyMapper;
    @Override
    public List<Course> courseByUser(Integer id) {

        List<Course> courses = courseMapper.courseByUser(id);

        Apply apply = new Apply();
        ItermYear itermYear = applyMapper.queryItermYear();
        //设置学期
        apply.setIterm(itermYear.getIterm());
        apply.setYears(itermYear.getYears());

        //通过课程ID查询预约的课程
        for (int i = 0; i < courses.size();i++){
            String course_id = String.valueOf(courses.get(i).getCourse_id());
            apply.setCourse_id(course_id);
            Integer course_timed = applyMapper.queryCourseByIdYI(apply);
            courses.get(i).setCourse_timed(course_timed);
        }
        return courses;
    }

    @Override
    public Page<Course> getCourseByQueryVo(QueryVo queryVo) {
        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());
        //查询总记录数
        Integer total = courseMapper.getCountByQueryVo(queryVo);
        //查询列表详细信息
        List<Course> list = courseMapper.getCourseByQueryVo(queryVo);
        Apply apply = new Apply();
        ItermYear itermYear = applyMapper.queryItermYear();
        //设置学期
        apply.setIterm(itermYear.getIterm());
        apply.setYears(itermYear.getYears());

        //通过课程ID查询预约的课程
        for (int i = 0; i < list.size();i++){
            String course_id = String.valueOf(list.get(i).getCourse_id());
            apply.setCourse_id(course_id);
            Integer course_timed = applyMapper.queryCourseByIdYI(apply);
            list.get(i).setCourse_timed(course_timed);
        }
        //包装分页数据
        Page<Course> page = new Page<>(total, queryVo.getPage(), queryVo.getRows(), list);
        return page;
    }

    @Override
    public Course courseById(Integer id) {
        return courseMapper.courseById(id);
    }

    @Override
    public void updateCourse(Course course) {
        courseMapper.updateCourse(course);
    }

    @Override
    public void addCourse(Course course) {
        courseMapper.addCourse(course);
    }

    @Override
    public void deleteCourse(Integer id,Integer course_mark) {
        courseMapper.deleteCourse(id,course_mark);
    }

    @Override
    public List<Course> queryAllCourse() {
        return courseMapper.queryAllCourse();
    }
}
