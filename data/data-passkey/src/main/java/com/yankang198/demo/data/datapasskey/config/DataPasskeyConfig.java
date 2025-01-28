package com.yankang198.demo.data.datapasskey.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableAutoConfiguration
@EnableJpaRepositories(basePackages = DataPasskeyConfig.PACKAGE_NAME + ".repository")
@EntityScan(basePackages = DataPasskeyConfig.PACKAGE_NAME + ".entity")
@ComponentScan(basePackages = DataPasskeyConfig.PACKAGE_NAME)
@PropertySource("classpath:passkey-mysql-dev.properties") // Load the properties file
public class DataPasskeyConfig {
    protected static final String PACKAGE_NAME = "com.yankang198.demo.data.datapasskey";
}