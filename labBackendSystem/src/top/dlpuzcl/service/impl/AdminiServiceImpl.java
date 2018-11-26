package top.dlpuzcl.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import top.dlpuzcl.mapper.AdminiMapper;
import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.service.AdminiService;

import java.util.List;

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
        List<Admini> adminis = adminiMapper.queryAdmini();
        for (int i=0;i<adminis.size();i++){
            if (admini.getAdmini_name().equals(adminis.get(i).getAdmini_name()) ){
                return LabResult.build(400, "添加失败，此用户名已经被注册！");
            }

            if (admini.getAdmini_email().equals(adminis.get(i).getAdmini_email())){
                return LabResult.build(400, "添加失败，次邮箱已经被注册！");
            }
        }


        String admini_password = admini.getAdmini_password();
        String md5_password = DigestUtils.md5DigestAsHex(admini_password.getBytes());
        admini.setAdmini_password(md5_password);

        adminiMapper.addAdmini(admini);

        return LabResult.ok();
    }

    @Override
    public Admini login(Admini admini) {
        String admini_password = admini.getAdmini_password();
        String md5_password = DigestUtils.md5DigestAsHex(admini_password.getBytes());
        admini.setAdmini_password(md5_password);
        return adminiMapper.login(admini);
    }

    @Override
    public void updatePassword(Admini admini) {
        String admini_password = admini.getAdmini_password();
        String md5_password = DigestUtils.md5DigestAsHex(admini_password.getBytes());
        admini.setAdmini_password(md5_password);
        adminiMapper.updatePassword(admini);
    }

    @Override
    public Admini queryAdminiById(Integer id) {
        return adminiMapper.queryAdminiById(id);
    }

    @Override
    public LabResult updateAdmini(Admini admini) {

        if(StringUtils.isEmpty(admini.getAdmini_name())) {
            return LabResult.build(400, "用户名不能为空");
        }

        List<Admini> adminis = adminiMapper.queryAdmini();
        for (int i=0;i<adminis.size();i++){
            if (admini.getAdmini_name().equals(adminis.get(i).getAdmini_name()) ){
                return LabResult.build(333, "添加失败，此用户名已经被注册！");
            }

            if (admini.getAdmini_email().equals(adminis.get(i).getAdmini_email())){
                return LabResult.build(444, "添加失败，此邮箱已经被注册！");
            }
        }

        try {
            adminiMapper.updateAdmini(admini);
        }catch (Exception e){
            e.printStackTrace();
            return LabResult.build(555, "添加失败，发生异常！");
        }

        return LabResult.ok();
    }
}
