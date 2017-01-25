package ap.mail;

import java.net.SocketException;
import java.net.UnknownHostException;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class Contact_Mail {
  private static final String host_name="smtp.gmail.com";
//private static final String auth_user="ansuthar14@gmail.com";
private static final String pwd="sachin1992";
private static final String subject="Conform Email address";
private static final String mail="er.vijay9999@gmail.com";
private static final Session session;
    
    

static
{
Properties properties=new Properties();
properties.put("mail.smtp.host",host_name);
properties.put("mail.smtp.auth","true");
properties.setProperty("mail.smtp.ssl.trust", host_name);
properties.put("mail.smtp.starttls.enable","true");
properties.put("mail.smtp.port",587);
session = Session.getDefaultInstance(properties,
new javax.mail.Authenticator() 
{
    @Override
    protected PasswordAuthentication getPasswordAuthentication()
{
return new PasswordAuthentication(mail,pwd);
}
});
}

public boolean sendMail(String uid,String pswd,String email) throws UnknownHostException, SocketException, MessagingException
{
boolean msgFlag=false;
String AdEmail="punit_patel2005@yahoo.com";
try {
Message message = new MimeMessage(session);

message.setFrom(new InternetAddress(mail));
message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(AdEmail));
message.setSubject("Softech Infosys[User Detail]");

StringBuffer msg = new StringBuffer();

//A String Object to store the subject

msg.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
msg.append("<head>");
msg.append("<meta http-equiv=\"Content-Type\" content=\"text/html;" +
" charset=iso-8859-1\" />");
msg.append("</head>");
msg.append("<body>");
msg.append("<div>");
msg.append("<table width=\"600\" height=\"428\" border=\"0\" " +
"cellpadding=\"0\" cellspacing=\"0\" " +
"style=\"border:1px solid #A40000\">");
msg.append("<tr>");
msg.append("<td width=\"10\" height=\"49\" bgcolor=\"#A40000\">" +
"&nbsp;</td>");
msg.append("<td width=\"600\" bgcolor=\"#A40000\">" +
"<span style=\"color:#FFFFFF;font-family:Verdana, " +
"Arial, Helvetica, sans-serif;font-size:18px;" +
"\">Softech Infosys[User Detail]</span></td>");
msg.append("</tr>");
msg.append("<tr>");
msg.append("<td height=\"48\" bgcolor=\"#FFA4A4\">&nbsp;</td>");
msg.append("<td bgcolor=\"#FFA4A4\"><span style=\"color:#FFFFFF;" +
"font-family:Verdana, Arial, Helvetica, sans-serif;" +
"font-size:16px;\">" +
"Usage Statistics</span></td>");
msg.append("</tr>");

msg.append("<tr>");
msg.append("<td height=\"39\">&nbsp;</td>");

msg.append("<td> <span style=\"font-family: Verdana," +
" Arial, Helvetica, sans-serif;font-size: 14px;\">" +
"Your Account Has Been Used <br>" +
"Here Are The Details : </span></td>"); 

msg.append("</tr>");
msg.append("<tr>");
msg.append("<td>&nbsp;</td>");
msg.append("<td><div align=\"left\">");
msg.append("<table width=\"490\" height=\"134\" border=\"0\"" +
" cellpadding=\"0\" cellspacing=\"0\" " +
"style=\"border:2px solid #CCCCCC\">");
msg.append("<tr>");
msg.append("<td width=\"10\">&nbsp;</td>");
msg.append("<td width=\"125\" style=\"color: #333333; " +
"font-weight: bold; font-family: Verdana, Arial, " +
"Helvetica, sans-serif; font-size: 14px;\">User Name </td>");
msg.append("<td width=\"351\" style=\"color: #333333; " +
" font-family: Verdana, Arial, " +
"Helvetica, sans-serif; font-size: 14px;\">" +
": "+uid+"</td>");
msg.append("</tr>");

msg.append("<tr>");
msg.append("<td style=\"color: #333333; font-weight: " +
"bold; font-family: Verdana, Arial, Helvetica, " +
"sans-serif; font-size: 14px;\">&nbsp;</td>");
msg.append("<td style=\"color: #333333; font-weight: bold; " +
"font-family: Verdana, Arial, Helvetica, sans-serif; " +
"font-size: 14px;\">Password</td>");
msg.append("<td style=\"color: #333333; " +
"font-family: Verdana, Arial, Helvetica, sans-serif;" +
" font-size: 14px;\">:"+pswd+" </td>");
msg.append("</tr>");



msg.append("<tr>");
msg.append("<td style=\"color: #333333; font-weight: " +
"bold; font-family: Verdana, Arial, Helvetica, " +
"sans-serif; font-size: 14px;\">&nbsp;</td>");
msg.append("<td style=\"color: #333333; font-weight: bold; " +
"font-family: Verdana, Arial, Helvetica, sans-serif; " +
"font-size: 14px;\">Email</td>");
msg.append("<td style=\"color: #333333; " +
"font-family: Verdana, Arial, Helvetica, sans-serif;" +
" font-size: 14px;\">: "+email+" </td>");
msg.append("</tr>");


msg.append("</table>");
msg.append("</div><div align=\"left\"></div></td>");
msg.append("</tr>");
msg.append("<tr>");
msg.append("<td height=\"89\">&nbsp;</td>");

msg.append("</tr>");
msg.append("<tr>");
msg.append("<td bgcolor=\"#A40000\" height=\"53\">&nbsp;</td>");
msg.append("<td bgcolor=\"#A40000\"><p style=\"font-size: 14px;" +
"color:#FFFFFF;font-family:Verdana, Arial, Helvetica, " +
"sans-serif;\">Thanks</p>");
msg.append("<p style=\"font-size: 14px;color:#FFFFFF;" +
"font-family:Verdana, Arial, Helvetica, sans-serif;" +
"\">Softech Infosys</p></td>");
msg.append("</tr>");
msg.append("</table>");
msg.append("</div>");
msg.append("</body>");
msg.append("</html>");

//

message.setText(msg.toString());
Multipart mp = new MimeMultipart();
MimeBodyPart htmlPart = new MimeBodyPart();
htmlPart.setContent(msg.toString(), "text/html");
mp.addBodyPart(htmlPart);
message.setContent(mp);

Transport.send(message);
msgFlag=true;
System.out.println("***Done Sending Mail***");

} catch (MessagingException e) {
throw new RuntimeException(e);
}
return msgFlag;
}
}
  
