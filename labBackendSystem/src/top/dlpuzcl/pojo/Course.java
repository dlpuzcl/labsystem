package top.dlpuzcl.pojo;

public class Course {
    private int course_id;
    private String course_name;
    private String course_memo;
    private String course_class;
//    private int user_id;
    private String user_id;
    private int course_time;
    private String course_nature;
    private String course_students;
    private int course_timed;


    public int getCourse_time() {
        return course_time;
    }

    public void setCourse_time(int course_time) {
        this.course_time = course_time;
    }

    public int getCourse_timed() {
        return course_timed;
    }

    public void setCourse_timed(int course_timed) {
        this.course_timed = course_timed;
    }

    public String getCourse_students() {
        return course_students;
    }

    public void setCourse_students(String course_students) {
        this.course_students = course_students;
    }


    public String getCourse_nature() {
        return course_nature;
    }

    public void setCourse_nature(String course_nature) {
        this.course_nature = course_nature;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_memo() {
        return course_memo;
    }

    public void setCourse_memo(String course_memo) {
        this.course_memo = course_memo;
    }

    public String getCourse_class() {
        return course_class;
    }

    public void setCourse_class(String course_class) {
        this.course_class = course_class;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
