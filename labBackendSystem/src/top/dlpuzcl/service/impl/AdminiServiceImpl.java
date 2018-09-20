package top.dlpuzcl.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import top.dlpuzcl.mapper.AdminiMapper;
import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.service.AdminiService;

@Service
public class AdminiServiceImpl implements AdminiService {

    @Autowired
    AdminiMapper adminiMapper;

    @Override
    public LabResult addAdmini(Admini admini) {
        if(StringUtils.isEmpty(admini.getAdmini_name())) {
            return LabResult.build(400, "用户名不能为空");
        }
        if(StringUtils.isEmpty(admini.getAdmini_password())){
            return LabResult.build(400, "密码不能为空");
        }

        String admini_password = admini.getAdmini_password();
        String md5_password = DigestUtils.md5DigestAsHex(admini_password.getBytes());
        admini.setAdmini_password(md5_password);

        adminiMapper.addAdmini(admini);

        return LabResult.ok();
    }
}
