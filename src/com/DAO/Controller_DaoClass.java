package com.DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.pojo.*;



public class Controller_DaoClass 
{

	HibernateTemplate template;

	
	public void setTemplate(HibernateTemplate template) 
	{
		this.template = template;
	}
	
	public int DataOwnerRegister(DataOwnerPojo dp)
	{
		System.out.println("DataOwnerRegister Page");
		
		int i =(Integer) template.save(dp);
		
		System.out.println("i ="+i);
		
		return i;
	}
	
	public List DataOwnerLogin(DataOwnerPojo dp)
	{
		List list =template.find("From DataOwnerPojo where Username='"+dp.getUsername()+"' AND Password='"+dp.getPassword()+"'");
		
		return list;
		
	}
	
	public int DataUserRegister(DataUserPojo dp)
	{
		System.out.println("DataUserRegister Page");
		
		int i =(Integer) template.save(dp);
		
		System.out.println("i ="+i);
		
		return i;
	}
	
	public List DataUserLogin(DataUserPojo dp)
	{
		List list =template.find("From DataUserPojo where Username='"+dp.getUsername()+"' AND Password='"+dp.getPassword()+"'");
		
		return list;
		
	}
	
	public int OwnerFileUpload(FileUploadPojo fb)
	{
		int i =(Integer) template.save(fb);
		
		System.out.println("i ="+i);
		
		return i;
	}
	
	public List ShowDataOwner()
	{
		
		List list =template.find("From DataOwnerPojo");
		
		return list;
		
	}
	
	public List ShowDataOwnerFiles()
	{
		List list =template.find("from FileUploadPojo");
		
		return list;
	
	}
	
	public List DataOwnerPrivateKey(String Ownername)
	{
		List list =template.find("From DataOwnerPojo where Username='"+Ownername+"'");
		
		return list;
	}
	
	public int RequestTable(RequestTablePojo rp)
	{
		
		int i =(Integer) template.save(rp);
		
		return i;
		
	}
	
	public List CheckingRequestTable(String Username)
	{
		ArrayList ar;
		
		System.out.println("Username ="+Username);
		
		System.out.println("From RequestTablePojo where ReqFrom='"+Username+"'");
		
		List list7 =template.find("From RequestTablePojo where ReqFrom='"+Username+"'");
		
		System.out.println("list7 ="+list7);
		
		Iterator it7 =list7.iterator();
        
        ar = new ArrayList();
        
        while(it7.hasNext())
        {
        	RequestTablePojo rp =(RequestTablePojo) it7.next();
        	
        	String ReqTo =rp.getReqTo();
        	
        	System.out.println("ReqTo ="+ReqTo);
        	
        	ar.add(ReqTo);
        	
        }
        
        System.out.println("ArrayList values ="+ar);
		
		return ar;
	}
	
	public List ShowRequestUser(String Ownername)
	{
		
		List list =template.find("From RequestTablePojo_Owner where ReqTo='"+Ownername+"'");
		
		return list;
		
	}
	
	public List ShowAllRequestUser()
	{ 
		List list =template.find("From RequestTablePojo");
		
		return list;
		
	}
	
	public int InsertReqTableOwner(RequestTablePojo_Owner rp)
	{
		
		int i =(Integer) template.save(rp);
		
		return i;
		
	}
	
	public int ReqTableGroManagerUpdate(String ReqFrom,String ReqTo)
	{
		
		int i =template.bulkUpdate("Update RequestTablePojo SET Status='Accept' where ReqTo='"+ReqTo+"' AND ReqFrom='"+ReqFrom+"'");
		
		return i;
		
	}
	
	public int Permission(PermissionPojo p)
	{
		
		int i =(Integer) template.save(p);
		
		return i;
		
	}
	
	public List PermisionChecking(String Owner, String User)
	{
		
		List list =template.find("From PermissionPojo where Owner='"+Owner+"' AND User='"+User+"'");
		
		System.out.println("From PermissionPojo where Owner='"+Owner+"' AND User='"+User+"'");
		
		return list;
		
	}
	
	public int ReqTableDataOwnerUpdate(String Owner,String User)
	{
		
        int i =template.bulkUpdate("Update RequestTablePojo_Owner SET Status='Accept' where ReqTo='"+Owner+"' AND ReqFrom='"+User+"'");
		
		return i;
		
	}
	
	public int ReqTableGroManagerReject(String ReqFrom,String ReqTo)
	{
		
		 int i =template.bulkUpdate("Delete From RequestTablePojo where ReqTo='"+ReqTo+"' AND ReqFrom='"+ReqFrom+"'");
		
		 return i;
		
	}
	
	public int ReqTableDataOwnerReject(String ReqFrom,String ReqTo)
	{
		
		int i =template.bulkUpdate("Update RequestTablePojo_Owner SET Status='Reject' where ReqTo='"+ReqTo+"' AND ReqFrom='"+ReqFrom+"'");
		
		 return i;
		
	}
	
	public int PermissionReject(PermissionPojo p)
	{
		
		int i =(Integer) template.save(p);
		
		return i;
		
	}
	
	public int UserRevocation(UserRevocationPojo up)
	{
		int i =(Integer) template.save(up);
		
		return i;
	}
	
	public List ShowUserRevocationList()
	{
		List list =template.find("from UserRevocationPojo");
		
		return list;
	
	}
	
	public int UserRevocationUpdate(String RUsername)
	{
		int i =template.bulkUpdate("Update UserRevocationPojo SET Status='Accept' where Username='"+RUsername+"'");
		
		 return i;
	}
	
	public int PrivateKeyUpdate()
	{
		
		List list =template.find("From DataOwnerPojo");
		
		Iterator it =list.iterator();
		
		Random r = new Random();
	      
		int i7 = 0;
		
		while(it.hasNext())
		{
			i7=0;
			
			DataOwnerPojo dp7 =(DataOwnerPojo)it.next();
			
			String DataOwner =dp7.getUsername();
			
			System.out.println("DataOwner ="+DataOwner);
			
			    
	           int d1 =r.nextInt(9); 
	           int d2 =r.nextInt(9); 
	           int d3 =r.nextInt(9); 
	           int d4 =r.nextInt(9);
	           int d5 =r.nextInt(9);
	           
	           String UpdatePrivateKey=""+d1+d2+d3+d4+d5;
	           
	           System.out.println("UpdatePrivateKey ="+UpdatePrivateKey);
	           
	           i7 =template.bulkUpdate("Update DataOwnerPojo SET PrivateKey='"+UpdatePrivateKey+"' where Username='"+DataOwner+"'");
			
	           System.out.println("Private Key Updated Sucessfully ="+i7);
		}
		
		
		return i7;
		
	}
	
	public int eliminateUser(String Username)
	{
		int i9 =template.bulkUpdate("Delete From DataUserPojo where Username='"+Username+"'");
		
		return i9;
	}
	
	public int PrivateKeyUpdateFileUpload()
	{
		int i11 = 0;
       
		List list =template.find("From DataOwnerPojo");
		
		Iterator it =list.iterator();
						
		while(it.hasNext())
		{
			DataOwnerPojo dp7 =(DataOwnerPojo)it.next();
			
            String DataOwner =dp7.getUsername();
			
			System.out.println("DataOwner ="+DataOwner);
			
			String PrivateKey =dp7.getPrivateKey();
			
			System.out.println("PrivateKey ="+PrivateKey);
			
			i11 =template.bulkUpdate("Update FileUploadPojo SET PrivateKey='"+PrivateKey+"' where Ownername='"+DataOwner+"'");
		}
		
		return i11;
		
	}
}
