package com.hiteach.repository;

import com.hiteach.entity.Course;
import com.hiteach.entity.Major;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Set;

public interface CourseRepository extends JpaRepository<Course,Long> {

    @Query("select c from Course c where c.actived = ?1 and c.deleted = 0")
    public List<Course> courseByActive(Integer active);

    @Query("select count(m.id) from Course m")
    public Double total();

    @Query("select c from Course c where c.actived = ?1 and c.deleted = 0 and c.user.id = ?2")
    public Page<Course> courseByTeacher(Integer active, Long userId, Pageable pageable);

    @Query("select c from Course c where c.deleted = 1 and c.user.id = ?1")
    public Page<Course> courseByTeacherDelete(Long userId, Pageable pageable);

    @Query("select c from Course c where c.deleted = 0 and c.actived = 1 and c.price >= ?1 and c.price <= ?2")
    public Page<Course> getCourseByPrice(Double small, Double lager, Pageable pageable);

    @Query("select c from Course c where c.deleted = 0 and c.actived = 1 and c.price >= ?2 and c.price <= ?3 and c.major.id = ?1")
    public Page<Course> getCourseByPriceAndMajor(Long idMajor,Double small, Double lager, Pageable pageable);

    @Query("select c from Course c where c.user.id = ?1")
    public List<Course> findByUserId(Long userId);

    @Query("select c from Course c where c.user.id = ?1 and c.actived = 1 and c.deleted = 0")
    public Page<Course> findByTeacherId(Long userId, Pageable pageable);

    @Query("select count(c.id) from Course c where c.user.id = ?1 and c.actived = 1 and c.deleted = 0")
    public Integer totalCourse(Long userId);

    @Query(value = "select c.* from course c INNER join major m on m.id = c.major_id INNER join major_interest i on i.major_id = m.id where i.user_id = ?1 and c.actived = 1 and c.deleted = 0 limit 6", nativeQuery = true)
    public Set<Course> getCourseHomePage(Long userId);

    @Query("select c from Course c where c.deleted = 0 and c.actived = 1 order by c.id desc ")
    public Set<Course> getCourseIndex();

    @Query(value = "select c.* from course c where c.deleted = 0 and c.actived = 1 order by c.id desc limit 6", nativeQuery = true)
    public Set<Course> getCourseIndexLimit();

    @Query(value = "select c.* from Course c where c.major_id = ?1 and c.deleted = 0 and c.actived = 1 order by c.id desc limit 3",nativeQuery = true)
    public List<Course> courseLq(Long major);

    @Query(value = "select c from Course c where c.actived = 1 and c.deleted = 0 and (c.name like ?1 or c.major.name like ?1 or c.user.fullname like ?1)")
    public Page<Course> searchCourseByParam(String param, Pageable pageable);


}
