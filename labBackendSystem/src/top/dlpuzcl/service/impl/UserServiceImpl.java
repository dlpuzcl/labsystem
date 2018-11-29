package top.dlpuzcl.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import top.dlpuzcl.mapper.UserMapper;
import top.dlpuzcl.pojo.LabResult;
import top.dlpuzcl.pojo.QueryVo;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.UserService;
import top.dlpuzcl.utils.EmailUtil;
import top.dlpuzcl.utils.Page;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public Page<User> getUserByQueryVo(QueryVo queryVo) {

        //计算分页查询从那条记录开始
        queryVo.setStart((queryVo.getPage()-1)*queryVo.getRows());

        //查询总记录数
        Integer total = userMapper.getCountByQueryVo(queryVo);

        //查询每页的数据列表
        List<User> list = userMapper.getUserByQueryVo(queryVo);

        //包装分页数据
        Page<User> page = new Page<>(total,queryVo.getPage(),queryVo.getRows(),list);



        return page;
    }


    @Override
    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void deleteUserById(Integer id) {
        userMapper.deleteUserById(id);
    }

    @Override
    public void backUserById(Integer id) {
        userMapper.backUserById(id);
    }

    @Override
    public LabResult addUser(User user) {
        if(StringUtils.isEmpty(user.getUser_name())) {
            return LabResult.build(400, "添加失败.请校验数据后请再提交数据！");
        }
        if(StringUtils.isEmpty(user.getUser_password())){
            return LabResult.build(400, "添加失败.请校验数据后请再提交数据！");
        }


        Integer name_number = userMapper.queryUserByName(user.getUser_name());
        if (name_number > 0){
            return LabResult.build(555, "添加失败，此用户名已经被注册！");
        }

        Integer integer = userMapper.queryUserByPhone(user.getUser_phone());
        if (integer > 0){
            return LabResult.build(555, "添加失败，此电话已经被注册！");
        }

        Integer integer1 = userMapper.queryUserByEmail(user.getUser_email());

        if (integer1 > 0){
            return LabResult.build(555, "添加失败，此邮箱已经被注册！");
        }

//        List<User> users = userMapper.queryAllUser();
//        for (int i=0;i<users.size();i++){
//            if (user.getUser_name().equals(users.get(i).getUser_name()) ){
//                return LabResult.build(555, "添加失败，此用户名已经被注册！");
//            }
//
//            if (user.getUser_phone().equals(users.get(i).getUser_phone())){
//                return LabResult.build(666, "添加失败，此电话已经被注册！");
//            }
//            if (user.getUser_email().equals(users.get(i).getUser_email())){
//                return LabResult.build(777, "添加失败，次邮箱已经被注册！");
//            }
//
//        }
        //发送用户激活邮件
        try {
            EmailUtil.sendTo(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String user_password = user.getUser_password();
        String md5_password = DigestUtils.md5DigestAsHex(user_password.getBytes());
        user.setUser_password(md5_password);

        userMapper.addUser(user);
        return  LabResult.ok();
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User login(User user) {
        String user_password = user.getUser_password();
        String md5_password = DigestUtils.md5DigestAsHex(user_password.getBytes());
        user.setUser_password(md5_password);
        return userMapper.login(user);
    }

    @Override
    public void updatePassword(User user) {
        String user_password = user.getUser_password();
        String md5_password = DigestUtils.md5DigestAsHex(user_password.getBytes());
        user.setUser_password(md5_password);
        userMapper.updatePassword(user);
    }

    @Override
    public void updateState(String email) {
        userMapper.updateState(email);
    }

}
