package com.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="OwnerFileUpload")
public class FileUploadPojo 
{
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String Ownername,Filename,FileType,FileSize,OriginalPath,EncryptedPath,PrivateKey;

	public String getOriginalPath() {
		return OriginalPath;
	}

	public void setOriginalPath(String originalPath) {
		OriginalPath = originalPath;
	}

	public String getEncryptedPath() {
		return EncryptedPath;
	}

	public void setEncryptedPath(String encryptedPath) {
		EncryptedPath = encryptedPath;
	}

	public String getOwnername() {
		return Ownername;
	}

	public void setOwnername(String ownername) {
		Ownername = ownername;
	}

	public String getFilename() {
		return Filename;
	}

	public void setFilename(String filename) {
		Filename = filename;
	}

	public String getFileType() {
		return FileType;
	}

	public void setFileType(String fileType) {
		FileType = fileType;
	}

	public String getFileSize() {
		return FileSize;
	}

	public void setFileSize(String fileSize) {
		FileSize = fileSize;
	}

	

	public String getPrivateKey() {
		return PrivateKey;
	}

	public void setPrivateKey(String privateKey) {
		PrivateKey = privateKey;
	}

	

}
