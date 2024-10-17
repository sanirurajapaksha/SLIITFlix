package userPackage;

public class UserModel {
	private int userId;
	private String username;
	private String email;
	private String password;
	private String contactNum;

	//overloaded constructor
	public UserModel(int userId, String username, String email, String password, String contactNum) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
		this.password = password;
		this.contactNum = contactNum;
	}

	//setters and getters for the variables
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
	    if(email.contains("@") && email.contains(".")) {
	        this.email = email;
	    } else {
	        throw new IllegalArgumentException("Invalid email format");
	    }
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNum() {
		return contactNum;
	}

	public void setContactNum(String contactNum) {
	    if(contactNum.matches("\\d{10}")) {  //validation for a 10-digit number
	        this.contactNum = contactNum;
	    } else {
	        throw new IllegalArgumentException("Invalid contact number");
	    }
	}


}
