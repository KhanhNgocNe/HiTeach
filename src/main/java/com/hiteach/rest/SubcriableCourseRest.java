package com.hiteach.rest;

import com.hiteach.entity.Course;
import com.hiteach.entity.SubcriabledCourse;
import com.hiteach.entity.User;
import com.hiteach.repository.CourseRepository;
import com.hiteach.repository.SubcriabledCourseRepository;
import com.hiteach.service.MailService;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class SubcriableCourseRest {

    @Autowired
    private SubcriabledCourseRepository subcriabledCourseRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    @GetMapping("/teacher/subcribleByCourse")
    public List<SubcriabledCourse> findByCourseId(@RequestParam("id") Long id, @RequestParam("paid") Integer paid){
        return subcriabledCourseRepository.getByCourseId(id, paid);
    }

    @GetMapping("/teacher/paidCourse")
    public void paid(@RequestParam("id") Long id) throws Exception {
        SubcriabledCourse s = subcriabledCourseRepository.findById(id).get();
        Course course = s.getCourse();
        if(Double.valueOf(course.getMaxQuantity()) == subcriabledCourseRepository.countMemberPaid(course.getId())){
            throw new Exception("full member");
        }
        s.setPaid(1);
        mailService.sendEmail(s.getUser().getEmail(),"regis course successful","course: "+course.getName()+" regis successful", false, false);

        subcriabledCourseRepository.save(s);
    }

    @PostMapping("/user/subcribleCourse")
    public ResponseEntity<Void> subByUser(@RequestBody SubcriabledCourse subcriabledCourse){
        User user = userService.getUserWithAuthority();
        Course course = courseRepository.findById(subcriabledCourse.getCourse().getId()).get();
        if(Double.valueOf(course.getMaxQuantity()) == subcriabledCourseRepository.countMemberPaid(course.getId())){
            return ResponseEntity.status(300).body(null);
        }
        Optional<SubcriabledCourse> sub = subcriabledCourseRepository.findByUserAndCourse(user.getId(), course.getId());
        if(sub.isPresent()){
            return ResponseEntity.status(350).body(null);
        }
        subcriabledCourse.setPaid(0);
        subcriabledCourse.setPrice(course.getPrice());
        subcriabledCourse.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        subcriabledCourse.setUser(user);
        subcriabledCourseRepository.save(subcriabledCourse);
        return ResponseEntity.status(200).body(null);
    }

    @DeleteMapping("/teacher/deleteSub")
    public void deleteSub(@RequestParam("id") Long id){
        subcriabledCourseRepository.deleteById(id);
    }

    @GetMapping("/user/mysubcrible")
    public Page<SubcriabledCourse> findByUserId(@RequestParam("paid") Integer paid, Pageable pageable){
        User user = userService.getUserWithAuthority();
        return subcriabledCourseRepository.findByUserId(user.getId(), paid, pageable);
    }

    @DeleteMapping("/user/deleteSubcrible")
    public void findByUserId(@RequestParam("id") Long id){
        User user = userService.getUserWithAuthority();
        SubcriabledCourse subcriabledCourse = subcriabledCourseRepository.findById(id).get();
        if(user.getId() != subcriabledCourse.getUser().getId()){
            return;
        }
        subcriabledCourseRepository.deleteById(id);
    }

    @GetMapping("/teacher/statistic")
    public List<Double> statistic(@RequestParam("year") Integer year){
        List<Double> list = new ArrayList<>();
        User u = userService.getUserWithAuthority();
        for(int i=1; i<=12; i++){
            Double sta = subcriabledCourseRepository.totalMoney(i, year, u.getId());
            if(sta == null){
                sta = 0D;
            }
            list.add(sta);
        }
        return list;
    }
}
