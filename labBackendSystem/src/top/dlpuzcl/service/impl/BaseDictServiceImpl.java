package top.dlpuzcl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.dlpuzcl.mapper.BaseDictMapper;
import top.dlpuzcl.pojo.BaseDict;
import top.dlpuzcl.service.BaseDictService;
import java.util.List;
@Service
public class BaseDictServiceImpl implements BaseDictService {
    @Autowired
    private BaseDictMapper baseDictMapper;
    @Override
    public List<BaseDict> getBaseDictByCode(String code) {

        return baseDictMapper.getBaseDictByCode(code);
    }
}