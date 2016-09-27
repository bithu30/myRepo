/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.feedback;

import com.icip.utils.DateUtils;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author mhashemi
 */
@Entity(name = "ICIPFeedback")
public class ICIPFeedback{// implements Serializable {

//    private static final long serialVersionUID = -1144795217842793147L;
    
    public ICIPFeedback(){
        
    }
    public ICIPFeedback(int userID, String url, int feedback){
        this.userID = userID;
        this.feedback = feedback;
        this.url = url;
    }
    
    @Id
    @GeneratedValue
    private int feedbackID;

    @Column(name = "userID", nullable = false, length = 2)
    private int userID;

    @Column(name = "url", nullable = false, length = 150)
    private String url;

    @Column(name = "feedback", nullable = false, length = 2)
    private int feedback;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "inDate", nullable = true)
    private Date inDate= DateUtils.dateToDate(new java.util.Date(System.currentTimeMillis()),null);

    /**
     * @return the feedbackID
     */
    public int getFeedbackID() {
        return feedbackID;
    }

    /**
     * @param feedbackID the feedbackID to set
     */
    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the feedback
     */
    public int getFeedback() {
        return feedback;
    }

    /**
     * @param feedback the feedback to set
     */
    public void setFeedback(int feedback) {
        this.feedback = feedback;
    }

     public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }
}
