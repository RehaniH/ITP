package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Admin;
import com.nlhs.model.Customer;
import com.nlhs.model.Supplier;
import com.nlhs.service.CommonServiceImp;
import com.nlhs.service.SupplierServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword");
		String supID = request.getParameter("inputID");
		System.out.println("inputemail + password :" + email + "+" + password);

		Admin admin = new Admin();
		Customer cus = new Customer();
		Supplier sup = new Supplier();

		CommonServiceImp csi = new CommonServiceImp();

		admin = csi.isValidAdmin(email, password);
		cus = csi.isValidCustomer(email, password);
		sup = csi.isValidSupplier(email, password);
		String delivery = "qwerty";
		delivery = csi.isValidDelivery(email, password);

		if (admin != null) {
			System.out.println("inside  login Servlet: " + admin.getAid() + " , " + " admin");
			HttpSession session = request.getSession();
			session.setAttribute("UserType", "Admin");
			session.setAttribute("UserID", admin.getAid());
			request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);

		} else if (cus != null) {
			System.out.println("inside  login Servlet: " + cus.getEmail() + " " + cus.getPassword() + " cus");
			HttpSession session = request.getSession();
			session.setAttribute("UserName", cus.getEmail());
			session.setAttribute("CusPassword", cus.getPassword());
//			request.getRequestDispatcher("homePage.jsp").include(request, response);
//			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homePage.jsp");
//			dispatcher.forward(request, response);
			request.getRequestDispatcher("homePage.jsp").include(request, response);

		} else if (sup != null) {
			Supplier newSup = new Supplier();
			newSup.setEmailAddress(email);
			newSup.setPassword(password);
			newSup.setSupplierID(supID);
			newSup = SupplierServiceImpl.login(newSup);

			System.out.println("inside  login Servlet: " + newSup.getEmailAddress() + " " + newSup.getPassword() + " sup");
			HttpSession session = request.getSession();
			session.setAttribute("currentSessionUser", newSup);
			session.setAttribute("suppID", newSup.getSupplierID());
			request.getRequestDispatcher("SupplierProfile.jsp").include(request, response);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SupplierProfile.jsp");
			dispatcher.forward(request, response);

		} else if (!(delivery.equals("qwerty"))) {
			System.out.println(delivery);
			if (delivery.startsWith("login")) {
				String[] details;
				details = delivery.split("/");
				HttpSession session = request.getSession();
				session.setAttribute("IDD", details[1]);
				response.sendRedirect("details.jsp");
			} else {
				response.sendRedirect("index.jsp?mess=" + delivery);
			}

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("LFMessage", "Login Failed");
			request.getRequestDispatcher("index.jsp").include(request, response);
		}

	}// end post method

}
