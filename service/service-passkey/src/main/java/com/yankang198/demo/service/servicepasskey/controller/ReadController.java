package com.yankang198.demo.service.servicepasskey.controller;

import com.yankang198.demo.data.datapasskey.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ReadController {

    private final UserRepository userRepository;

    @GetMapping("/hello/{name}")
    public String sayHello(@PathVariable String name) {
        return userRepository.findByUserName("john_doe").get().getPhoneNumber();
    }
}
