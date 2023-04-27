package com.hiteach.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "blog")
@Getter
@Setter
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String title;

    private String description;

    private String content;

    private Date createdDate;

    private String imageBanner;

    private Integer views;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
