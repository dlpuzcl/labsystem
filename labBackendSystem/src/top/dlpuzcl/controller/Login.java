package top.dlpuzcl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.dlpuzcl.pojo.Admini;
import top.dlpuzcl.pojo.User;
import top.dlpuzcl.service.AdminiService;
import top.dlpuzcl.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class Login {
    @Autowired
    AdminiService adminiService;

    @Autowired
    UserService userService;
    @RequestMapping("view")
    public String login() {
        return "login";
    }

    /**
     * 管理员登录
     * @param admini
     * @param session
     * @return
     */
    @RequestMapping("admini")
    @ResponseBody
    public String adminiLogin(Admini admini, HttpSession session) {

        String msg = "1";
        Admini admini_s = adminiService.login(admini);
        if (admini_s != null) {
            session.setAttribute("admini", admini_s);
            //登录成功
            msg = "0";

        }
        return msg;

    }

    /**
     * 管理员注销
     */
    @RequestMapping("adminiLogout")
    public String adminiLogout(HttpSession session){
        session.removeAttribute("admini");
        return "login";
    }

    /**
     * 用户登录
     */
    @RequestMapping("user")
    @ResponseBody
    public String userLogin(User user, HttpSession session) {

        String msg = "1";
        User user_l = userService.login(user);
        if (user_l != null) {
            session.setAttribute("user", user_l);
            //登录成功
            msg = "0";

        }

        return msg;

    }

    /**
     * 用户注销
     */
    @RequestMapping("userLogout")
    public String userLogout(HttpSession session){
        session.removeAttribute("user");
        return "login";
    }


}
