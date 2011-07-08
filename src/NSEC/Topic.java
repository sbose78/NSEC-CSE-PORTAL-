package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Topic {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String topicName;
	
	@Persistent
	private String subject;
	
	@Persistent
	private String creator;
		
    @Persistent
    private Date date;

    public Topic(User author, String topicName, String subject, String creator ,Date date) {
        this.author = author;
        this.topicName=topicName;
		this.subject = subject;
		this.creator = creator;		
        this.date = date;
		
    }

	public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }


    public Date getDate() {
        return date;
    }

	public String getTopicName() {
        return topicName;
    }
	
	public String getCreator() {
        return  creator;
    }
	
	
    public void setAuthor(User author) {
        this.author = author;
    }

    public String setTopicName(String topicName) {
        this.topicName=topicName;
		return "OKAY";
    }
	
	public void setCreator(String creator) {
        this.creator=creator;
    }
	
	
	
    public void setDate(Date date) {
        this.date = date;
    }
	
	public void setId(Long id) {
        this.id=id;
    }
}
