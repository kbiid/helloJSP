package kr.co.torpedo.hellojsp.domain;

import java.security.NoSuchAlgorithmException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import kr.co.torpedo.hellojsp.util.SHAHash;

@Entity
@Table(name = "admin")
public class Admin {
	@Id
	@Column(name = "id", columnDefinition = "varchar(100)")
	private String id;
	@Column(name = "passwd", columnDefinition = "varchar(100)")
	private String passwd;
	private SHAHash hash = new SHAHash();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String pwd) {
		this.passwd = pwd;
	}

	public boolean checkAdmin(String id, String passwd) throws NoSuchAlgorithmException {
		if (!this.id.equals(id) || !passwd.equals(hash.hash(passwd))) {
			return false;
		}
		return true;
	}
}
