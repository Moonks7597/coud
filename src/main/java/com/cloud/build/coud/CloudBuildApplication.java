package com.cloud.build.coud;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class CloudBuildApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudBuildApplication.class, args);
        System.out.println("Hello World!");
        log.info("Hello World!");
    }

}
