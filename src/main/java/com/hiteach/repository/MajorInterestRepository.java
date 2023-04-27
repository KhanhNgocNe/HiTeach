package com.hiteach.repository;

import com.hiteach.entity.Blog;
import com.hiteach.entity.MajorInterest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Repository
public interface MajorInterestRepository extends JpaRepository<MajorInterest,Long> {

    @Query("select m from MajorInterest m where m.user.id = ?1")
    public List<MajorInterest> findByUserId(Long userId);

    @Modifying
    @Query("delete from MajorInterest m where m.user.id = :userid")
    int deleteByUserId(@Param("userid") Long userId);
}
