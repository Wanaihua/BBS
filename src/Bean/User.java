package Bean;

import org.hibernate.validator.constraints.NotBlank;


public class User {
	int userId;
	@NotBlank
	String userName;
	@NotBlank
	String userPass;
	String oldUserPass;
	String newPass;
	String userEmail;
	String userNickname;
	String userBirthday;
	String sex;
	int userPoints;
	String userRemark;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
	public String getOldUserPass() {
		return oldUserPass;
	}
	public void setOldUserPass(String oldUserPass) {
		this.oldUserPass = oldUserPass;
	}
	
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getUserPoints() {
		return userPoints;
	}
	public void setUserPoints(int userPoints) {
		this.userPoints = userPoints;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}
	
}
