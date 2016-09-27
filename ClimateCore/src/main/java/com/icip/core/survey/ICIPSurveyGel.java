package com.icip.core.survey;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by yingwu on 19/08/2014.
 */

@Entity(name = "SurveyGeneral")
@SequenceGenerator(name="survey_SEQ", sequenceName="survey_seq", initialValue=1, allocationSize=1)
public class ICIPSurveyGel implements Serializable
{
    private static final long serialVersionUID = 3984000735220523144L;

    public ICIPSurveyGel()
    {
    }

    public ICIPSurveyGel(int userID, String q1_1, String q1_2, 
            String q1_3, String q1_4, String q1_5, String q1_6, 
            String q2, String q3, String q4, String q5_1,
            String q5_2, String q5_3, String q5_4, String q6, String q7P, String q8P,
            String usersEmailP, String usersSectorP)
    {
        this.userID=userID;
        this.q1_1 = q1_1;
        this.q1_2 = q1_2;
        this.q1_3 = q1_3;
        this.q1_4 = q1_4;
        this.q1_5 = q1_5;
        this.q1_6 = q1_6;
        this.q2 = q2;
        this.q3 = q3;
        this.q4 = q4;
        this.q5_1 = q5_1;
        this.q5_2 = q5_2;
        this.q5_3 = q5_3;
        this.q5_4 = q5_4;
        this.q6 = q6;
        this.q7 = q7P;
        this.q8 = q8P;
        this.userEmail = usersEmailP;
        this.userSector = usersSectorP;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "survey_SEQ")
    private int surveyID;

    @Column(name = "userID", nullable = false, length = 20)
    private int userID;

    @Column(name = "q1_1", nullable = false, length = 20)
    String q1_1;

    @Column(name = "q1_2", nullable = false, length = 20)
    String q1_2;

    @Column(name = "q1_3", nullable = false, length = 20)
    String q1_3;

    @Column(name = "q1_4", nullable = false, length = 20)
    String q1_4;

    @Column(name = "q1_5", nullable = false, length = 20)
    String q1_5;

    @Column(name = "q1_6", nullable = false, length = 20)
    String q1_6;

    @Column(name = "q2", nullable = true, length = 2000)
    String q2  ;

    @Column(name = "q3", nullable = true, length = 2000)
    String q3  ;

    @Column(name = "q4", nullable = false, length = 40)
    String q4  ;

    @Column(name = "q5_1", nullable = false, length = 20)
    String q5_1;

    @Column(name = "q5_2", nullable = false, length = 20)
    String q5_2;

    @Column(name = "q5_3", nullable = true, length = 20)
    String q5_3;

    @Column(name = "q5_4", nullable = false, length = 20)
    String q5_4;

    @Column(name = "q6", nullable = true, length = 2000)
    String q6;
    
    @Column(name = "q7", nullable = true, length=20)
    String q7;
    
    @Column(name = "q8", nullable = true, length = 2000)
    String q8;
    
    @Column(name = "userEmail", nullable = true, length = 200)
    String userEmail;
    
    @Column(name = "userSector", nullable = true, length = 100)
    String userSector;

    public String getUserSector() {
        return userSector;
    }

    public void setUserSector(String userSector) {
        this.userSector = userSector;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getQ8() {
        return q8;
    }

    public void setQ8(String q8) {
        this.q8 = q8;
    }

    public String getQ7() {
        return q7;
    }

    public void setQ7(String q7) {
        this.q7 = q7;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getQ1_1() {
        return q1_1;
    }

    public void setQ1_1(String q1_1) {
        this.q1_1 = q1_1;
    }

    public String getQ1_2() {
        return q1_2;
    }

    public void setQ1_2(String q1_2) {
        this.q1_2 = q1_2;
    }

    public String getQ1_3() {
        return q1_3;
    }

    public void setQ1_3(String q1_3) {
        this.q1_3 = q1_3;
    }

    public String getQ1_4() {
        return q1_4;
    }

    public void setQ1_4(String q1_4) {
        this.q1_4 = q1_4;
    }

    public String getQ1_5() {
        return q1_5;
    }

    public void setQ1_5(String q1_5) {
        this.q1_5 = q1_5;
    }

    public String getQ1_6() {
        return q1_6;
    }

    public void setQ1_6(String q1_6) {
        this.q1_6 = q1_6;
    }

    public String getQ2() {
        return q2;
    }

    public void setQ2(String q2) {
        this.q2 = q2;
    }

    public String getQ3() {
        return q3;
    }

    public void setQ3(String q3) {
        this.q3 = q3;
    }

    public String getQ4() {
        return q4;
    }

    public void setQ4(String q4) {
        this.q4 = q4;
    }

    public String getQ5_1() {
        return q5_1;
    }

    public void setQ5_1(String q5_1) {
        this.q5_1 = q5_1;
    }

    public String getQ5_2() {
        return q5_2;
    }

    public void setQ5_2(String q5_2) {
        this.q5_2 = q5_2;
    }

    public String getQ5_3() {
        return q5_3;
    }

    public void setQ5_3(String q5_3) {
        this.q5_3 = q5_3;
    }

    public String getQ5_4() {
        return q5_4;
    }

    public void setQ5_4(String q5_4) {
        this.q5_4 = q5_4;
    }

    public String getQ6() {
        return q6;
    }

    public void setQ6(String q6) {
        this.q6 = q6;
    }
}
