/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.mvc;

import com.google.gson.Gson;
import com.icip.core.model.ContactUsModel;
import com.icip.core.user.ICIPUser;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author icipmac
 */
@Controller
@RequestMapping("/sendemail")
public class SendEmailController {

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = {"/feedback"}, method = RequestMethod.POST)
    public void welcomestring(HttpServletRequest request, HttpServletResponse response) {
//        System.out.println("feedback in sendEmailController.java " + request.getParameter("userName"));
        // takes input from e-mail form
        String recipientAddress = "info@climateireland.ie";
        //request.getParameter("recipient");
        String subject = request.getParameter("userName");
        String safeSubject = Jsoup.clean(subject, Whitelist.basic());

        String message = request.getParameter("feedback");
        String safeMessage = Jsoup.clean(message, Whitelist.basic());

        String issue = request.getParameter("userIssue");
        String safeIssue = Jsoup.clean(issue, Whitelist.basic());

        String usersEmail = request.getParameter("userEmail");
        String safeEmail = Jsoup.clean(usersEmail, Whitelist.basic());

        safeMessage += System.getProperty("line.separator");
        safeMessage += "Issue Type: " + safeIssue;
        safeMessage += System.getProperty("line.separator");
        safeMessage += safeSubject;
        safeMessage += System.getProperty("line.separator");
        safeMessage += "Sender email: " + safeEmail;

        // prints debug info
        //System.out.println("To: " + recipientAddress);
        //System.out.println("Subject: " + safeEmail);
        //System.out.println("Message: " + safeMessage);
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setFrom(recipientAddress);
        email.setTo(recipientAddress);
        email.setSubject(safeEmail);
        email.setText(safeMessage);

        // sends the e-mail
        mailSender.send(email);

        //   return "all fine";
    }

    @RequestMapping(value = {"/contactUs"}, method = RequestMethod.POST)
    public ResponseEntity<?> contactUs(@RequestBody String model) {
//        ,@RequestParam name, @RequestParam email
//            @RequestParam String userEmail,
//            @RequestParam String comment
        System.out.println("contactUs ");
        System.out.println("contactUs " + model);
        Gson gson = new Gson();
//        ContactUsModel contact2 = new ContactUsModel("Hello");
//        String json = gson.toJson(contact2);
        ContactUsModel contact = gson.fromJson(model, ContactUsModel.class);
        System.out.println("contactUs ");

        System.out.println("userName " + contact.getUserName());
        System.out.println("userEmail " + contact.getUserEmail());
        System.out.println("comment " + contact.getComment());

        // takes input from e-mail form
        String recipientAddress = "dev@climateireland.ie";
        String userName = contact.getUserName();
        String comment = contact.getUserEmail();
        String userEmail = contact.getComment();

        System.out.println("contactUs in sendEmailController.java " + userEmail + " userID: " + userName);
//        String userName = request.getParameter("userName");
//        String comment = request.getParameter("comment");
//        String userEmail = request.getParameter("userEmail");

//        System.out.println("contactUs in sendEmailController.java " + userEmail + " userID: " + userName);
//        String recipientAddress = "mhashemi_shz@yahoo.com";
        //request.getParameter("recipient");
        String subject = userName;
        String safeSubject = Jsoup.clean(subject, Whitelist.basic());

        String message = comment;
        String safeMessage = Jsoup.clean(message, Whitelist.basic());

//        String issue = request.getParameter("userIssue");
//        String safeIssue = Jsoup.clean(issue, Whitelist.basic());
        String usersEmail = userEmail;
        String safeEmail = Jsoup.clean(usersEmail, Whitelist.basic());

        safeMessage += System.getProperty("line.separator");
//        safeMessage += "Issue Type: " + safeIssue;
//        safeMessage += System.getProperty("line.separator");
        safeMessage += safeSubject;
        safeMessage += System.getProperty("line.separator");
        safeMessage += "Sender email: " + safeEmail;

        // prints debug info
        //System.out.println("To: " + recipientAddress);
        //System.out.println("Subject: " + safeEmail);
        //System.out.println("Message: " + safeMessage);
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setFrom(recipientAddress);
        email.setTo(recipientAddress);
        email.setSubject(safeEmail);
        email.setText(safeMessage);

        // sends the e-mail
        mailSender.send(email);
        System.out.println("Done.");
        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = {"/contactUs2"}, method = RequestMethod.POST)
    public void contactUs2(HttpServletRequest request, HttpServletResponse response) {

        // takes input from e-mail form
        String recipientAddress = "info@climateireland.ie"; 
//        String userName = request.getParameter("userName");
//        String comment = request.getParameter("comment");
//        String userEmail = request.getParameter("userEmail");

//        System.out.println("contactUs in sendEmailController.java " + userEmail + " userID: " + userName);
//        String recipientAddress = "mhashemi_shz@yahoo.com";
        //request.getParameter("recipient");
        String subject = request.getParameter("userName");
        String safeSubject = Jsoup.clean(subject, Whitelist.basic());

        String message = request.getParameter("comment");
        String safeMessage = Jsoup.clean(message, Whitelist.basic());

//        String issue = request.getParameter("userIssue");
//        String safeIssue = Jsoup.clean(issue, Whitelist.basic());
        String usersEmail = request.getParameter("userEmail");
        String safeEmail = Jsoup.clean(usersEmail, Whitelist.basic());

        safeMessage += System.getProperty("line.separator");
//        safeMessage += "Issue Type: " + safeIssue;
//        safeMessage += System.getProperty("line.separator");
        safeMessage += safeSubject;
        safeMessage += System.getProperty("line.separator");
        safeMessage += "Sender email: " + safeEmail;

        // prints debug info
        //System.out.println("To: " + recipientAddress);
        //System.out.println("Subject: " + safeEmail);
        //System.out.println("Message: " + safeMessage);
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setFrom(recipientAddress);
        email.setTo(recipientAddress);
        email.setSubject(safeEmail);
        email.setText(safeMessage);

        // sends the e-mail
        mailSender.send(email);

        //   return "all fine";
    }
}
