package com.hiteach.rest;

import com.hiteach.entity.Course;
import com.hiteach.entity.Major;
import com.hiteach.entity.User;
import com.hiteach.repository.CourseRepository;
import com.hiteach.repository.SubcriabledCourseRepository;
import com.hiteach.service.MailService;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class CourseRest {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;

    @Autowired
    private SubcriabledCourseRepository subcriabledCourseRepository;

    @GetMapping("/admin/courseByActive")
    public List<Course> findAll(@RequestParam("active") Integer active){
        return courseRepository.courseByActive(active);
    }

    @PostMapping("/admin/activeCourse")
    public void activeCourse(@RequestParam("id") Long id){
        Course course = courseRepository.findById(id).get();
        if(course.getActived() == 0){
            course.setActived(1);
            mailService.sendEmail(course.getUser().getEmail(),"active your course","course: "+course.getName()+" actived by admin", false, false);

        }
        else{
            course.setActived(0);
            mailService.sendEmail(course.getUser().getEmail(),"block your course","course: "+course.getName()+" blocked by admin", false, false);
        }
        courseRepository.save(course);
    }

    @PostMapping("/admin/deleteCourse")
    public void deleteCourse(@RequestParam("id") Long id, @RequestParam("content") String content) {
        Course course = courseRepository.findById(id).get();
        String email = course.getUser().getEmail();
        mailService.sendEmail(email,"Your"+course.getName()+" course has been removed for standards violation",content, false, false);
        course.setDeleted(1);
        course.setFeedBackByAdmin(content);
        courseRepository.save(course);
        courseRepository.save(course);
    }

    @PostMapping("/teacher/uploadcourse")
    public void saveCourse(@RequestBody Course course) throws Exception {
        User user = userService.getUserWithAuthority();
        if(course.getId() != null){
            Course c = courseRepository.findById(course.getId()).get();
            if(c.getUser().getId() != user.getId()){
                throw new Exception("access deneind");
            }
            course.setCreatedDate(c.getCreatedDate());
            course.setDeleted(c.getDeleted());
            course.setActived(c.getActived());
            course.setUser(c.getUser());
        }
        else{
            course.setActived(0);
            course.setDeleted(0);
            course.setCreatedDate(new Date(System.currentTimeMillis()));
            course.setUser(user);
        }
        courseRepository.save(course);
    }

    @GetMapping("/teacher/managerCourse")
    public Page<Course> courseByTeacher(@RequestParam("active") Integer active, Pageable pageable){
        User user = userService.getUserWithAuthority();
        Page<Course> p = courseRepository.courseByTeacher(active, user.getId(),pageable);
        if(active == 1){
            for(Course c: p.getContent()){
                c.setTotalNow(subcriabledCourseRepository.countMemberPaid(c.getId()));
            }
        }
        return p;
    }

    @GetMapping("/teacher/courseByTeacherDelete")
    public Page<Course> courseByTeacherDelete(Pageable pageable){
        User user = userService.getUserWithAuthority();
        return courseRepository.courseByTeacherDelete(user.getId(), pageable);
    }

    @GetMapping("/public/courseById")
    public Course findById(@RequestParam("id") Long id){
        return courseRepository.findById(id).get();
    }

    @DeleteMapping("/teacher/deletecourse")
    public void deleteCourse(@RequestParam("id") Long id) throws Exception {
        User user = userService.getUserWithAuthority();
        Course c = courseRepository.findById(id).get();
        if(user.getId() != c.getUser().getId()){
            throw new Exception("access deneid");
        }
        courseRepository.deleteById(id);
    }

    @GetMapping("/public/allCourseSearch")
    public Page<Course> allCourse(@RequestParam("idmajor") Long idmajor, @RequestParam("small") Double small,
                                  @RequestParam("lager") Double lager,  Pageable pageable){
        System.out.println("major: "+idmajor);
        System.out.println("small: "+small);
        System.out.println("lager: "+lager);
        Page<Course> p = null;
        if(idmajor < 0){
            p= courseRepository.getCourseByPrice(small,lager,pageable);
        }
        else{
            p = courseRepository.getCourseByPriceAndMajor(idmajor, small, lager, pageable);
        }
        for(Course c: p.getContent()){
            c.setTotalNow(subcriabledCourseRepository.countMemberPaid(c.getId()));
        }
        return p;
    }

    @GetMapping("/public/courseByUserId")
    public List<Course> findByUserId(@RequestParam("id") Long id){
        return courseRepository.findByUserId(id);
    }

    @GetMapping("/public/courseByTeacherId")
    public Page<Course> findByTeacherId(@RequestParam("id") Long id, Pageable pageable){
        return courseRepository.findByTeacherId(id, pageable);
    }

    @GetMapping("/public/courseHomePage")
    public Set<Course> courseHomePage(){
        try {
            User user = userService.getUserWithAuthority();
            Set<Course> set = courseRepository.getCourseHomePage(user.getId());
            if(set.size() < 6){
                Set<Course> listappend = courseRepository.getCourseIndex();
                for (Course c : listappend){
                    set.add(c);
                }
            }
            return set;
        }
        catch (Exception e){
            return courseRepository.getCourseIndexLimit();
        }
    }

    @GetMapping("/public/searchCourseByParam")
    public Page<Course> searchCourseByParam(@RequestParam("param") String param, Pageable pageable){
        Page<Course> p =courseRepository.searchCourseByParam("%"+param+"%", pageable);
        for(Course c: p.getContent()){
            c.setTotalNow(subcriabledCourseRepository.countMemberPaid(c.getId()));
        }
        return p;
    }

    @GetMapping("/public/searchCourseL")
    public List<Course> getCourseL(@RequestParam("id") Long idcourse){
        Course course = courseRepository.findById(idcourse).get();
        return courseRepository.courseLq(course.getMajor().getId());
    }
}
