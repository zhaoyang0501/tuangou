package com.pzy.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.pzy.entity.User;

/**
 * 发送邮件的测试程序
 * 
 * @author lwq
 * 
 */
public class MailUtil {
	  public static void sendEmail( User user) throws MessagingException{
	        final Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.host", "smtp.sina.com");
	        // 发件人的账号
	        props.put("mail.user", "zhaoyang_0034@sina.com");
	        // 访问SMTP服务时需要提供的密码
	        props.put("mail.password", "sina110119");
	        // 构建授权信息，用于进行SMTP进行身份验证
	        Authenticator authenticator = new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                // 用户名、密码
	                String userName = props.getProperty("mail.user");
	                String password = props.getProperty("mail.password");
	                return new PasswordAuthentication(userName, password);
	            }
	        };
	        // 使用环境属性和授权信息，创建邮件会话
	        Session mailSession = Session.getInstance(props, authenticator);
	        // 创建邮件消息
	        MimeMessage message = new MimeMessage(mailSession);
	        // 设置发件人
	        InternetAddress form = new InternetAddress(
	                props.getProperty("mail.user"));
	        message.setFrom(form);

	        // 设置收件人
	        InternetAddress to = new InternetAddress(user.getEmail());
	        message.setRecipient(RecipientType.TO, to);


	        // 设置邮件标题
	        message.setSubject(user.getName()+"找回密码");

	        // 设置邮件的内容体
	        message.setContent("亲爱的"+user.getName()+",您在订单管理系统中的密码是"+user.getPassword(), "text/html;charset=UTF-8");
	        // 发送邮件
	        Transport.send(message);
	  }
    public static void main(String[] args) throws MessagingException {
      
    }
}