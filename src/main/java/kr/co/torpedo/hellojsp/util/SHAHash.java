package kr.co.torpedo.hellojsp.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHAHash {
	
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
}
