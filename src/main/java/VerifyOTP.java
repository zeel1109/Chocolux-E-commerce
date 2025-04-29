

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VerifyOTP
 */
@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Combine OTP digits from individual inputs
		// Step 1: Get individual digits from form
        String otp1 = request.getParameter("otp1");
        String otp2 = request.getParameter("otp2");
        String otp3 = request.getParameter("otp3");
        String otp4 = request.getParameter("otp4");
        String otp5 = request.getParameter("otp5");
        String otp6 = request.getParameter("otp6");

        // Step 2: Combine all digits into a single string
        String userOtp = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;

        // Step 3: Get OTP from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("otp") == null) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h2>Session expired or OTP not found. Please try again.</h2>");
            out.println("<a href='forgot-password.jsp'>Go to Forgot Password</a>");
            return;
        }

        int generatedOtp = (int) session.getAttribute("otp");

        // Step 4: Compare OTP
        if (userOtp.equals(String.valueOf(generatedOtp))) {
            // OTP is correct
            response.sendRedirect("reset-password.jsp");
        } else {
            // OTP mismatch
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Invalid OTP</title></head><body>");
            out.println("<h2 style='color:red;'>❌ Invalid OTP. Please try again.</h2>");
            out.println("<a href='otp-verification.jsp'>← Back to OTP Verification</a>");
            out.println("</body></html>");
        }
    }
}