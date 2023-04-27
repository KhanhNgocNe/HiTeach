package com.hiteach.rest;

import com.hiteach.entity.Blog;
import com.hiteach.entity.Comment;
import com.hiteach.entity.User;
import com.hiteach.repository.CommentRepository;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class CommentRest {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserService userService;

    @PostMapping("/userteacher/addComment")
    public void save(@RequestBody Comment comment){
        comment.setCreatedDate(new Date(System.currentTimeMillis()));
        comment.setUser(userService.getUserWithAuthority());
        commentRepository.save(comment);
    }

    @DeleteMapping("/userteacher/deleteComment")
    public void delete(@RequestParam("id") Long id){
        commentRepository.deleteById(id);
    }

    @GetMapping("/public/findCommentByCourseId")
    public List<Comment> findByCourseId(@RequestParam("id") Long id){
        List<Comment> list = commentRepository.findByCourseId(id);
        try {
            User user = userService.getUserWithAuthority();
            for(Comment c: list){
                if(c.getUser().getId() == user.getId()){
                    c.setDeleted(1);
                }
            }
        }
        catch (Exception e){
            return list;
        }
        return list;
    }
}
