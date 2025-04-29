import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class SendOTPServlet
 */
@WebServlet("/SendOTPServlet")
public class SendOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendOTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        HttpSession session = request.getSession();

        boolean emailExists = false;

        // Check if email exists in DB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");

            String query = "SELECT * FROM register WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                emailExists = true;
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Database error: " + e.getMessage() + "</h3>");
            return;
        }

        if (emailExists) {
            // Generate OTP
            int otp = 100000 + new Random().nextInt(900000);
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            // Email settings
            final String from = "zeelgondaliya83@gmail.com";
            final String password = "inqr zpyg giax tcak";
            String host = "smtp.gmail.com";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
				protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, password);
                }
            });

            try {
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("Chocolux OTP Verification");
                message.setText("Your OTP is: " + otp);

                Transport.send(message);
                response.sendRedirect("otp-verification.jsp");

            } catch (MessagingException e) {
                e.printStackTrace();
                response.getWriter().println("<h3>Failed to send OTP. Check email & try again.</h3>");
            }

        } else {
            // Email not found
            response.getWriter().println("<h3 style='color:red; text-align:center;'>❌ Email not found. Please try again.</h3>");
        }
    }
}