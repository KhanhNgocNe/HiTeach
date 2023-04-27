package com.hiteach.rest;

import com.hiteach.entity.Major;
import com.hiteach.entity.MajorInterest;
import com.hiteach.entity.User;
import com.hiteach.repository.MajorInterestRepository;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class MajorInterestRest {

    @Autowired
    private MajorInterestRepository majorInterestRepository;

    @Autowired
    private UserService userService;

    @GetMapping("/userteacher/majorinterests")
    public List<MajorInterest> findByUserId(){
        User user = userService.getUserWithAuthority();
        return majorInterestRepository.findByUserId(user.getId());
    }

    @PostMapping("/userteacher/addInterest")
    public void addOrUpdate(@RequestBody List<Major> majorList){
        User user = userService.getUserWithAuthority();
        majorInterestRepository.deleteByUserId(user.getId());
        for(Major m : majorList){
            MajorInterest majorInterest = new MajorInterest();
            majorInterest.setMajor(m);
            majorInterest.setUser(user);
            majorInterestRepository.save(majorInterest);
        }
    }
}
