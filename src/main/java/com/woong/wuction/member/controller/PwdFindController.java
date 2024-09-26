package com.woong.wuction.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.member.service.MemberServiceImpl;

/**
 * Servlet implementation class newPasswordController
 */
@WebServlet("/pwdFind.me")
public class PwdFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		String newPassword = generateNewPassword();
		
		boolean sent = sendVerificationEmail(email, newPassword);
		
		if(sent) {
			response.getWriter().print("NNY");
			Member m = new Member();
			m.setEmail(email);
			m.setMemPwd(newPassword);
			
			int result = new MemberServiceImpl().pwdFind(m);
		} else {
			response.getWriter().print("NNN");
		}
	}
	
	private boolean sendVerificationEmail(String email, String newPassword) {
		String host = "smtp.gmail.com";
		final String username= "wjddmsdb124@gmail.com";
		final String password = "gbvtugrdbspkmidd";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.ssl.protocols", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("새로운 비밀번호");
			message.setText("새로운 비밀번호 : " + newPassword);
			
			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	private String generateNewPassword() {
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		int range = 10;
		
		 for(int i=0;i<range;i++){

		        if(rd.nextBoolean()){
		            sb.append(rd.nextInt(10));
		        }else {
		            sb.append((char)(rd.nextInt(26)+65));
		        }
		    }

		    return sb.toString();
	}

}
