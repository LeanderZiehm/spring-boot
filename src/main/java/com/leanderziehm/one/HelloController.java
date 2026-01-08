package com.leanderziehm.one;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
public class HelloController {

    @GetMapping
    public String helloGet() {
        return "Hello from GET!";
    }

    @PostMapping
    public String helloPost(@RequestBody String name) {
        return "Hello " + name + " from POST!";
    }
}