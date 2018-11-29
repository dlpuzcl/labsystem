package top.dlpuzcl.pojo;

public class QueryVo {
    private String userName;
    private String userCollege;
    private int user_mark;
    private String professionalTitle;
    private String roomCode;
    private String roomCollege;
    private int room_mark;
    private String courseName;
    private int course_mark;
    private String applyWeek;
    private String years;
    private int iterm;
    private String courseNature;

    //当前页码数
    private Integer page = 1;
    //数据库从哪一条数据开始查
    private Integer start;
    //每页显示数据的条数
    private Integer rows = 10;

    public String getCourseNature() {
        return courseNature;
    }

    public void setCourseNature(String courseNature) {
        this.courseNature = courseNature;
    }

    public int getCourse_mark() {
        return course_mark;
    }

    public void setCourse_mark(int course_mark) {
        this.course_mark = course_mark;
    }

    public int getRoom_mark() {
        return room_mark;
    }

    public void setRoom_mark(int room_mark) {
        this.room_mark = room_mark;
    }

    public int getUser_mark() {
        return user_mark;
    }

    public void setUser_mark(int user_mark) {
        this.user_mark = user_mark;
    }

    public String getApplyWeek() {
        return applyWeek;
    }

    public void setApplyWeek(String applyWeek) {
        this.applyWeek = applyWeek;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode;
    }

    public String getRoomCollege() {
        return roomCollege;
    }

    public void setRoomCollege(String roomCollege) {
        this.roomCollege = roomCollege;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserCollege() {
        return userCollege;
    }

    public void setUserCollege(String userCollege) {
        this.userCollege = userCollege;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }


    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }

    public int getIterm() {
        return iterm;
    }

    public void setIterm(int iterm) {
        this.iterm = iterm;
    }
}
