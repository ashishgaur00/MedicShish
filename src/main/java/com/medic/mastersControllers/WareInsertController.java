package com.medic.mastersControllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wareInsertController")
public class WareInsertController {

    @RequestMapping("/create")
    public ModelAndView create(){

        ModelAndView returnedPage = new ModelAndView("wareInsertCreate");
        return returnedPage;

    }

}
