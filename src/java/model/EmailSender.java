/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author kanathip
 */
class Auth extends Authenticator {

    @Override
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "isad.bike.maker";
        String passowrd = "isadbikemaker";
        return new PasswordAuthentication(username, passowrd);
    }
}

public class EmailSender {

    private final Session session;
    private String emailMessage;
    private String emailSubject;
    private String htmlMessage;

    public EmailSender() {
        Properties prop = new Properties();
        prop.put("mail.transport.protocol", "stmp");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        session = Session.getDefaultInstance(prop, new Auth());
    }

    public void sendEmail(String receiver) {
        try {
            MimeMessage message = setHeader();
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
            Transport.send(message);
        } catch (MessagingException | UnsupportedEncodingException ex) {
            Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendEmail(String[] receivers) {
        try {
            MimeMessage message = setHeader();
            for (String receiver : receivers) {
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
                Transport.send(message);
            }
        } catch (MessagingException | UnsupportedEncodingException ex) {
            Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private MimeMessage setHeader() throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("gmail.com", "Bike-Maker"));
        message.setSubject(emailSubject);
        message.setText(emailMessage);
        return message;
    }

    public void sendEmailHtml() {

    }

    public void clearMessage() {
        emailMessage = null;
        emailSubject = null;
        htmlMessage = null;
    }

    public String getEmailMessage() {
        return emailMessage;
    }

    public void setEmailMessage(String emailMessage) {
        this.emailMessage = emailMessage;
    }

    public String getEmailSubject() {
        return emailSubject;
    }

    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

}
