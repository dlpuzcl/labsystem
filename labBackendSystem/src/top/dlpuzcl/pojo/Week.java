package top.dlpuzcl.pojo;

import java.util.ArrayList;

public class Week {
    private int week;
    private ArrayList<Schedule> schedules;

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public ArrayList<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(ArrayList<Schedule> schedules) {
        this.schedules = schedules;
    }
}
