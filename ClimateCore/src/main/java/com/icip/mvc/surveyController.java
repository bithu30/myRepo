package com.icip.mvc;

import com.icip.core.service.ICIPSurveyGelService;
import com.icip.core.survey.ICIPSurveyGel;
import com.icip.core.survey.ICIPSurveyHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yingwu on 19/08/2014.
 */


@Controller
@RequestMapping("/survey")
public class surveyController
{

    @Autowired
    private ICIPSurveyGelService iCIPSurveyGelService; 
    
    @RequestMapping(value="gel", method = RequestMethod.POST)
    public @ResponseBody
    String surveyGel(HttpServletRequest request, HttpServletResponse response)
    {
        String userID= "1";
                //request.getParameter("userID"); // we dont need it for the time being will always default to 1
        
        String q1_1 = request.getParameter("q1_1");
        String safeq1_1 = Jsoup.clean(q1_1, Whitelist.basic());
        
        String q1_2 = request.getParameter("q1_2");
        String safeq1_2 = Jsoup.clean(q1_2, Whitelist.basic());
        
        String q1_3 = request.getParameter("q1_3");
        String safeq1_3 =Jsoup.clean(q1_3, Whitelist.basic());
        
        String q1_4 = request.getParameter("q1_4");
        String safeq1_4 = Jsoup.clean(q1_4, Whitelist.basic());
        
        String q1_5 = request.getParameter("q1_5");
        String safeq1_5 = Jsoup.clean(q1_5, Whitelist.basic());
        
        String q1_6 = request.getParameter("q1_6");
        String safeq1_6 = Jsoup.clean(q1_6, Whitelist.basic());
        
        String q2 = request.getParameter("q2");
        String safeq2 = Jsoup.clean(q2, Whitelist.basic());
        
        String q3 = request.getParameter("q3");
        String safeq3 = Jsoup.clean(q3, Whitelist.basic());
        
        String q4 = request.getParameter("q4");
        String safeq4 = Jsoup.clean(q4, Whitelist.basic());
        
        String q5_1 = request.getParameter("q5_1");
        String safeq5_1 = Jsoup.clean(q5_1, Whitelist.basic());
        
        String q5_2 = request.getParameter("q5_2");
        String safeq5_2 = Jsoup.clean(q5_2, Whitelist.basic());
        
        String q5_3 = ""; 
                //request.getParameter("q5_3");
        
        
        String q5_4 = request.getParameter("q5_4");
        String safeq5_4 = Jsoup.clean(q5_4, Whitelist.basic());
        
        String q6 = request.getParameter("q6");
        String safeq6 = Jsoup.clean(q6, Whitelist.basic());
        
        String q7 = request.getParameter("q7_1");
        String safeq7 = Jsoup.clean(q7, Whitelist.basic());
        
        String q8 = ""; 
                //request.getParameter("q8");
        //String safeq8 = Jsoup.clean(q8, Whitelist.basic());
        
        String usersEmail = request.getParameter("usersEmail");
        String safeusersEmail = Jsoup.clean(usersEmail, Whitelist.basic());
        
        String usersSector = request.getParameter("userSector");
        String safeusersSector = Jsoup.clean(usersSector, Whitelist.basic());
        

        if(userID!=null)
        {
            ICIPSurveyGel sg=new ICIPSurveyGel(Integer.valueOf(1), 
                    safeq1_1, 
                    safeq1_2, 
                    safeq1_3, 
                    safeq1_4, 
                    safeq1_5, 
                    safeq1_6, 
                    safeq2, 
                    safeq3, 
                    safeq4, 
                    safeq5_1, 
                    safeq5_2, 
                    q5_3, 
                    safeq5_4, 
                    safeq6, 
                    safeq7, 
                    q8,
                    safeusersEmail,
                    safeusersSector);
            //ICIPSurveyHandler.addICIPSurvey(sg);
            this.iCIPSurveyGelService.createSurvey(sg);
       }

        //return userID+q1_1+q1_2+q1_3+q1_4+q1_5+q1_6+q2+q3+q4+q5_1+q5_2+q5_3+q5_4+q6;
        return "1";
    }




}
