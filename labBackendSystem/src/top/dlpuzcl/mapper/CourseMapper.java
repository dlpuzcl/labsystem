package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.Course;
import top.dlpuzcl.pojo.QueryVo;

import java.util.List;

public interface CourseMapper {

    /**
     * 根据user_id查询课程
     * @param id
     * @return
     */

    List<Course> courseByUser(Integer id);

    /**
     * 根据查询条件分页查询列表
     * @param queryVo
     * @return
     */
    List<Course> getCourseByQueryVo(QueryVo queryVo);

    /**
     * 根据条件查询总记录数
     * @param queryVo
     * @return
     */
    Integer getCountByQueryVo(QueryVo queryVo);

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
     * @param course_mark
     */
    void deleteCourse(Integer id, Integer course_mark);

    /**
     * 查询所有课程
     */

    List<Course> queryAllCourse();


}
