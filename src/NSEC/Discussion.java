package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Discussion{
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

	@Persistent
	private String topic;
		
	@Persistent
	private String content;
	
	
	@Persistent
	private String subject;
	
    @Persistent
    private Date date;

    public Discussion(User author,String content,String subject,String topic,Date date)
	{
		this.author=author;
    	this.subject =subject;
		this.content=content;
	    this.date = date;
		this.topic=topic;		
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

	
    public void setAuthor(User author) {
        this.author = author;
    }
	
    public void setDate(Date date) {
        this.date = date;
    }
	public String getTopic(){
        return topic;
    }
	public void setTopic(String topic)
	{	this.topic=topic;
	}
	
	public String getContent(){
        return content;
    }
	public void setContent(String content)
	{	this.content=content;
	}
	
	public void setSubject(String subject) {
        this.subject= subject;
    }
	
	public String getSubject() {
        return subject;
    }
}

