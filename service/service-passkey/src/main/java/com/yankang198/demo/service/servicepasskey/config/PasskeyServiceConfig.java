package com.yankang198.demo.service.servicepasskey.config;

import com.yankang198.demo.data.datapasskey.config.DataPasskeyConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(DataPasskeyConfig.class)
public class PasskeyServiceConfig {
}
