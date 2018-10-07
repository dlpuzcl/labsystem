package top.dlpuzcl.pojo;


public class LabRoom {
    private int room_id;
    private String room_code;
    private String room_name;
    private String room_memo;
    private int place_count;
    private String room_college;
    private double labRatio;

    public double getLabRatio() {
        return labRatio;
    }

    public void setLabRatio(double labRatio) {
        this.labRatio = labRatio;
    }

    public String getRoom_college() {
        return room_college;
    }

    public void setRoom_college(String room_college) {
        this.room_college = room_college;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getRoom_code() {
        return room_code;
    }

    public void setRoom_code(String room_code) {
        this.room_code = room_code;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getRoom_memo() {
        return room_memo;
    }

    public void setRoom_memo(String room_memo) {
        this.room_memo = room_memo;
    }

    public int getPlace_count() {
        return place_count;
    }

    public void setPlace_count(int place_count) {
        this.place_count = place_count;
    }

    @Override
    public String toString() {
        return "LabRoom{" +
                "room_id=" + room_id +
                ", room_code='" + room_code + '\'' +
                ", room_name='" + room_name + '\'' +
                ", room_memo='" + room_memo + '\'' +
                ", place_count=" + place_count +
                ", room_college='" + room_college + '\'' +
                ", labRatio=" + labRatio +
                '}';
    }
}
