package top.dlpuzcl.pojo;

public class Course {
    private int course_id;
    private String course_name;
    private String course_memo;
    private String course_class;
    private int user_id;

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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
