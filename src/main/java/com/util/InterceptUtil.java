package com.util;

import com.entity.Account;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author baibaiben
 * @create 2020-05-17 11:06
 */
public class InterceptUtil implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("前置通知："+handler);
        System.out.println("当返回值为true时请求通过，为false时请求被拦截");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("后置通知："+modelAndView);
        Map<String, Integer> map= (Map<String, Integer>) request.getServletContext().getAttribute("map");
        if(map==null){
            map=new HashMap<>();
        }
        Account account= (Account) request.getSession().getAttribute("admin");
        Integer i=map.get(account.getName());
        if(i!=null){
            map.put(account.getName(),i+1);
        }else {
            map.put(account.getName(),1);
        }
        request.getServletContext().setAttribute("map",map);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("视图渲染完毕："+ex);
    }
}
