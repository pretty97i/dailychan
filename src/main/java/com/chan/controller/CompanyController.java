package com.chan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chan.dto.CompanyDTO;
import com.chan.util.MyUtil;

@Controller
public class CompanyController {

	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/introduce/info.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String introduce(Locale locale, Model model) {
		
		return "company/introduceInfo";
		
	}
	
	@RequestMapping(value = "/help/terms.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String terms(Locale locale, Model model) {
		
		return "company/helpTerms";
		
	}
	
	@RequestMapping(value = "/help/privacy.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String privacy(Locale locale, Model model) {
		
		return "company/helpPrivacy";
		
	}
	
	@RequestMapping(value = "/help/financial.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String financial(Locale locale, Model model) {
		
		return "company/helpFinancial";
		
	}
	
	@Autowired
	private JavaMailSender mailSender;	 
	
	@RequestMapping(value = "/company/contactUs.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String conatactUs() {

		return "company/contactUs";
	}

	@RequestMapping(value = "/company/sendEmail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String sendEmail(CompanyDTO dto, HttpServletRequest request,MultipartHttpServletRequest muti) {
		
		String setfrom = request.getParameter("setfrom"); //�����»��   
	    String tomail  = "naeyo_na@naver.com";  
	    String title   = "[" + request.getParameter("company") + "/" + request.getParameter("tel") + "]";       // ����
	    String content = request.getParameter("description");    // ����
		
	    String path = request.getSession().getServletContext().getRealPath("/WEB-INF/files");   	 	    
		MultipartFile file = muti.getFile("attachFile");
		
		String newFileName = null;
		
		if(file==null)
			return null;		
			
		if(file.getOriginalFilename().equals(""))
			return null;
		
		//Ȯ���� �и� : .txt
		String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		if(fileExt==null||fileExt.equals(""))
			return null;		
		
		//������ ������ ���ϸ� ����: Ķ�����϶� %��ŭ �Ű������� �޴µ� �Ѱ������ϱ� 1$�� �������� 
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		newFileName += System.nanoTime();//10�� -9���� ��
		newFileName += fileExt;
		
		File f = new File(path);
				
		if(!f.exists())
			f.mkdirs();
		
		String root = path+ File.separator  + newFileName;
	    
		if(file!=null && file.getSize()>0) {
			
			try {
				
				FileOutputStream fos = new FileOutputStream(path + "/" + newFileName);
				InputStream is = file.getInputStream();
				
				byte[] buffer = new byte[512];
				
				while(true) {
					
					int data = is.read(buffer,0,buffer.length);
					
					if(data==-1) {
						
						break;
					}
					
					fos. write(buffer,0,data);
				}
				
				is.close();
				fos.close();
		    	
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		        
		        messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
		        messageHelper.setTo(tomail);     // �޴»�� �̸���
		        messageHelper.setSubject(title); // ���������� ������ �����ϴ�
		        messageHelper.setText(content);  // ���� ����
		     
		        FileSystemResource fsr = new FileSystemResource(root);
		        messageHelper.addAttachment(newFileName, fsr);

		        mailSender.send(message);
			
		        String fullFilePath = path + File.separator + newFileName;
			  	
				File ff = new File(fullFilePath);
				
			
		        if(ff.exists()) ff.delete();

			} catch (Exception e) {
				System.out.println(e.toString());
			}			
			
		}
		
		return "redirect:/main.action";
		
	}

}