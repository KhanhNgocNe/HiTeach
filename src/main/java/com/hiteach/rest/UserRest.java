package com.hiteach.rest;

import com.hiteach.dto.CustomUserDetails;
import com.hiteach.dto.PageTeacher;
import com.hiteach.entity.User;
import com.hiteach.jwt.JwtTokenProvider;
import com.hiteach.repository.CourseRepository;
import com.hiteach.repository.UserRepository;
import com.hiteach.service.MailService;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class UserRest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CourseRepository courseRepository;

    @PostMapping("/authenticate")
    public ResponseEntity<String> authenticate(@RequestBody User user) throws URISyntaxException {
        Optional<User> users = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
        System.out.println(users);
        if(users.isPresent() == false){
            return ResponseEntity.status(401)
                    .body(null);
        }
        CustomUserDetails customUserDetails = new CustomUserDetails(users.get());
        String token = jwtTokenProvider.generateToken(customUserDetails);
        return ResponseEntity
                .created(new URI("/api/authen/" ))
                .body(token);
    }

    @PostMapping("/all/userlogged")
    public User getUserLogged(){
        return userService.getUserWithAuthority();
    }

    @PostMapping("/register")
    public ResponseEntity<Integer> save(@RequestBody User user) throws URISyntaxException {
        if(userService.checkEmailexist(user.getEmail())){
            HttpHeaders headers = new HttpHeaders();
            headers.add("Email already exist ", user.getEmail());
            return ResponseEntity.status(300).headers(headers)
                    .body(1);
        }
        else if(userRepository.findByUsername(user.getUsername()).isPresent() == true){
            HttpHeaders headers = new HttpHeaders();
            return ResponseEntity.status(500).headers(headers)
                    .body(2);
        }
        User result = userService.save(user);
        System.out.println(result);
        mailService.sendEmail(user.getEmail(), "Active account hiteach website","click to this link: http://localhost:8080/keyactive?key="+result.getActivation_key(),false, false);
        return ResponseEntity
                .created(new URI("/api/save/" + result.getId()))
                .body(0);
    }

    @PostMapping("/userteacher/changePassword")
    public void changePassword(@RequestParam("old") String oldPass, @RequestParam("new") String newPass) throws Exception {
        User user = userService.getUserWithAuthority();
        if(passwordEncoder.matches(oldPass, user.getPassword())){
            user.setPassword(passwordEncoder.encode(newPass));
        }
        else{
            throw new Exception("Password incorrect");
        }
        userRepository.save(user);
    }

    @PostMapping("/admin/changePassword")
    public void changePasswordadmin(@RequestParam("old") String oldPass, @RequestParam("new") String newPass) throws Exception {
        User user = userService.getUserWithAuthority();
        if(passwordEncoder.matches(oldPass, user.getPassword())){
            user.setPassword(passwordEncoder.encode(newPass));
        }
        else{
            throw new Exception("Password incorrect");
        }
        userRepository.save(user);
    }

    @PostMapping("/resetpass")
    public ResponseEntity<String> resetPassword(@RequestBody String email) throws URISyntaxException {
        Optional<User> user = userRepository.getUserByEmail(email);
        if(user.isPresent() == false){
            return ResponseEntity.status(500)
                    .body("This email not exist");
        }
        else{
            String newPass = userService.randomPass();
            User users = user.get();
            users.setPassword(passwordEncoder.encode(newPass));
            userRepository.save(users);
            mailService.sendEmail(email,"reset your password","Your new password: "+newPass,false, false);
        }
        return ResponseEntity.status(200)
                .body("check your email");
    }


    @PostMapping("/userteacher/changeInfor")
    public User changeInfor(@RequestBody User user) throws URISyntaxException {
        User u = userService.getUserWithAuthority();
        u.setEmail(user.getEmail());
        u.setAvatar(user.getAvatar());
        u.setPhone(user.getPhone());
        u.setFullname(user.getFullname());
        u.setDescription(user.getDescription());
        User user1 = userRepository.save(u);
        return user1;
    }

    @PostMapping("/admin/changeInfor")
    public User changeInforAdmin(@RequestBody User user) throws URISyntaxException {
        User u = userService.getUserWithAuthority();
        u.setEmail(user.getEmail());
        u.setAvatar(user.getAvatar());
        u.setPhone(user.getPhone());
        u.setFullname(user.getFullname());
        User user1 = userRepository.save(u);
        return user1;
    }

    @GetMapping("/admin/getUserNotAdmin")
    public List<User> getUserNotAdmin() {
        return userRepository.findUserNotAdmin("ROLE_ADMIN");
    }

    @GetMapping("/admin/getUserBySelect")
    public List<User> getUserBySelect(@RequestParam("role") String role) {
        return userRepository.findUserBySelect(role);
    }

    @PostMapping("/admin/activeUser")
    public void activeOrUnactiveUser(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        if(user.getActived() == 1){
            user.setActived(0);
        }
        else{
            user.setActived(1);
        }
        userRepository.save(user);
    }

    @GetMapping("admin/checkroleAdmin")
    public void checkroleAdmin(){
        System.out.println("admin");
    }

    @GetMapping("user/checkroleUser")
    public void checkroleUser(){
        System.out.println("user");
    }

    @GetMapping("teacher/checkroleTeacher")
    public void checkroleTeacher(){
        System.out.println("teacher");
    }


    @GetMapping("/admin/getUserNotAdminThisMonth")
    public List<User> getUserNotAdminThisMonth() {
        String date = new Date(System.currentTimeMillis()).toString();
        return userRepository.findUserNotAdminThisMonth("ROLE_ADMIN",Integer.valueOf(date.split("-")[1]), Integer.valueOf(date.split("-")[0]));
    }

    @GetMapping("/public/getAllTeacher")
    public PageTeacher getAllTeacher(@RequestParam("size") Integer size, @RequestParam("page") Integer papge, @RequestParam("search") String search) {
        Integer totalTeacher = userRepository.totalTeacher("ROLE_TEACHER");
        Integer totalPage = 1;
        if(totalTeacher % size == 0){
            totalPage = totalTeacher / size;
        }
        else{
            totalPage = (totalTeacher / size) + 1;
        }
        PageTeacher pageTeacher = new PageTeacher();
        pageTeacher.setTotalPage(totalPage);
        List<User> users = userRepository.getAllTeacher("ROLE_TEACHER",size, papge, "%"+search+"%");
        for(User u : users){
            u.setTotalCourse(courseRepository.totalCourse(u.getId()));
        }
        pageTeacher.setContent(users);
        return pageTeacher;
    }


    @GetMapping("/public/teacherById")
    public User getUserByID(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        user.setPassword(null);
        return user;
    }

    @GetMapping("/public/findUserNotDtoById")
    public User findUserById(@RequestParam("id") Long id) {
        return userRepository.findById(id).get();
    }

}
