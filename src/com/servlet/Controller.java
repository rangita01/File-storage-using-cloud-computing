package com.servlet;


import java.awt.Dialog;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.DAO.Controller_DaoClass;
import com.Encryption.encryptdata;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.pojo.*;




@org.springframework.stereotype.Controller
public class Controller 
{
	String workspacepath;
	
	public static Controller_DaoClass Connection()
	{
        
		ApplicationContext ctx=new ClassPathXmlApplicationContext("ApplicationContext.xml");
		
		Controller_DaoClass con=(Controller_DaoClass) ctx.getBean("DAO");
		
		return con;
	}
	
@RequestMapping(value="/DataOwnerRegister",method={RequestMethod.POST})

public ModelAndView DataOwnerRegister(HttpServletRequest request, HttpServletResponse response) throws IOException
{
	Part part;
	
	FilePart filepart;
	
	ParamPart parampart;
	
	String Filename = null;
	
	System.out.println("Welcome DataOwner Register Page");
	
	String workspacepath =request.getServletContext().getRealPath("");
	
	workspacepath=workspacepath.substring(0, workspacepath.indexOf("."));
	
	System.out.println("workspacepath ="+workspacepath);
	
	ArrayList<String> ar =new ArrayList<>();
	
    MultipartParser mp =new MultipartParser(request, 999999999);
    
    while((part = mp.readNextPart())!=null)
    {
    	if(part.isFile())
    	{
    		filepart =(FilePart) part;
    		
    		Filename =filepart.getFileName();
    		
    		System.out.println("Filename ="+Filename);
    		
    		System.out.println(workspacepath+"\\CLOUD-21\\WebContent\\Dp\\"+Filename);
    		
    		long Size =filepart.writeTo(new File(workspacepath+"\\CLOUD-21\\WebContent\\Dp\\"+Filename));
    		
    		System.out.println("Size ="+Size);
    	}
    	
    	else if(part.isParam())
    	{
    		 parampart =(ParamPart) part;
    		 
    		 String paramvalues =parampart.getStringValue();
    		 
    		 ar.add(paramvalues);
    	}
    	
    }
    
           System.out.println(ar);
    
           DataOwnerPojo dp =new DataOwnerPojo();
		
           dp.setUsername(ar.get(0));
           
           dp.setPassword(ar.get(1));
           
           dp.setConformPassword(ar.get(2));
           
           dp.setEmailId(ar.get(3));
           
           dp.setDesignation(ar.get(4));
           
           dp.setDp(Filename);
           
           dp.setGender(ar.get(5));
           
           dp.setPhNumber(ar.get(6));
           
           dp.setAddress(ar.get(7));
           
           Random r = new Random();
           
           int d1 =r.nextInt(9); 
           int d2 =r.nextInt(9); 
           int d3 =r.nextInt(9); 
           int d4 =r.nextInt(9);
           int d5 =r.nextInt(9);
           
           String PrivateKey=""+d1+d2+d3+d4+d5;
           
           System.out.println("PrivateKey ="+PrivateKey);
           
           dp.setPrivateKey(PrivateKey);
       
     Controller_DaoClass con =Connection();

	int i =con.DataOwnerRegister(dp);
	
	if(i > 0)
	{
		return new ModelAndView("DataOwnerLogin");
	}	
	    
	return null;
      }

 @RequestMapping(value="/DataOwnerLoginPage",method={RequestMethod.GET})
 
 public ModelAndView DataOwnerLoginPage(HttpServletRequest request,HttpServletResponse response)
 {
	 System.out.println("Enter DataOwnerLoginPage");
	 
	return new ModelAndView("DataOwnerLogin");
	 
 }


@RequestMapping(value="/DataOwnerLogin",method={RequestMethod.POST})

public ModelAndView DataOwnerLogin(HttpServletRequest request,HttpServletResponse response)
{
	String OwnerDp = null;
	
	String Designation=null;
	
	String PrivateKey=null;
	
	String username=request.getParameter("username");
	
	System.out.println("username ="+username);
	
    String password=request.getParameter("password");
	
	System.out.println("password ="+password);
	
	HttpSession session =request.getSession();
	
	session.setAttribute("ownername", username);
	
	
	DataOwnerPojo dp =new DataOwnerPojo();
	
	dp.setUsername(username);
	
	dp.setPassword(password);
	
	Controller_DaoClass con=Connection();
	
	List list =con.DataOwnerLogin(dp);
	
	Iterator it =list.iterator();
	
	while(it.hasNext())
	{
		DataOwnerPojo dp1 =(DataOwnerPojo) it.next();
		
		OwnerDp =dp1.getDp();
		
		System.out.println("OwnerDp ="+OwnerDp);
		
		Designation =dp1.getDesignation();
		
		System.out.println("Designation ="+Designation);
		
		PrivateKey =dp1.getPrivateKey();
		
		System.out.println("PrivateKey ="+PrivateKey);
	}
	
	session.setAttribute("OwnerDp", OwnerDp);
	
	session.setAttribute("Designation", Designation);
	
	session.setAttribute("PrivateKey", PrivateKey);
	
	if(list.size() != 0)
	{
		return new ModelAndView("DataOwnerHomepage");
	}
	else
	{
		return new ModelAndView("DataOwnerLoginError");
	}
	
		
    }

@RequestMapping(value="/DataUserRegister",method={RequestMethod.POST})

public ModelAndView DataUserRegister(HttpServletRequest request, HttpServletResponse response) throws IOException
{
	Part part;
	
	FilePart filepart;
	
	ParamPart parampart;
	
	String Filename = null;
	
	System.out.println("Welcome DataUser Register Page");
	
	String workspacepath =request.getServletContext().getRealPath("");
	
	workspacepath=workspacepath.substring(0, workspacepath.indexOf("."));
	
	System.out.println("workspacepath ="+workspacepath);
	
	ArrayList<String> ar =new ArrayList<>();
	
    MultipartParser mp =new MultipartParser(request, 999999999);
    
    while((part = mp.readNextPart())!=null)
    {
    	if(part.isFile())
    	{
    		filepart =(FilePart) part;
    		
    		Filename =filepart.getFileName();
    		
    		System.out.println("Filename ="+Filename);
    		
    		System.out.println(workspacepath+"\\CLOUD-21\\WebContent\\Dp\\"+Filename);
    		
    		long Size =filepart.writeTo(new File(workspacepath+"\\CLOUD-21\\WebContent\\Dp\\"+Filename));
    		
    		System.out.println("Size ="+Size);
    	}
    	
    	else if(part.isParam())
    	{
    		 parampart =(ParamPart) part;
    		 
    		 String paramvalues =parampart.getStringValue();
    		 
    		 ar.add(paramvalues);
    	}
    	
    }
    
           System.out.println(ar);
    
           DataUserPojo dp =new DataUserPojo();
		
           dp.setUsername(ar.get(0));
           
           dp.setPassword(ar.get(1));
           
           dp.setConformPassword(ar.get(2));
           
           dp.setEmailId(ar.get(3));
           
           dp.setDp(Filename);
           
           dp.setDesignation(ar.get(4));
           
           dp.setGender(ar.get(5));
           
           dp.setPhNumber(ar.get(6));
           
           dp.setAddress(ar.get(7));
       
     Controller_DaoClass con =Connection();

	int i =con.DataUserRegister(dp);
	
	if(i > 0)
	{
		return new ModelAndView("DataUserLogin");
	}	
	    
	return null;
	
      }

@RequestMapping(value="/DataUserLoginPage",method={RequestMethod.GET})

public ModelAndView DataUserLoginPage(HttpServletRequest request,HttpServletResponse response)
{
	 System.out.println("Enter DataUserLoginPage");
	 
	 return new ModelAndView("DataUserLogin");
	 
}
      
@RequestMapping(value="/DataOwnerHomepage",method={RequestMethod.GET})  

public ModelAndView DataOwnerHomepage(HttpServletRequest request,HttpServletResponse response)
{
	return new ModelAndView("DataOwnerHomepage");
}

@RequestMapping(value="/DataUserLogin",method={RequestMethod.POST})

public ModelAndView DataUserLogin(HttpServletRequest request,HttpServletResponse response)
{
	String UserDp = null;
	
	String Designation =null;
	
	String username=request.getParameter("username");
	
	System.out.println("username ="+username);
	
    String password=request.getParameter("password");
	
	System.out.println("password ="+password);
	
	HttpSession session =request.getSession();
	
	session.setAttribute("username", username);
	
	
	DataUserPojo dp =new DataUserPojo();
	
	dp.setUsername(username);
	
	dp.setPassword(password);
	
	Controller_DaoClass con=Connection();
	
	List list =con.DataUserLogin(dp);
	
    Iterator it =list.iterator();
	
	while(it.hasNext())
	{
		DataUserPojo dp1 =(DataUserPojo) it.next();
		
		UserDp =dp1.getDp();
		
		System.out.println("UserDp ="+UserDp);
		
		Designation =dp1.getDesignation();
		
		System.out.println("Designation ="+Designation);
	}
	
	session.setAttribute("UserDp", UserDp);
	
	session.setAttribute("Designation", Designation);
	
	if(list.size() != 0)
	{
		return new ModelAndView("DataUserHomepage");
	}
	else
	{
		return new ModelAndView("DataUserLoginError");
	}

    }
@RequestMapping(value="TrustAuthLogin",method={RequestMethod.POST})

public ModelAndView TrustAuthLogin(HttpServletRequest request, HttpServletResponse response)
{
	String Username =request.getParameter("username");
	
	System.out.println("Username ="+Username);
	
	String Password =request.getParameter("password");
	
	System.out.println("Password ="+Password);
	
	if(Username.equals("admin")&&Password.equals("admin"))
	{
		System.out.println("matched");
		
		return new ModelAndView("TrustAuthHomepage");
	}
	else
	{
		System.out.println("failed");
		
		return new ModelAndView("TrustAuthLoginError");
	}
	
}

@RequestMapping(value="/FileUpload",method={RequestMethod.POST})

public ModelAndView FileUpload(HttpServletRequest request, HttpServletResponse response)
{
	try
	{
	
	Part part = null;
	
	FilePart filePart = null;
	
	String type = null;
	
	double fileSize=0.0;
	
	String filename =null;
	
	String filecontent="";
	
	String text7="";
												
    MultipartParser mpp=new MultipartParser(request, 999999999);
    
    String workspacepath =request.getServletContext().getRealPath("");
	
	workspacepath=workspacepath.substring(0, workspacepath.indexOf("."));
	
	System.out.println("workspacepath ="+workspacepath);
	
	String Originalpath=workspacepath+"\\CLOUD-21\\WebContent\\UploadData\\OriginalData\\";
	
	String Encryptedpath=workspacepath+"\\CLOUD-21\\WebContent\\UploadData\\EncryptedData\\";
	
	while((part=mpp.readNextPart())!=null)
	{
		if(part.isFile())
		{
			filePart = (FilePart) part;
			
			filename=filePart.getFileName();
			
			//checking process
			
			String Endfilename =filename.substring(filename.indexOf("."));
			
			System.out.println("Endfilename ="+Endfilename);
			
			if(Endfilename.equalsIgnoreCase(".txt") || Endfilename.equalsIgnoreCase(".pdf"))
			{
				System.out.println("matched");
			
			Originalpath=Originalpath+filePart.getFileName();
			
			File originalFile = new File(Originalpath);
			
			type = filePart.getContentType();
			
			fileSize = filePart.writeTo(originalFile);
			
			if(filename.endsWith(".txt"))
			{
				FileInputStream fis1=new FileInputStream(originalFile);
				
				byte[] b=new byte[fis1.available()];
				
				fis1.read(b);
				
				String reading=new String(b);
				
				filecontent=filecontent+reading;
				
				System.out.println("Txt File filecontent ="+filecontent);
				
				fis1.close();
			    
				String encrpt;
				
				try 
				{
				
				encrpt = encryptdata.encrypt(filecontent);
				
				Encryptedpath=Encryptedpath+filename;
				
				FileOutputStream fileOutputStream=new FileOutputStream(new File(Encryptedpath));
			
				fileOutputStream.write(encrpt.getBytes());
				
				System.out.println("Txt File Encrypted content "+encrpt);
				
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
		
			else if(filename.endsWith(".pdf"))
			{ 
				String text="";
				
				com.itextpdf.text.pdf.PdfReader pdfReader=new PdfReader(Originalpath);
			
				int pages=pdfReader.getNumberOfPages();
				
				for(int i1=1;i1<=pages;i1++)
				{
					 text=PdfTextExtractor.getTextFromPage(pdfReader, i1);
					
					 text7=text7+text;
				}
				
				System.out.println("Pdf Full Content in text7 ="+text7);
			
				String encrpt;
			try {
				
				encrpt = encryptdata.encrypt(text7);
			
				Document document=new Document(PageSize.A4);
				
				Encryptedpath=Encryptedpath+filename;
			
			PdfWriter.getInstance(document, new FileOutputStream(new File(Encryptedpath)));
			
			Chunk chunk=new Chunk(encrpt);
			document.open();
			Font font=new Font(Font.TIMES_ROMAN);
			font.setStyle(font.BOLD);
			Paragraph p1=new Paragraph(chunk);
			p1.setAlignment(Element.ALIGN_LEFT);
			document.add(p1);
			document.close();
			System.out.println("pdf writing is completed");
			
			System.out.println(encrpt);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			HttpSession session =request.getSession();
			
			String ownername =session.getAttribute("ownername").toString();
			
			System.out.println("DataOwnerHomepage.jsp ownername ="+ownername);
			
			String PrivateKey =session.getAttribute("PrivateKey").toString();
			
		    System.out.println("DataOwnerHomepage.jsp PrivateKey ="+PrivateKey);
		    
		    FileUploadPojo fb =new FileUploadPojo();
		    
		    fb.setOwnername(ownername);
		    
		    fb.setFilename(filename);
		    
		    fb.setFileType(type);
		    
		    fb.setFileSize(String.valueOf(fileSize));
		    
		    fb.setOriginalPath(Originalpath);
		    
		    fb.setEncryptedPath(Encryptedpath);
		    
		    fb.setPrivateKey(PrivateKey);
		    
		    Controller_DaoClass con =Controller.Connection();
		    
		    int i =con.OwnerFileUpload(fb);
		    
		    if(i > 0)
		    {
		    	System.out.println("uploading process done");
		    	
		    	return new ModelAndView("FileUploadSuccess");
		    }
			  
			}
			
			}else
			{
				System.out.println("failed");
				
				JOptionPane pane = new JOptionPane("Hiiiii");  
		        JDialog dialog = pane.createDialog("Alert");  
		        dialog.setAlwaysOnTop(true);  
		        dialog.show(); 
												
				JOptionPane.showMessageDialog(null, "Please Choose txt / pdf file only");
				
				return new ModelAndView("DataOwnerHomepage");
			}
		}
	}
	
	
	
	}catch(Exception e)
	{ 
		System.out.println(e);
		e.printStackTrace();
	}
	
	return null;
	
}

@RequestMapping(value="/Download",method={RequestMethod.GET})

public ModelAndView Download(HttpServletRequest request, HttpServletResponse response)
{
	String OwnerPrivatekey = null;
	
	String Ownername =request.getParameter("Ownername");
	
	System.out.println("Ownername ="+Ownername);
	
    String Filename =request.getParameter("Filename");
	
	System.out.println("Filename ="+Filename);
	
	Controller_DaoClass con=Connection();
	
	List list =con.DataOwnerPrivateKey(Ownername);
	
	Iterator it =list.iterator();
	
	while(it.hasNext())
	{
		DataOwnerPojo dp =(DataOwnerPojo)it.next();
		
		OwnerPrivatekey =dp.getPrivateKey();
		
		System.out.println("OwnerPrivatekey ="+OwnerPrivatekey);
	}
	
	JOptionPane joptionpane =new JOptionPane("Hi");
	
	JDialog jdialog= joptionpane.createDialog("Alert");
	
	jdialog.setAlwaysOnTop(true);
	
	jdialog.show();
	
	
	String typingPrivatekey =JOptionPane.showInputDialog("Enter Your Privatekey");
	
	if(OwnerPrivatekey.equalsIgnoreCase(typingPrivatekey))
	{
		System.out.println("matched");
		
		 PrintWriter out;
		try 
		{
			String workspacepath =request.getServletContext().getRealPath("");
			
			workspacepath=workspacepath.substring(0, workspacepath.indexOf("."));
			
			System.out.println("workspacepath ="+workspacepath);
		
			out = response.getWriter();
		
			response.setHeader("Content-Disposition","attachment;FileName="+Filename);
			
			int i=0;
			
			File file=new File(workspacepath+"\\CLOUD-21\\WebContent\\UploadData\\OriginalData\\"+Filename);
			
			FileInputStream fis=new FileInputStream(file);
			
			while((i=fis.read())!=-1)
			{
				out.write(i);
			}
			
			return new ModelAndView("DataUserHomepage");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	else
	{
		System.out.println("failed");
		
		JOptionPane.showMessageDialog(null, "Sorry Your key is wrong");
		
		return new ModelAndView("DataUserHomepage");
	}
	return new ModelAndView("DataUserHomepage");
	
	
}

@RequestMapping(value="/RequestTable",method={RequestMethod.GET})

public ModelAndView RequestTable(HttpServletRequest request, HttpServletResponse response)
{
	
	String ReqFrom = request.getParameter("ReqFrom");
	
	System.out.println("ReqFrom ="+ReqFrom);
	
    String ReqTo = request.getParameter("ReqTo");
	
	System.out.println("ReqTo ="+ReqTo);
	
    String UserDp = request.getParameter("UserDp");
	
	System.out.println("UserDp ="+UserDp);
    
    String Ownerdp = request.getParameter("Ownerdp");
	
	System.out.println("Ownerdp ="+Ownerdp);
	
    String Status = request.getParameter("Status");
	
	System.out.println("Status ="+Status);
	
	RequestTablePojo rp =new RequestTablePojo();
	
	rp.setReqFrom(ReqFrom);
	
	rp.setReqTo(ReqTo);
	
	rp.setUserDp(UserDp);
	
	rp.setOwnerDp(Ownerdp);
	
	rp.setStatus(Status);
	
	Controller_DaoClass con =Connection();
	
	int i =con.RequestTable(rp);
	
	if(i > 0)
	{
		return new ModelAndView("DataUserHomepage");
	}
	else
	{
		return new ModelAndView("");
	}
	
	
}
@RequestMapping(value="/GroupmanagerLogin",method={RequestMethod.POST})

public ModelAndView GroupmanagerLogin(HttpServletRequest request, HttpServletResponse response)
{
	String Username =request.getParameter("username");
	
	System.out.println("Username ="+Username);
	
	String Password =request.getParameter("password");
	
	System.out.println("Password ="+Password);
	
	if(Username.equals("admin")&&Password.equals("admin"))
	{
		System.out.println("matched");
		
		return new ModelAndView("GroupmanHomepage");
	}
	else
	{
		System.out.println("failed");
		
		return new ModelAndView("GroupmanLoginError");
	}
	
}

@RequestMapping(value="/InsertReqTableOwner",method={RequestMethod.GET})
public ModelAndView InsertReqTableOwner(HttpServletRequest request, HttpServletResponse response)
{
	
    String ReqFrom =request.getParameter("ReqFrom");
	
	System.out.println("ReqFrom ="+ReqFrom);
	
    String ReqTo =request.getParameter("ReqTo");
	
	System.out.println("ReqTo ="+ReqTo);
	
    String UserDp =request.getParameter("UserDp");
	
	System.out.println("UserDp ="+UserDp);
	
    String Status =request.getParameter("Status");
	
	System.out.println("Status ="+Status);
	
	RequestTablePojo_Owner rp =new RequestTablePojo_Owner();
	
	rp.setReqFrom(ReqFrom);
	
	rp.setReqTo(ReqTo);
	
	rp.setUserDp(UserDp);
	
	rp.setStatus(Status);
	
	Controller_DaoClass con = Connection();
	
	int i =con.InsertReqTableOwner(rp);
	
    int i1 =con.ReqTableGroManagerUpdate(ReqFrom, ReqTo);
	
	if(i > 0)
	{
		System.out.println("Request send to Dataowner");
	}
	
	if(i1 >0)
	{
	       return new ModelAndView("GroupmanHomepage");
	}
	return null;
}


@RequestMapping(value="/Permission",method={RequestMethod.GET})
public ModelAndView Permission(HttpServletRequest request, HttpServletResponse response)
{
	
    String Owner =request.getParameter("Owner");
	
	System.out.println("Owner ="+Owner);
	
    String User =request.getParameter("User");
	
	System.out.println("User ="+User);
	
    String Status =request.getParameter("Status");
	
	System.out.println("Status ="+Status);
	
	PermissionPojo p =new PermissionPojo();
	
	p.setOwner(Owner);
	
	p.setUser(User);
	
	p.setStatus(Status);
	
	Controller_DaoClass con = Connection();
	
	int i =con.Permission(p);
	
	int i1 =con.ReqTableDataOwnerUpdate(Owner, User);
	
	if(i > 0)
	{
		System.out.println("Owner Permission Granted");
	}
	
	if(i1 > 0)
	{
		System.out.println("i1 ="+i1);
		
		return new ModelAndView("DataOwnerHomepage");
	}
	
	return null;
	
}

@RequestMapping(value="/ReqTableGroManagerReject",method={RequestMethod.GET}) 

public ModelAndView ReqTableGroManagerReject(HttpServletRequest request,HttpServletResponse response)
{

	String ReqFrom =request.getParameter("ReqFrom");
	
	System.out.println("ReqFrom"+ReqFrom);
	
    String ReqTo =request.getParameter("ReqTo");
	
	System.out.println("ReqTo ="+ReqTo);
	
	Controller_DaoClass con = Connection();
	
	int i =con.ReqTableGroManagerReject(ReqFrom, ReqTo);
	
	if(i > 0)
	{
		return new ModelAndView("GroupmanHomepage");
	}
	
	return new ModelAndView("GroupmanHomepage");
	
}

@RequestMapping(value="/ReqTableDataOwnerReject",method={RequestMethod.GET})

public ModelAndView ReqTableDataOwnerReject(HttpServletRequest request, HttpServletResponse response)
{
	
    String ReqFrom =request.getParameter("ReqFrom");
	
	System.out.println("ReqFrom"+ReqFrom);
	
    String ReqTo =request.getParameter("ReqTo");
	
	System.out.println("ReqTo ="+ReqTo);
	
	Controller_DaoClass con = Connection();
	
	int i =con.ReqTableDataOwnerReject(ReqFrom, ReqTo);
	
	PermissionPojo p =new PermissionPojo();
	
	p.setOwner(ReqTo);
	
	p.setUser(ReqFrom);
	
	p.setStatus("Reject");
	
	int i1 =con.PermissionReject(p);
	
	System.out.println("i1 ="+i1);
	
	if(i > 0 && i1 >0)
	{
		return new ModelAndView("DataOwnerHomepage");
	}
	
	
	return null;
	
}

@RequestMapping(value="/UserRevocation",method={RequestMethod.POST})

public ModelAndView UserRevocation(HttpServletRequest request,HttpServletResponse response)
{
	
	
    String Username =request.getParameter("Username");
	
	System.out.println("Username"+Username);
	
    String Subject =request.getParameter("Subject");
	
	System.out.println("Subject ="+Subject); 
	
    String Reason =request.getParameter("Reason");
	
	System.out.println("Reason ="+Reason); 
	
	UserRevocationPojo up = new UserRevocationPojo();
	
	up.setUsername(Username);
	
	up.setSubject(Subject);
	
	up.setReason(Reason);
	
	up.setStatus("Request");
	
	Controller_DaoClass con = Connection();
	
	int i =con.UserRevocation(up);
	
	if(i > 0)
	{
		return new ModelAndView("index");
	}
	
	return new ModelAndView("DataUserHomepage");
}

@RequestMapping(value="/UserRevocatonAccept",method={RequestMethod.GET})

public ModelAndView UserRevocatonAccept(HttpServletRequest request,HttpServletResponse response)
{
	
	String RUsername =request.getParameter("RUsername");

    System.out.println("RUsername ="+RUsername);
    
    Controller_DaoClass con = Connection();
	
	int i =con.UserRevocationUpdate(RUsername);
	
	int i9 =con.eliminateUser(RUsername);
	
	int i7 =con.PrivateKeyUpdate();
	
	int i11 =con.PrivateKeyUpdateFileUpload();
	
	if(i > 0 && i7 > 0 && i9 > 0 && i11 >0)
	{
		return new ModelAndView("GroupmanUserrevocation");
	}
	
	
	return new ModelAndView("GroupmanUserrevocation");
	
}

@RequestMapping(value="/GroupmanUserrevocation",method={RequestMethod.GET})

public ModelAndView GroupmanUserrevocation(HttpServletRequest request,HttpServletResponse response)
{
	return new ModelAndView("GroupmanUserrevocation");
	
}
@RequestMapping(value="/GroupmanHomepage",method={RequestMethod.GET})

public ModelAndView GroupmanHomepage(HttpServletRequest request,HttpServletResponse response)
{
	return new ModelAndView("GroupmanHomepage");
	
}

}
