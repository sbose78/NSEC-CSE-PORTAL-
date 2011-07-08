package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;
import com.google.appengine.api.datastore.Text;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Post{
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String topicId;
	
    @Persistent(defaultFetchGroup = "true")
    private Text content	;
			
    @Persistent
    private Date date;

    public Post(User author, Text content, String topicId, Date date) {
        this.author = author;
        this.content=content;
		this.topicId = topicId;
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

	public Text getContent() {
        return content;
    }
		
	public String topicId() {
        return topicId;
    }	
	
	
    public void setAuthor(User author) {
        this.author = author;
    }

    public void setContent(Text content) {
        this.content=content;
		
    }
	
	public void setTopicId(String topicId){
		this.topicId=topicId;
	}
	
    public void setDate(Date date) {
        this.date = date;
    }
	
	public void setId(Long id) {
        this.id=id;
    }
}
