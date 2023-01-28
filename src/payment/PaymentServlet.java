package payment;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import payment.DBconnecter; 

@WebServlet("/PaymentServlet") 
public class PaymentServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 

		throws ServletException, IOException 
	{ 
		try { 

			
			Connection con = DBconnecter.initializeDatabase(); 

			
			PreparedStatement st = con 
				.prepareStatement("insert into pay values(?,?,?,?,?)"); 

			st.setInt(1, Integer.valueOf(request.getParameter("Pid"))); 
			st.setString(2, String.valueOf(request.getParameter("EIname")));
			st.setString(3, String.valueOf(request.getParameter("Pmethod")));
			st.setString(4, String.valueOf(request.getParameter("Pdate"))); 
			st.setString(5, String.valueOf(request.getParameter("Pprice"))); 
			
			
			st.executeUpdate(); 

			
			st.close(); 
			con.close(); 

			 
			PrintWriter out = response.getWriter(); 

			
			RequestDispatcher rd = request.getRequestDispatcher("/PaymentView.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 

}