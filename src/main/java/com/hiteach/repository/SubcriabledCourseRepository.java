package com.hiteach.repository;

import com.hiteach.entity.SubcriabledCourse;
import com.hiteach.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface SubcriabledCourseRepository extends JpaRepository<SubcriabledCourse,Long> {

    @Query("select count(s.id) from SubcriabledCourse s where s.paid = 1 and s.course.id = ?1")
    public Double countMemberPaid(Long courseId);

    @Query("select s from SubcriabledCourse s where s.course.id = ?1 and s.paid = ?2")
    public List<SubcriabledCourse> getByCourseId(Long courseId, Integer paid);

    @Query("select s from SubcriabledCourse s where s.user.id= ?1 and s.course.id = ?2")
    public Optional<SubcriabledCourse> findByUserAndCourse(Long userid, Long courseId);

    @Query("select s from SubcriabledCourse s where s.user.id = ?1 and s.paid = ?2")
    public Page<SubcriabledCourse> findByUserId(Long userId, Integer paid, Pageable pageable);

    @Query(value = "SELECT SUM(s.price) FROM subcriabled_course s inner join course c on c.id = s.course_id WHERE c.user_id = ?3 and s.paid = 1 and Month(s.created_date) = ?1 and YEAR(s.created_date) = ?2", nativeQuery = true)
    public Double totalMoney(Integer month, Integer year, Long userId);
}
