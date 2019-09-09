package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginLogoutServlet")
public class LoginLogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginLogoutServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.removeAttribute("emailAddress");
		response.sendRedirect("Login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String emailAddress = request.getParameter("emailAddress");
		String password = request.getParameter("password");

		if (emailAddress.equals("sachi9@gmail.com") && password.equals("jaya")) {
			HttpSession session = request.getSession();
			session.setAttribute("emailAddress", emailAddress);
			response.sendRedirect("SupplierProfile.jsp");
		} else {
			request.setAttribute("message", "Account is invalid");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}

		/*
		 * ISupplierServices isupplierService = new SupplierServiceImpl();
		 * isupplierService.login(email, password);
		 */

		/*
		 * try { Connection connection; Statement statement;
		 * 
		 * PreparedStatement preparedStatement ;
		 * 
		 * System.out.print("Login servlet ............");
		 * 
		 * 
		 * 
		 * connection = new DBConnection().getDBConnection();
		 * 
		 * String loginQuery =
		 * "select emailAddress,password from supplier where emailAddress=? and password=?"
		 * ;
		 * 
		 * preparedStatement = connection.prepareStatement(loginQuery);
		 * preparedStatement.setString(1, emailAddress); preparedStatement.setString(2,
		 * password); ResultSet rs = preparedStatement.executeQuery(); while(rs.next())
		 * { response.sendRedirect("Login.jsp"); System.out.print("Success"); return; }
		 * response.sendRedirect("Profile.jsp"); return;
		 * 
		 * } catch (SQLException | ClassNotFoundException e) { e.printStackTrace();
		 * 
		 * }
		 */

	}

}
