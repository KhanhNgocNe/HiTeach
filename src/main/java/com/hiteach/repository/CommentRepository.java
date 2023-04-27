package com.hiteach.repository;

import com.hiteach.entity.Chatting;
import com.hiteach.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {

    @Query("select c from Comment c where c.course.id = ?1")
    public List<Comment> findByCourseId(Long courseId);
}
