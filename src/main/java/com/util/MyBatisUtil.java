package com.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author baibaiben
 * @create 2020-05-11 18:37
 */
public class MyBatisUtil {

    static SqlSessionFactory sqlSessionFactory;
    //用于存储单线程访问的数据，里面的数据只能是存入数据的那个线程才能获取，每个线程只能获取自己存储的数据
    static ThreadLocal<SqlSession> threadLocal=new ThreadLocal<>();

    static {
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatisconfig.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static SqlSession getSqlSession(){
        SqlSession sqlSession=threadLocal.get();
        if(sqlSession==null){
            sqlSession=sqlSessionFactory.openSession();
            threadLocal.set(sqlSession);
        }
        return sqlSession;
    }

    public static void closs(){
        SqlSession sqlSession=threadLocal.get();
        if(sqlSession!=null){
            sqlSession.commit();
            sqlSession.close();
            threadLocal.remove();
        }
    }
}
