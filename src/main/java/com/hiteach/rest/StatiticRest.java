package com.hiteach.rest;

import com.hiteach.dto.StatiticDto;
import com.hiteach.repository.BlogRepository;
import com.hiteach.repository.CourseRepository;
import com.hiteach.repository.MajorRepository;
import com.hiteach.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class StatiticRest {

    @Autowired
    private MajorRepository majorRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private BlogRepository blogRepository;

    @GetMapping("/admin/statitic")
    public StatiticDto getStatitic(){
        StatiticDto s = new StatiticDto();
        s.setTotalMajor(majorRepository.total());
        s.setTotalAccount(userRepository.total());
        s.setTotalCourse(courseRepository.total());
        s.setTotalBlog(blogRepository.total());
        return s;
    }
}
