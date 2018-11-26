package top.dlpuzcl.mapper;

import top.dlpuzcl.pojo.BaseDict;

import java.util.List;
/**
 * 字典持久化接口
 */
public interface BaseDictMapper {
    /**
     * 根据字典编码查询字典列表
     * @param code
     * @return
     */
    List<BaseDict> getBaseDictByCode(String code);

    /**
     * 添加数据字典
     * @param baseDict
     */
    void addBaseDict (BaseDict baseDict);

    /**
     * 根据ID删除数据字典
     * @param id
     */
    void deleteBaseDict (int id);
}
