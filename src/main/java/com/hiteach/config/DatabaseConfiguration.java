package com.hiteach.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = {"com.hiteach.repository"})
@EnableTransactionManagement
public class DatabaseConfiguration {
}
