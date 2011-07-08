package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Notes {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String NAME;
	
	@Persistent
	private String URL;
	
	@Persistent
	private String subject;
	
	
	@Persistent
	private String topic;
	
	
	@Persistent
	private String teacher;
	
	
    @Persistent
    private Date date;

    public Notes(User author, String URL,String NAME,String subject,String teacher,String topic,Date date) {
        this.author = author;
			this.NAME=NAME;
		this.URL = URL;
		this.subject =subject;
		this.teacher=teacher;		
        this.date = date;
		this.topic=topic;		
    }

	 public Notes(User author,Date date) {
        this.author=author;
		this.date=date;
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

	public String getNAME() {
        return NAME;
    }
	
	public String getURL() {
        return  URL;
    }
		
	
    public void setAuthor(User author) {
        this.author = author;
    }

    public String setNAME(String NAME) {
        this.NAME = NAME;
		return "OKAY";
    }
	
	public void setURL(String URL) {
        this.URL = URL;
    }
	
	
    public void setDate(Date date) {
        this.date = date;
    }
	
	
	
	public void setTopic(String topic){
        this.topic= topic;
    }
	
	
	public String getTopic(){
        return topic;
    }
	
	
	public void setTeacher(String teacher){
        this.teacher= teacher;
    }
	
	public String getTeacher() {
        return teacher;
    }
	
	
	public void setSubject(String subject) {
        this.subject= subject;
    }
	
	public String getSubject() {
        return subject;
    }
	
}
