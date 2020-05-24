package com.service.impl;

import com.dao.MenuDao;
import com.entity.Menu;
import com.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Menu)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:20:20
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Menu selectId(Integer id) {
        return this.menuDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    public Map<String,List<Menu>> selectAll(){
        List<Menu> list=this.menuDao.selectAll();
        List<Menu> parentList=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getParentId()==null||list.get(i).getParentId()==0){
                parentList.add(list.get(i));
                list.remove(i);
                i--;
            }
        }
        Map<String,List<Menu>> map=new HashMap();
        map.put("menuList",list);
        map.put("parentList",parentList);
        return map;
    }

    @Override
    public Map<String,List<Menu>> select(Integer id) {
        List<Menu> list=this.menuDao.select(id);
        List<Menu> parentList=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getParentId()==null||list.get(i).getParentId()==0){
                parentList.add(list.get(i));
                list.remove(i);
                i--;
            }
        }
        Map<String,List<Menu>> map=new HashMap();
        map.put("menuList",list);
        map.put("parentList",parentList);
        return map;
    }

    /**
     * 新增数据
     *
     * @param menu 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Menu menu) {
        return this.menuDao.insert(menu) > 0;
    }

    /**
     * 修改数据
     *
     * @param menu 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Menu menu) {
        return this.menuDao.update(menu) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        return this.menuDao.delete(id) > 0;
    }
}