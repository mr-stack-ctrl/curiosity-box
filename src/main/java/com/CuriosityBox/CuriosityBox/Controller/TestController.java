package com.CuriosityBox.CuriosityBox.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
@RestController
@RequestMapping("/")
public class TestController {


    // This is the testing cotroller
     @CrossOrigin(origins = "*")
    @GetMapping(path = "/hi")
    public String hi(){
        return "Hi Guys";
    }
}
