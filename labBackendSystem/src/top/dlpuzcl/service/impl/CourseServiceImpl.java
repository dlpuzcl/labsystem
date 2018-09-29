package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.CourseMapper;
import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.service.CourseService;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseMapper courseMapper;

    @Override
    public List<Course> courseByUser(Integer id) {
        return courseMapper.courseByUser(id);
    }
}
