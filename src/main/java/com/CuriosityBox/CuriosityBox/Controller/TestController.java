package com.CuriosityBox.CuriosityBox.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class TestController {

    @GetMapping(path = "/hi")
    public String hi(){
        return "Hi Guys";
    }
}
