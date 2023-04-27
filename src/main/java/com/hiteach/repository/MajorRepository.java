package com.hiteach.repository;

import com.hiteach.entity.Blog;
import com.hiteach.entity.Major;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MajorRepository extends JpaRepository<Major,Long> {

    @Query("select count(m.id) from Major m")
    public Double total();

    @Query("select m from Major m where m.name like ?1")
    public List<Major> allByParam(String param);
}
