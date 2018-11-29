package top.dlpuzcl.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    //在Controller方法执行前被执行
    //登录拦截、权限认证等等
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        Object attribute = request.getSession().getAttribute("admini");
        if(attribute != null){
            //放行，执行处理器
            return true;
        }else{
            response.sendRedirect(request.getContextPath() + "/index.jsp");

            return false;
        }
    }
    //在Controller方法执行后，返回ModelAndView之前被执行
    //设置或者清理页面共用参数等等
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }
    //在Controller方法执行后被执行
    //处理异常、记录日志
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
