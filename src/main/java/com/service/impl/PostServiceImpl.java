package com.service.impl;

import com.dao.PostDao;
import com.entity.Post;
import com.service.PostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Post)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Service("postService")
public class PostServiceImpl implements PostService {
    @Resource
    private PostDao postDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Post selectId(Integer id) {
        return this.postDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Post> selectAll() {
        return this.postDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Post> selectPage(Integer start, Integer pageSize) {
        return this.postDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param post 实例对象
     * @return 对象列表
     */
    @Override
    public List<Post> selectCondition(Post post, Integer start, Integer pageSize) {
        return this.postDao.selectCondition(post, start, pageSize);
    }

    /**
     * 新增数据
     *
     * @param post 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Post post) {
        this.postDao.insert(post);
        return this.postDao.insert(post) > 0;
    }

    /**
     * 修改数据
     *
     * @param post 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Post post) {
        return this.postDao.update(post) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        return this.postDao.delete(id) > 0;
    }
}