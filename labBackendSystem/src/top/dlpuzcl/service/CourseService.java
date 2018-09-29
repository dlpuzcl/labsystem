package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Course;

import java.util.List;

public interface CourseService {
    /**
     * 根据user_id查询课程
     * @param id
     * @return
     */

    List<Course> courseByUser(Integer id);
}
