package com.hiteach.rest;


import com.hiteach.entity.Blog;
import com.hiteach.entity.Major;
import com.hiteach.repository.MajorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class MajorRest {

    @Autowired
    private MajorRepository majorRepository;

    @PostMapping("/admin/addOrUpdateMajor")
    public void save(@RequestBody Major major){
        System.out.println("img: "+major);
        majorRepository.save(major);
    }

    @GetMapping("/public/allMajor")
    public List<Major> findAll(){
        return majorRepository.findAll();
    }

    @GetMapping("/public/allMajorByParam")
    public List<Major> allMajorByParam(@RequestParam("search") String search){
        return majorRepository.allByParam("%"+search+"%");
    }

    @GetMapping("/public/majorById")
    public Major findById(@RequestParam("id") Long id){
        return majorRepository.findById(id).get();
    }

    @DeleteMapping("/admin/deleteMajor")
    public void deleteCategory(@RequestParam("id") Long id){
        majorRepository.deleteById(id);
    }

}
