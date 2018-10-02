package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.CourseMapper;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.service.CourseService;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseMapper courseMapper;

    @Override
    public List<Course> courseByUser(Integer id) {
        return courseMapper.courseByUser(id);
    }

    @Override
    public Page<Course> getCourseByQueryVo(QueryVo queryVo) {
        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());
        //查询总记录数
        Integer total = courseMapper.getCountByQueryVo(queryVo);
        //查询列表详细信息
        List<Course> list = courseMapper.getCourseByQueryVo(queryVo);
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
    public void deleteCourse(Integer id) {
        courseMapper.deleteCourse(id);
    }
}
