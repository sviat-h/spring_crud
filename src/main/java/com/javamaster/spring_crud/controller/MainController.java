package com.javamaster.spring_crud.controller;

import com.javamaster.spring_crud.dto.UserDto;
import com.javamaster.spring_crud.model.Gavno;
import com.javamaster.spring_crud.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

private final UserService userService;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {

        String message = "Hello Spring Boot + JSP";

        model.addAttribute("message", message);

        return "index";
    }

    @RequestMapping(value = {"/personList"}, method = RequestMethod.GET)
    public String viewPersonList(Model model) {

        List<UserDto> persons = userService.findAll();

        model.addAttribute("persons", persons);

        return "personList";
    }

    @RequestMapping(value = {"/gavnoList"}, method = RequestMethod.GET)
    public String viewGavnoList(Model model) {

        List<Gavno> gavnos = List.of(new Gavno("ah", "sadf", "asdf"), new Gavno("ah", "sadf", "asdf"), new Gavno("ah", "sadf", "asdf"));

        model.addAttribute("gavnos", gavnos);

        return "gavnoList";
    }

}
