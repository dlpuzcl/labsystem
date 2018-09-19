package top.dlpuzcl.pojo;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class LabResult {
    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public LabResult() {

    }

    public LabResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public LabResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

    //构建其他状态的taotaoresult对象
    public static LabResult build(Integer status, String msg, Object data) {
        return new LabResult(status, msg, data);
    }

    public static LabResult ok(Object data) {
        return new LabResult(data);
    }

    public static LabResult ok() {
        return new LabResult(null);
    }


    public static LabResult build(Integer status, String msg) {
        return new LabResult(status, msg, null);
    }
    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
