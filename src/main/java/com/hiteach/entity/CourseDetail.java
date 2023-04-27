package com.hiteach.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "course_detail")
@Getter
@Setter
public class CourseDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String content;

    private Timestamp createdDate;

    private String imageBanner;

    private String linkVideo;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;


}
