package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class URL{
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;
	
	@Persistent
    private String NAME;
	
	@Persistent
	private String topic;
	
	
	@Persistent
	private String teacher;
	

  	@Persistent
	private String URL;
	
	@Persistent
    private Date date;
	
	@Persistent
	private int rating;

    public URL(User author,String URL,Date date,int rating) {
        this.author = author;
		this.URL = URL;
	    this.date = date;
		rating =0;
	}

	public Long getId() {
        return id;
    }
	
	public int getRating(){
		return rating;
	}
		
    public User getAuthor() {
        return author;
    }


    public Date getDate() {
        return date;
    }

	public String getURL() {
        return  URL;
    }
		
	public void setRating(int rating) {
		this.rating=rating;
	}
	
    public void setAuthor(User author) {
        this.author = author;
    }
	
	public void setURL(String URL) {
        this.URL = URL;
    }
	
	
    public void setDate(Date date) {
        this.date = date;
    }
	
}
