package top.dlpuzcl.pojo;

public class QueryVo {
    private String userName;
    private String userCollege;
    private String professionalTitle;
    private String roomCode;
    private String roomCollege;
    private String courseName;
    private String applyWeek;
    //当前页码数
    private Integer page = 1;
    //数据库从哪一条数据开始查
    private Integer start;
    //每页显示数据的条数
    private Integer rows = 10;

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
}
