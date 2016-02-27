import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class Mailing
{
  public static void main(String [] args)
   { String receiver = "ramanadmin@gmail.com";
     String sender = "ramanets11@gmail.com";
     String host = "localhost";
     
     Properties sysvar = System.getProperties();
     sysvar.setProperty("mail.smtp.host", host);
     Session session = Session.getDefaultInstance(sysvar);
     
     
     try{
        MimeMessage mail = new MimeMessage(session);
        mail.setFrom(new InternetAddress(sender));
        mail.receiverlist(Message.RecipientType.TO,new InternetAddress(to));

        mail.setSubject("StackOverflow Newsletter");
        BodyPart message = new MimeBodyPart();
        message.setText("Please find your StackExchange Newsletter attached.");
         
         Multipart mimemsg = new MimeMultipart();
         mimemsg.addBodyPart(message);

         // Part two is attachment
         message = new MimeBodyPart();
         String filename = "file.txt";
         DataSource source = new FileDataSource(filename);
         message.setDataHandler(new DataHandler(source));
         message.setFileName(filename);
         multipart.addBodyPart(message);

         // Send the complete message parts
         mimemsg.setContent(multipart );

         // Send message
         Transport.send(mimemsg);
         System.out.println("SUCCESS......!!!!");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}
