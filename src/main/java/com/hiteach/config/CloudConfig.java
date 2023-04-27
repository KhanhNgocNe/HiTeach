package com.hiteach.config;

import com.cloudinary.Cloudinary;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
@SpringBootApplication
public class CloudConfig {
    @Bean
    public Cloudinary cloudinaryConfigs() {
        Cloudinary cloudinary = null;
        Map config = new HashMap();
        config.put("cloud_name", "dmhjrwkme");
        config.put("api_key", "289454618537929");
        config.put("api_secret", "kkau2b2LobGNGV4S9AxFWMeRob8");
        cloudinary = new Cloudinary(config);
        return cloudinary;
    }
}
