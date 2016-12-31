package com.spring.nhn;

import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;

import com.spring.nhn.model.NHNModel;
import com.spring.nhn.service.NHNService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NHNController {
	
	private static final Logger logger = LoggerFactory.getLogger(NHNController.class);
	@Autowired
	private NHNService _nhnService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale, RequestMethod.GET);

		model.addAttribute("commentList", this._nhnService.getCommentList());
		return "home";
	}
	
	/*email password check*/
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String insertData(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale, RequestMethod.POST);

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String content = request.getParameter("content");

		boolean check_ok = check_regex(email, password);
		if(check_ok){
			NHNModel comment = new NHNModel(email, password, content);
			this._nhnService.insertData(comment);	
		}		
		
		model.addAttribute("commentList", this._nhnService.getCommentList());
		return "goHome";
	}
	
	@RequestMapping(value = "/modifyComment", method = RequestMethod.GET)
	public String modifyComment(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale, RequestMethod.GET);
		String index = request.getParameter("index");
		model.addAttribute("getNthData", this._nhnService.getNthData(index));
		return "modifyComment";
	}


	@RequestMapping(value = "/modification", method = RequestMethod.POST)
	public String modification(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale, RequestMethod.POST);
		String index = request.getParameter("index");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		
		List<NHNModel> nthData = this._nhnService.getNthData(index);
		String originPassword = nthData.get(0).getPassword();
		boolean pass_equal = originPassword.equals(password);
		
		if(!pass_equal){
			return "notequal";
		}
		
		boolean regex_ok = check_regex(email, password);
		if(regex_ok){
			NHNModel comment = new NHNModel(email, password, content);
			this._nhnService.deleteData(index);
			this._nhnService.insertData(comment);
		}		
		
		model.addAttribute("commentList", this._nhnService.getCommentList());
		return "goHome";
	}
	
	private boolean check_regex(String email, String password) {
		Pattern emailPattern = Pattern.compile("[0-9a-zA-Z][0-9a-zA-Z]*@[0-9a-zA-Z][0-9a-zA-Z]*.[a-zA-Z]{2,3}");
		Pattern passwordPattern = Pattern.compile("[0-9a-zA-Z]{6}[0-9a-zA-Z]*");
		Matcher emailMatcher = emailPattern.matcher(email);
		Matcher passwordMatcher = passwordPattern.matcher(password);
		
		if (emailMatcher.matches() && passwordMatcher.matches()) {
			return true;
		}
		
		return false;
	}
	
}
