package com.woong.wuction.member.controller;

import java.io.IOException;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendAuthCodeController
 */
@WebServlet("/sendAuthCode.me")
public class SendAuthCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendAuthCodeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");

		// 무작위로 인증번호 생성하는 함수
		String verificationCode = generateVerificationCode();

		// 생성된 인증번호를 이메일로 전송
		boolean sent = sendVerificationEmail(email, verificationCode);

		if (sent) {
			// 인증번호를 세션에 저장하여 나중에 검증 시 사용
			request.getSession().setAttribute("verificationCode", verificationCode);
			response.getWriter().print("NNY"); // 성공 시 응답
		} else {
			response.getWriter().print("NNN"); // 실패 시 응답
		}
	}

	private boolean sendVerificationEmail(String email, String verificationCode) {
		String host = "smtp.gmail.com"; // SMTP 서버 호스트 : 구글의 경우 smtp.gmail.com
		final String username = "holly101763@gmail.com";
		final String password = "";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true"); // SMTP 인증 사용 여부
		props.put("mail.smtp.starttls.enable", "true"); // TLS 사용 여부
		props.put("mail.smtp.host", host); // SMTP 서버 호스트 설정
		props.put("mail.smtp.port", "587"); // 서버 포트 번호 / 구글의 포트번호
		
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
			message.setSubject("이메일 인증 코드");
			message.setText("인증 코드: " + verificationCode);

			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

	private String generateVerificationCode() {
		Random random = new Random();
		int code = random.nextInt(900000) + 100000;
		return String.valueOf(code);
	}

}
