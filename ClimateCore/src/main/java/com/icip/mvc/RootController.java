package com.icip.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class RootController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

		return "hello";
	}
}