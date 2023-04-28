# HiTeach Finding Course and Tutor Online system

This is an educational website to provide online courses and connect learners with teachers, I designed and built this system for students to easily find courses and reduce unemployment for tutors. With this system, students can interact with tutors and learn more effectively

## Installation

Download source code on GitHub

```bash
  git clone 'url'
  cd HiTeach
```

Install IntelliJ IDEA
```bash
  install mvn
  port: 8080
```


Set up Database
```bash
    spring.datasource.url=jdbc:mysql://localhost:3307/hiteach
    spring.datasource.username=root
    spring.datasource.password=
```

## Roles

This project is used by the following roles:

- The student: register the course,login,...
- The teacher: upload course, confirm the student registered the course,..
- The administrator: manage user, course, ...


![Logo](https://github.com/KhanhNgocNe/HiTeach/blob/main/src/main/resources/static/img/wpf-favicon.png)


## Version

**Java:** above 8

**Spring Boot:** 2.7.4

**Database:** MySQL 5.2.0

**Cloudinary:** 1.17.0

**Spring Security:** 5.7.1
## Account For Role

| Role | Username     | Password                |
| :-------- | :------- | :------------------------- |
| student | andynn | 123456 |
| student | khanhngoc | 123456 |
| teacher | jame | 123456 |
| teacher | tungtt | 123456 |
| admin | admin | admin |
