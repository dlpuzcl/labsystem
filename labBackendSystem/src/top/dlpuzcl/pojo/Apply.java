package top.dlpuzcl.pojo;

public class Apply {
    private int apply_id;
    private int room_id;
    private int apply_day;
    private int apply_section;
    private int apply_week;
    private int user_id;
    private int course_id;
    private String day_section[];
    private String user_name;
    private String room_name;
    private String course_name;
    private String room_code;
    private String course_class;

    public int getApply_id() {
        return apply_id;
    }

    public void setApply_id(int apply_id) {
        this.apply_id = apply_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getApply_day() {
        return apply_day;
    }

    public void setApply_day(int apply_day) {
        this.apply_day = apply_day;
    }

    public int getApply_section() {
        return apply_section;
    }

    public void setApply_section(int apply_section) {
        this.apply_section = apply_section;
    }

    public int getApply_week() {
        return apply_week;
    }

    public void setApply_week(int apply_week) {
        this.apply_week = apply_week;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String[] getDay_section() {
        return day_section;
    }

    public void setDay_section(String[] day_section) {
        this.day_section = day_section;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getRoom_code() {
        return room_code;
    }

    public void setRoom_code(String room_code) {
        this.room_code = room_code;
    }

    public String getCourse_class() {
        return course_class;
    }

    public void setCourse_class(String course_class) {
        this.course_class = course_class;
    }
}
