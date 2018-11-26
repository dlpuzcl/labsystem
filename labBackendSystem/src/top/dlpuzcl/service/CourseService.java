package top.dlpuzcl.service;

import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.utils.Page;

import java.util.List;

public interface CourseService {
    /**
     * 根据user_id查询课程
     * @param id
     * @return
     */

    List<Course> courseByUser(Integer id);

    /**
     * 分页查询
     * @param queryVo
     * @return
     */
    Page<Course> getCourseByQueryVo(QueryVo queryVo);

    /**
     * 根据id查询课程信息
     * @param id
     * @return
     */
    Course courseById(Integer id);

    /**
     * 更新课程
     * @param course
     */
    void updateCourse(Course course);

    /**
     * 添加课程
     * @param course
     */
    void addCourse(Course course);

    /**
     * 删除课程
     * @param id
     */
    void deleteCourse(Integer id,Integer course_mark);
}
