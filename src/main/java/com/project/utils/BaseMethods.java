package com.project.utils;

import com.project.model.JobApplicationVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component
@Slf4j
public class BaseMethods {

    /**
     * Sends an email to the candidate with interview details.
     *
     * @param to               - recipient's email address
     * @param name             - name of the candidate
     * @param jobApplicationVO - JobApplicationVO object containing job posting and recruiter details
     */
    public static void sendMail(String to, String name, JobApplicationVO jobApplicationVO) {

        // Sender's email credentials
        final String from = "chhayadainish@gmail.com"; // sender's email address
        final String password = "meyy wyfc sfhc xzwi"; // sender's email password (use application-specific password for better security)

        // Set up the mail server properties
        Properties properies = new Properties();
        properies.put("mail.smtp.host", "smtp.gmail.com");
        properies.put("mail.smtp.port", "465");
        properies.put("mail.smtp.auth", "true");
        properies.put("mail.smtp.starttls.enable", "true");
        properies.put("mail.smtp.starttls.required", "true");
        properies.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properies.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        // Set up a session with authentication using the provided email credentials
        Session session = Session.getInstance(properies, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password); // Authenticate with sender email and password
            }
        });

        try {
            // Create a new MimeMessage (email message)
            Message message = new MimeMessage(session);

            // Set the "From" field of the email
            message.setFrom(new InternetAddress(from));

            // Set the "To" field of the email with the recipient's email
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // Set the subject of the email
            message.setSubject("Interview Invitation and Credentials");

            // Craft the email body with a formal and professional message
            String body = "Dear " + name + ",\n\n"
                    + "We are pleased to inform you that you have been shortlisted for an interview for the position you applied for at "
                    + jobApplicationVO.getJobPostingVO().getRecruiterVO().getCompanyName() + ".\n\n"
                    + "Here are your interview details:\n\n"
                    + "Please use the following link to attend the interview:\n"
                    + jobApplicationVO.getInterviewLink() + "\n\n"
                    + "We look forward to speaking with you and discussing your qualifications further.\n\n"
                    + "Best regards,\n"
                    + jobApplicationVO.getJobPostingVO().getRecruiterVO().getFirstName()
                    + " " + jobApplicationVO.getJobPostingVO().getRecruiterVO().getLastName() + "\n"
                    + jobApplicationVO.getJobPostingVO().getRecruiterVO().getCompanyContact() + "\n"
                    + "Email: " + jobApplicationVO.getJobPostingVO().getRecruiterVO().getCompanyEmail() + "\n\n"
                    + "Note: Please ensure that you are available at the scheduled time. If you need to reschedule or have any questions, feel free to contact us.";

            // Set the email body content
            message.setText(body);

            // Send the email using the Transport.send() method
            Transport.send(message);

            // Log successful email sending
            log.info("Email sent successfully to " + to);

        } catch (Exception e) {
            // Catch any exceptions during the process and print the stack trace for debugging
            e.printStackTrace();
        }
    }
}
