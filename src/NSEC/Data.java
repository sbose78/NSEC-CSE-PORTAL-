package NSEC;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Data {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String NAME;
	
	@Persistent
	private String URO;
	
	@Persistent
	private String URE;
		
	@Persistent
	private String DOB;
	
	@Persistent
	private String BG;
	
	@Persistent
	private String GEN;
	
	@Persistent
	private String PHONE;
	
	@Persistent
	private String EMAIL;
	
	@Persistent
	private String BOARD1;
	
	@Persistent
	private String BOARD2;
	
	@Persistent
	private String RANK;
	
	@Persistent
	private String DGPA;
	
	@Persistent
	private String P10;
	
	@Persistent
	private String P12;

    @Persistent
    private Date date;

    public Data(User author, String NAME,String URO,String URE,String DOB,String BG,String GEN,String PHONE,String EMAIL,String BOARD1,String BOARD2,String RANK,String DGPA,String P10,String P12 ,Date date) {
        this.author = author;
        this.NAME = NAME;
		this.URO = URO;
		this.URE = URE;
		this.DOB = DOB;
		this.BG = BG;
		this.GEN=GEN ;
		this.PHONE= PHONE;
		this.EMAIL= EMAIL;
		this.BOARD2 = BOARD2;
		this.BOARD1 = BOARD1;
		this.RANK = RANK;
		this.DGPA = DGPA;
		this.P10 = P10;
		this.P12 = P12;
		
        this.date = date;
		
    }

	 public Data(User author,String URO,Date date) {
        this.author=author;
		this.URO=URO;
		NAME=  URE= DOB = BG=GEN= PHONE= EMAIL = BOARD2= BOARD1 = RANK = DGPA= P10= P12 = null;
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
	
	public String getURO() {
        return  URO;
    }
	
	
	public String getURE() {
        return  URE;
    }
	
    public void setAuthor(User author) {
        this.author = author;
    }

    public String setNAME(String NAME) {
        this.NAME = NAME;
		return "OKAY";
    }
	
	public void setURO(String URO) {
        this.URO = URO;
    }
	
	
	public void setURE(String URE) {
        this.URE = URE;
    }
	
    public void setDate(Date date) {
        this.date = date;
    }
	
	
	
	public void setDOB(String DOB) {
        this.DOB = DOB;
    }
	
	public String getDOB() {
        return DOB;
    }
	
	public void setBG(String BG) {
        this.BG = BG;
    }
	
		public String getBG() {
        return BG;
    }
	
	
	public void setGEN(String GEN) {
        this.GEN = GEN;
    }
	
	
	public String getGEN() {
        return GEN;
    }
	
	
	public void setPHONE(String PHONE) {
        this.PHONE = PHONE;
    }
	
	
	public String getPHONE() {
        return PHONE;
    }
	
	
	public String getEMAIL() {
        return  EMAIL;
    }
		public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

	
	
	public void setP10(String P10) {
        this.P10= P10;
    }
	
	
	public String getP10() {
        return P10;
    }
	
	
	public void setP12(String P12) {
        this.P12= P12;
    }
	
	
	public String getP12() {
        return P12;
    }
	
	
	public void setBOARD1(String BOARD1) {
        this.BOARD1= BOARD1;
    }
	
	
	public String getBOARD1() {
        return  BOARD1;
    }
	
	
	public void setBOARD2(String BOARD2) {
        this.BOARD2= BOARD2;
    }
	
	
	public String getBOARD2() {
        return BOARD2;
    }
	
	
	public void setDGPA(String DGPA) {
        this.DGPA= DGPA;
    }
	
	public String getDGPA() {
        return DGPA;
    }
	
	
	public void setRANK(String RANK) {
        this.RANK= RANK;
    }
	
	public String getRANK() {
        return RANK;
    }
	
}
