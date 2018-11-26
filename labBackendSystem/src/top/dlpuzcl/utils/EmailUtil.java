package top.dlpuzcl.utils;

import top.dlpuzcl.pojo.*;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;



/**
 * @author amuxia
 * 2017年7月24日
 */
public class EmailUtil {

    private static final String FROM = "dlpuzcl@163.com";

    public static void sendTo(User user) {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject("这是一封激活账号的邮件，复制链接到地址栏来激活他");
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getUser_email()));
            String msg = "<h1>点击<a href='http://192.168.199.243:8080/login/activation.action?code="+user.getUser_email()+"'>此处"+ user.getUser_email()+"</a>激活账户"+user.getUser_name()+"<h1>";
            message.setContent(msg,"text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //批量预约管理员通知
    public static void applyInform(Admini admini, User user, LabRoom lab, Course course,String week,String sessions,int day) {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject("约课通知");
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(RecipientType.TO, new InternetAddress(admini.getAdmini_email()));
            String msg =
                    "<h3 align=\"center\">约课通知！</h3></br>\n" + "<div style='margin:0 auto;width: 80%;'>授课教师：" + user.getUser_name() +
                            "</br>预约教室：" + lab.getRoom_code() + "</br>预约时间：第" + week + "周，星期"+day+"的第"+sessions+"节</br>课程名称：" + course.getCourse_name() + "</br>上课班级：" + course.getCourse_class() + "</br>上课人数：" + course.getCourse_students()+"</div>";
            message.setContent(msg,"text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //批量预约用户通知
    public static void userInform(User user, LabRoom lab, Course course,String week,String sessions,int day) {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject("约课通知");
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getUser_email()));
            String msg =
                    "<h3 align=\"center\">恭喜你预约成功！</h3></br>\n" + "<div style='margin:0 auto;width: 80%;'>授课教师：" + user.getUser_name() +
                            "</br>预约教室：" + lab.getRoom_code() + "</br>预约时间：第" + week + "周-，星期"+day+"的第"+sessions+"节</br>课程名称：" + course.getCourse_name() + "</br>上课班级：" + course.getCourse_class() + "</br>上课人数：" + course.getCourse_students()+"</div>";
            message.setContent(msg, "text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //单点预约管理员通知
    public static void applyInform(Admini admini, User user, LabRoom lab, Course course,String week,String daysessions) {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject("约课通知");
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(RecipientType.TO, new InternetAddress(admini.getAdmini_email()));
            String msg =
                    "<h3 align=\"center\">约课通知！</h3></br>\n" + "<div style='margin:0 auto;width: 80%;'>授课教师：" + user.getUser_name() +
                            "</br>预约教室：" + lab.getRoom_code() + "</br>课程名称：" + course.getCourse_name() + "</br>上课班级：" + course.getCourse_class() + "</br>上课人数：" + course.getCourse_students()+"</br>预约时间：第" + week + "周</br>"+daysessions+"</div>";
            message.setContent(msg,"text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //单点预约用户通知
    public static void userInform(User user, LabRoom lab, Course course,String week,String daysessions) {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject("约课通知");
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getUser_email()));
            String msg =
                    "<h3 align=\"center\">恭喜你预约成功！</h3></br>\n" + "<div style='margin:0 auto;width: 80%;'>授课教师：" + user.getUser_name() +
                            "</br>预约教室：" + lab.getRoom_code() + "</br>预约时间：第" + week + "周"+daysessions+"</br>课程名称：" + course.getCourse_name() + "</br>上课班级：" + course.getCourse_class() + "</br>上课人数：" + course.getCourse_students()+"</div>";
            message.setContent(msg, "text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static Session getSession() {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.163.com");
        props.setProperty("mail.smtp.port", "25");
        props.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, "ZHL939589097");
            }

        });
        return session;
    }
}