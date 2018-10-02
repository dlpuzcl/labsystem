package top.dlpuzcl.pojo;

public class ApplyBatch {
    private int apply_week_first;
    private int apply_week_last;
    private int apply_section_first;
    private int apply_section_last;
    private int room_id;
    private int user_id;
    private int course_id;
    private int apply_day;
    private int apply_week;
    private  int apply_section;

    public int getApply_day() {
        return apply_day;
    }

    public void setApply_day(int apply_day) {
        this.apply_day = apply_day;
    }

    public int getApply_week() {
        return apply_week;
    }

    public void setApply_week(int apply_week) {
        this.apply_week = apply_week;
    }

    public int getApply_section() {
        return apply_section;
    }

    public void setApply_section(int apply_section) {
        this.apply_section = apply_section;
    }

    public int getApply_week_first() {
        return apply_week_first;
    }

    public void setApply_week_first(int apply_week_first) {
        this.apply_week_first = apply_week_first;
    }

    public int getApply_week_last() {
        return apply_week_last;
    }

    public void setApply_week_last(int apply_week_last) {
        this.apply_week_last = apply_week_last;
    }

    public int getApply_section_first() {
        return apply_section_first;
    }

    public void setApply_section_first(int apply_section_first) {
        this.apply_section_first = apply_section_first;
    }

    public int getApply_section_last() {
        return apply_section_last;
    }

    public void setApply_section_last(int apply_section_last) {
        this.apply_section_last = apply_section_last;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
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

    @Override
    public String toString() {
        return "ApplyBatch{" +
                "apply_week_first=" + apply_week_first +
                ", apply_week_last=" + apply_week_last +
                ", apply_section_first=" + apply_section_first +
                ", apply_section_last=" + apply_section_last +
                ", room_id=" + room_id +
                ", user_id=" + user_id +
                ", course_id=" + course_id +
                ", apply_day=" + apply_day +
                ", apply_week=" + apply_week +
                ", apply_section=" + apply_section +
                '}';
    }
}
