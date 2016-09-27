package com.icip.mvc;

import com.icip.core.feedback.ICIPFeedback;
import com.icip.core.service.ClimateFeedbackService;
import com.icip.core.service.ClimateUserService;
import com.icip.core.user.ICIPUser;
import com.icip.utils.Encipher;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.UUID;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/user")
public class userController {

    @Autowired
    private ClimateFeedbackService climateFeedbackService;

    @Autowired
    private ClimateUserService climateUserService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "submitFeedback", method = RequestMethod.POST)
    public ResponseEntity<?> submitFeedback(HttpServletRequest request, HttpServletResponse response) {

        String feedbackValue = request.getParameter("feedbackValue");
        String userID = request.getParameter("userID");
        String url = request.getParameter("url");

        //System.out.println("submitFeedback in userController.java " + feedbackValue + " userID: " + userID+ " url: " + url);
        ICIPFeedback feedbackObj = new ICIPFeedback(Integer.parseInt(userID), url, Integer.parseInt(feedbackValue));
//        if(ICIPUserHandler.addICIPUser(user)==1)
//        {
//            return user;
//        }

        if (this.climateFeedbackService.createFeedback(feedbackObj).getFeedbackID() > 0) {
            return new ResponseEntity<String>("Done", HttpStatus.OK);
        }

        return new ResponseEntity<String>("submitFeedback has failed. Please try agian...", HttpStatus.BAD_REQUEST);

//        return new ResponseEntity<String>("submitFeedback", HttpStatus.OK);
    }

//    @RequestMapping(value = "login", method = RequestMethod.GET)
//    public ResponseEntity<?> loginGet(HttpServletRequest request, HttpServletResponse response) {
//        System.out.println("loginGet in userController.java");
//        return new ResponseEntity<String>("Mohammad", HttpStatus.OK);
//    }
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ResponseEntity<?> register(@RequestBody ICIPUser user) {
        System.out.println("register user " + user.getEmail() + " Pass: " + user.getPassword()
                + " fname " + user.getFirstName() + " lname: " + user.getLastName()
                + " sector " + user.getSector() + " reason: " + user.getReason()
                + " orga " + user.getOrganization());

        ICIPUser u = this.climateUserService.findByEmail(user.getEmail());

        if (u != null) {
            System.out.println("user found " + u.getEmail());
            this.climateUserService.deleteUser(u);
            return new ResponseEntity<String>(HttpStatus.CONFLICT);  

        } 
        else 
        {
            System.out.println("user not found " + user.getEmail());
            if (this.climateUserService.createUser(user).getUserID() > 0) {
                return new ResponseEntity<ICIPUser>(user, HttpStatus.OK);
            }
        }
        return new ResponseEntity<String>("Registration has failed. Please try agian...", HttpStatus.BAD_REQUEST);
//            return new ResponseEntity<ICIPUser>(HttpStatus.NOT_FOUND);

    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ResponseEntity<ICIPUser> login(@RequestBody ICIPUser user) {
        System.out.println("login " + user.getEmail() + " Pass: " + user.getPassword());

        ICIPUser u = this.climateUserService.findByEmail(user.getEmail());
        if (u != null) {
            System.out.println("user found " + u.getFirstName());
            return new ResponseEntity<ICIPUser>(u, HttpStatus.OK);

        } else {
            System.out.println("user not found " + user.getEmail());
            return new ResponseEntity<ICIPUser>(HttpStatus.NOT_FOUND);

        }

//        if ((user.getEmail().equals("barryyw")) && (user.getPassword().equals("icip"))) {
//            ICIPUser tmpUser = new ICIPUser(-10, "b.odwyer@ucc.ie", "Barry", "Odwyer");
//            tmpUser.setPassword("icip");
//            return new ResponseEntity<ICIPUser>(tmpUser, HttpStatus.OK);
//        }
////        if (userService.isUserExist(user)) {
////            System.out.println("A User with name " + user.getUsername() + " already exist");
////            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
////        }
////  
////        userService.saveUser(user);
////  
////        HttpHeaders headers = new HttpHeaders();
////        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
//        return new ResponseEntity<ICIPUser>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "login2", method = RequestMethod.POST)
    public ResponseEntity<?> login(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("login2 in userController.java");
        System.out.println(request.getAttributeNames().toString());
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email + " " + password);
//        if (email.equals("barryyw") && password.equals("icip")) {
//            return new ResponseEntity<ICIPUser>(new ICIPUser(-1, "b.odwyer@ucc.ie", "Barry", "Odwyer"), HttpStatus.OK);
//        }
//
//        ICIPUser u= ICIPUserHandler.searchICIPUser(email);
        ICIPUser u = this.climateUserService.findByEmail(email);
        if (u != null) {
            if (Encipher.DecodePasswd(u.getPassword()).equals(password) && u.getStatus() == 1) {
//                u.setPassword("");
//                u.setFirstName("Mohammad");
                return new ResponseEntity<ICIPUser>(u, HttpStatus.OK);
            }
//
        }
//        else
//        {
//            return new ResponseEntity<ICIPUser>(new ICIPUser(-1, "localhost@climateireland.ie", "Local", "Test"), HttpStatus.OK);
//        }

//        if(u!=null)
//        {
//            if(Encipher.DecodePasswd(u.getPassword()).equals(password) && u.getStatus()==1)
//            {
//                u.setPassword("");
//                return u;
//            }
//        }
//
//        return null;
        return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
    }

    @RequestMapping(value = "resetPassword", method = RequestMethod.POST)
    public ResponseEntity<?> resetPassword(HttpServletRequest request, HttpServletResponse response) {

        String email = request.getParameter("email");
        ICIPUser user = this.climateUserService.findUserByName(email);
        if (user == null) {
            new ResponseEntity<String>("User doesn't exist", HttpStatus.BAD_REQUEST);
        }
        UUID idOne = UUID.randomUUID();
        String emailPass = idOne.toString().substring(0, 7);
        String newPass = Encipher.EncodeString(emailPass);
        user.setPassword(newPass);
        this.climateUserService.updateUserPassword(user);

        // send email
        SimpleMailMessage emailC = new SimpleMailMessage();
        emailC.setFrom("info@climateireland.ie");
        emailC.setTo(email);
        emailC.setSubject("Climate Ireland Password Reset");
        emailC.setText("New Password: " + emailPass);

        // sends the e-mail
        mailSender.send(emailC);

        return new ResponseEntity<ICIPUser>(user, HttpStatus.OK);

    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ResponseEntity<?> add(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");

        // ICIPUser u = this.climateUserService.findUserByName(email);  
        ICIPUser u = this.climateUserService.findByEmail(email);
        if (u != null) {
            new ResponseEntity<String>("User already exist", HttpStatus.BAD_REQUEST);
        }

        String password = request.getParameter("password");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String sector = request.getParameter("sector");
        String organisation = request.getParameter("organisation");
        String reasons = request.getParameter("reasons");

        System.out.println("register user " + email + " Pass: " + password
                + " fname " + firstName + " lname: " + lastName + " sector: " + sector
        + " organisation: " + organisation
        + " reasons: " + reasons);
        ICIPUser user = new ICIPUser(email, password, firstName, lastName, sector, organisation, reasons);
//        if(ICIPUserHandler.addICIPUser(user)==1)
//        {
//            return user;
//        }

        if (this.climateUserService.createUser(user).getUserID() > 0) {
            return new ResponseEntity<ICIPUser>(user, HttpStatus.OK);
        }

        return new ResponseEntity<String>("Registration has failed. Please try agian...", HttpStatus.BAD_REQUEST);
    }

}
