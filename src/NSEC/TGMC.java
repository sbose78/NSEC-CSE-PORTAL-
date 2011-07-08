package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class TGMC {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

   

    @Persistent
    private String name;


    @Persistent
    private String login;


    @Persistent
    private String email;


    @Persistent
    private String dept;

    @Persistent
    private String yr;	
	
     @Persistent
    private Date date;

/*         TGMC tgmc= new TGMC(user,name,email,login,dept,year,date); */
    public TGMC(User author, String name,String email,String login,String dept,String yr,Date date) {
        this.author = author;       
		this.date=date;
		this.email=email;
		this.name=name;
		this.login=login;
		this.dept=dept;
		this.yr=yr;
		
    }

    public Long getId() {
        return id;
    }
	
    public Date getDate() {
        return date;
    }
	
    public void setDate(Date date) {
        this.date = date;
    }

    public User getAuthor() {
        return author;
    }

   public String getEmail() {
        return email;    
   }
	public void setEmail(String email) {
        this.email=email;
    }

	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name=name;
    }

    public String getLogin() {
        return login;
    }
    public void setLogin(String login) {
        this.login=login;
    }


    public String getDept() {
        return dept;
    }
    public void setDept(String dept) {
        this.dept=dept;
    }
	
    public String getYr() {
        return yr;
    }
    public void setYr(String yr) {
        this.yr=yr;
    }


}
