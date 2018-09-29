package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Course;

import java.util.List;

public interface CourseMapper {

    /**
     * 根据user_id查询课程
     * @param id
     * @return
     */

    List<Course> courseByUser(Integer id);
}
