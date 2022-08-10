package vo;

public class LoginUser {
	private String name;
	private String phone;
	private String email;
	private String id;
	private String password;
	
	public LoginUser() {
		this(null,null,null,null,null);
	}
	
	public LoginUser(String id, String password, String name, String phone, String email){
		setName(name);
		setPhone(phone);
		setEmail(email);
		setId(id);
		setPassword(password);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
