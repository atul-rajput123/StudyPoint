/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserLoginProcess;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class GmailGenrete 
{
    public boolean sendGmail(String sender,String sub,String text)
    {
        String username="atul4rajput2003@gmail.com";
        String password="nxlc igpc zjih fpky";
        boolean flag=false;
        //logic  
        Properties properties=new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        
         Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        }); 
         try
         {
             MimeMessage message=new MimeMessage(session);
           message.setFrom(new InternetAddress(username));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sender));
            message.setText(text);
            message.setSubject(sub);
            
            Transport.send(message);
            flag=true;
            
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
        
        return flag;
    }
    
}
/*class Gmail
{
    public static void main(String ar[])
    {
    String sender="rajputatul2025@gmail.com";
    String sub="my second email send";
    String text="about java program";
    GmailGenrete gmail=new GmailGenrete();
    boolean b=gmail.sendGmail(sender,sub,text);
    if(b)
     {
        System.out.println("Gmail successfully send");
    }
    else
    {
        System.out.println("Gmail is not send some probleam");
    }
    }
    
}
*/

/*import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class GmailGenrete {
    public boolean sendEmail(String to, String from, String subject, String text) {
        // Your Gmail credentials
        final String username = "your-email@gmail.com";  // Replace with your email
        final String password = "your-app-password";     // Replace with App Password

        boolean flag = false;

        // Set SMTP properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Create session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create the email message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(text);

            // Send the email
            Transport.send(message);
            flag = true;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return flag;
    }
}

class MailSend {
    public static void main(String[] args) {
        String to = "dr116403@gmail.com";
        String from = "rajputatul2025@gmail.com";
        String subject = "Send Email using Gmail";
        String text = "This is an example of an Email sender.";

        GmailGenerate generate = new GmailGenerate();
        boolean b = generate.sendEmail(to, from, subject, text);

        if (b) {
            System.out.println("Successfully sent email.");
        } else {
            System.out.println("Email not sent.");
        }
    }
}
*/
/*
public class GmailGenrete {

    public static void sendEmail(String to, String subject, String body) {
        // Sender's email ID and password
        final String from = "atul4rajput2003@gmail.com";
        final String password = "nxlc igpc zjih fpky";

        // Set SMTP properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Create a session with an authenticator
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Create a MimeMessage object
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);

            // Send the message
            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Error occurred while sending email.");
        }
    }

    public static void main(String[] args) {
        // Test the email sender
        String recipient = "dr116403@gmail.com";
        String subject = "Test Email from Java";
        String body = "Hii i am atul rajput";
        
        sendEmail(recipient, subject, body);
    }
}

*/