package com.hiteach.dto;

import com.hiteach.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PageTeacher {
    private Integer totalPage;

    private List<User> content;
}
