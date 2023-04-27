package com.hiteach.rest;

import com.hiteach.entity.Blog;
import com.hiteach.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class BlogRest {

    @Autowired
    private BlogRepository blogRepository;

    @PostMapping("/admin/addOrUpdateBlog")
    public void save(@RequestBody Blog blog){
        if(blog.getId() == null){
            blog.setCreatedDate(new Date(System.currentTimeMillis()));
            blog.setViews(0);
        }
        else{
            Blog b = blogRepository.findById(blog.getId()).get();
            blog.setCreatedDate(b.getCreatedDate());
            blog.setViews(b.getViews());
            if(blog.getImageBanner() == null){
                blog.setImageBanner(b.getImageBanner());
            }
        }
        blogRepository.save(blog);
    }

    @GetMapping("/public/allBlog")
    public List<Blog> findAll(){
        return blogRepository.findAllDesc();
    }

    @GetMapping("/public/blogById")
    public Blog findById(@RequestParam("id") Long id){
        return blogRepository.findById(id).get();
    }

    @GetMapping("/public/detailBlog")
    public Blog detailBlog(@RequestParam("id") Long id){
        Blog b = blogRepository.findById(id).get();
        b.setViews(b.getViews() + 1);
        blogRepository.save(b);
        return b;
    }

    @DeleteMapping("/admin/deleteBlog")
    public void deleteCategory(@RequestParam("id") Long id){
        blogRepository.deleteById(id);
    }

    @GetMapping("/public/allblogforuser")
    public Page<Blog> getAllBlog(@RequestParam(value = "search", required = false) String search ,Pageable pageable){
        if (search != null){
            System.out.println("search blog: "+search);
            return blogRepository.getAllBlogUserAndParam("%"+search+"%", pageable);
        }
        return blogRepository.getAllBlogUser(pageable);
    }

    @GetMapping("/public/getBlogTopView")
    public List<Blog> getBlogTopView(){
        return blogRepository.getBlogTopView();
    }
}
