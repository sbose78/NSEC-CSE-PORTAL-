package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Emails {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String emailid;
	
	@Persistent
    private Date date;

    public Emails(User author, String emailid,Date date) {
        this.author = author;       
		this.date=date;
		this.emailid=emailid;
		
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

	public String getEmailid() {
        return emailid;
    }
	public void setEmailid(String emailid) {
        this.emailid=emailid;
    }
}
