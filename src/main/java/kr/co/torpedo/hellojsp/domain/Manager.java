package kr.co.torpedo.hellojsp.domain;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "manager")
public class Manager {
	@Id
	@Column(name = "id", columnDefinition = "varchar(100)")
	private String id;
	@Column(name = "passwd", columnDefinition = "varchar(100)")
	private String pwd;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public boolean checkManager(String id, String passwd) throws NoSuchAlgorithmException {
		if (!this.id.equals(id) || !pwd.equals(hash(passwd))) {
			return false;
		}
		return true;
	}

	public String hash(String message) {
		String sha = "";

		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(message.getBytes());
			StringBuffer sb = new StringBuffer();
			byte[] byteData = md.digest();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString(byteData[i] & 0xff + 0x100, 16).substring(1));
			}
			sha = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			sha = null;
		}

		return sha;
	}

	public void hashPwd() throws NoSuchAlgorithmException {
		pwd = hash(pwd);
	}
}
