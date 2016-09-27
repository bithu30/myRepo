package com.icip.core.user;

//import com.icip.core.icipproject.ClimateProject;
import com.icip.utils.DateUtils;
import com.icip.utils.Encipher;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by yingwu on 02/05/2014.
 */
@Entity(name = "ICIPUser")
public class ICIPUser implements Serializable
{
    private static final long serialVersionUID = -1144795217842793167L;

    public ICIPUser()
    {
    }

    public ICIPUser(int userID, String email, String firstName, String lastName)
    {
        this.userID = userID;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public ICIPUser(String email, String password, String firstName, String lastName, String sector, String organization, String reason)
    {
        this.email = email;
        this.password = Encipher.EncodeString(password);
        this.firstName = firstName;
        this.lastName = lastName;
        this.sector = sector;
        this.organization = organization;
        this.reason = reason;
    }

    @Id
    @GeneratedValue
    private int userID;

    @Column(name = "firstname", nullable = false, length = 40)
    private String firstName;

    @Column(name = "lastName", nullable = false, length = 40)
    private String lastName;

    @Column(name = "email", unique=true, nullable = false, length = 50)
    private String email;

    @Column(name = "password", nullable = false, length = 200)
    private String password;

    @Column(name = "sector", nullable = true, length = 100)
    private String sector;

    @Column(name = "organization", nullable = true, length = 250)
    private String organization;

    @Column(name = "reason", nullable = true, length = 100)
    private String reason;

    @Column(name = "usertype", nullable = false, length = 2)
    private int userType=1;

    @Column(name = "status", nullable = false, length = 2)
    private int status=1;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "indate", nullable = true)
    private Date inDate= DateUtils.dateToDate(new java.util.Date(System.currentTimeMillis()),null);

    @Column(name = "duration", nullable = true, length = 4)
    private int duration;
    
   // @OneToMany(fetch = FetchType.LAZY)
   // @JoinColumn(name = "climate_user_fk") 
  //  private Set<ClimateProject> projects = new HashSet<ClimateProject>();

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

  //  public Set<ClimateProject> getProjects() {
  //      return projects;
  //  }

  //  public void setProjects(Set<ClimateProject> projects) {
  //      this.projects = projects;
  //  }
    
    
}
