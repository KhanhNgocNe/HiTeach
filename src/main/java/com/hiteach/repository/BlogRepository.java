package com.hiteach.repository;

import com.hiteach.entity.Blog;
import com.hiteach.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog,Long> {

    @Query("select b from Blog b order by b.id desc")
    public List<Blog> findAllDesc();

    @Query("select count(m.id) from Blog m")
    public Double total();

    @Query("select b from Blog b order by b.id desc")
    public Page<Blog> getAllBlogUser(Pageable pageable);

    @Query("select b from Blog b where b.title like ?1 order by b.id desc")
    public Page<Blog> getAllBlogUserAndParam(String s,Pageable pageable);

    @Query(value = "SELECT * FROM blog ORDER BY views desc limit 4" ,nativeQuery = true)
    public List<Blog> getBlogTopView();
}
