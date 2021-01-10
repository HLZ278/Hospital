package entity;


import java.util.Date;

//实体类，同表结构对应
public class User {
	private int userID;
	private String userName;
	private String userPwd;
	private String userTel;
	private Date registeDate;
	private String realName;
	private int idCardType;
	private String idCardNum;
	private int userType;
	private int hospitalID;

	public User(int userID, String userName, String userPwd, int userType) {
		this.userID = userID;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userType = userType;
	}

	public User() {

	}

	@Override
	public String toString() {
		return "User{" +
				"userID=" + userID +
				", userName='" + userName + '\'' +
				", userPwd='" + userPwd + '\'' +
				", userTel='" + userTel + '\'' +
				", registeDate=" + registeDate +
				", realName='" + realName + '\'' +
				", idCardType=" + idCardType +
				", idCardNum='" + idCardNum + '\'' +
				", userType=" + userType +
				", hospitalID=" + hospitalID +
				'}';
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public Date getRegisteDate() {
		return registeDate;
	}

	public void setRegisteDate(Date registeDate) {
		this.registeDate = registeDate;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public int getIdCardType() {
		return idCardType;
	}

	public void setIdCardType(int idCardType) {
		this.idCardType = idCardType;
	}

	public String getIdCardNum() {
		return idCardNum;
	}

	public void setIdCardNum(String idCardNum) {
		this.idCardNum = idCardNum;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getHospitalID() {
		return hospitalID;
	}

	public void setHospitalID(int hospitalID) {
		this.hospitalID = hospitalID;
	}
}
