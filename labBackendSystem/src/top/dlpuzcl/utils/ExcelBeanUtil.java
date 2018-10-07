package top.dlpuzcl.utils;

import top.dlpuzcl.pojo.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 导入excel bean的工具类
 */
public class ExcelBeanUtil {


    public static List<Map<Integer,Object>> manageUserList(final List<User> users){
        List<Map<Integer,Object>> datalist = new ArrayList<>();
        if (users!= null && users.size() > 0){
            int length = users.size();

            Map<Integer,Object> dataMap;

            User bean;

            for (int i = 0; i < length; i++){
                bean = users.get(i);

                dataMap = new HashMap<>();
                dataMap.put(0,bean.getUser_name());
                dataMap.put(1,bean.getUser_phone());
                dataMap.put(2,bean.getUser_email());
                dataMap.put(3,bean.getProfessional_title());
                dataMap.put(4,bean.getCollege());

                datalist.add(dataMap);

            }
        }

        return datalist;
    }
}
