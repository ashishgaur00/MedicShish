package com.medic.MainController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.medic.LoginPojo.EmptyVO;
import com.medic.LoginPojo.Login;
import com.medic.LoginPojo.SearchVO;

@Controller
public class MainLoginController {
	

	
	@RequestMapping("/")
	public ModelAndView firstView() 
	{ 
	    ModelAndView mav = new ModelAndView("index");  
	   //where index is  the jsp page name which is being requested. 
	    mav.addObject("FirmName", "ABC Welcomes you !"); 
	    mav.addObject("login", new Login());
	    return mav; 
	} 
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
	  @ModelAttribute("login") Login login) {
	    ModelAndView mav = null;

	    //User user = userService.validateUser(login);

	   // if (null != user) {
	    mav = new ModelAndView("dashBord");
	   // mav.addObject("firstname", user.getFirstname());
	 //   } else {
	  //  mav = new ModelAndView("login");
	    mav.addObject("message", "Username or Password is wrong!!");
	   // }
	    return mav;
	  }
	
	
	
	
	
		
		

}
