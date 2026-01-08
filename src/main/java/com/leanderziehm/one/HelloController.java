package com.leanderziehm.one;


// import io.swagger.v3.oas.annotations.Operation;
// import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
// @Tag(name = "Hello API", description = "Simple hello GET and POST endpoints")
public class HelloController {

    @GetMapping
    // @Operation(summary = "Say hello via GET")
    public String helloGet() {
        return "Hello from GET!";
    }

    @PostMapping
    // @Operation(summary = "Say hello via POST")
    public String helloPost(@RequestBody String name) {
        return "Hello " + name + " from POST!";
    }
}