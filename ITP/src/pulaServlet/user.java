package pulaServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comPula.RegisterUser;

/**
 * Servlet implementation class user
 */
@WebServlet("/user")
public class user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RegisterUser user = new RegisterUser();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("Dopost method user");

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet user</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1> </h1>");

			user.setName(request.getParameter("name"));
			user.setUname(request.getParameter("uname"));
			user.setNIC(request.getParameter("NIC"));
			user.setAddress(request.getParameter("address"));
			user.setTelephone(request.getParameter("tele"));
			user.setLnum(request.getParameter("lnum"));
			user.setVnum(request.getParameter("vnum"));
			user.setVmodel(request.getParameter("vmodel"));
			user.setPass(request.getParameter("pass"));
			String r = user.inserDb();
			if (r.startsWith("Success/")) {

				try {
					String x[] = r.split("/");
					HttpSession session = request.getSession();
					session.setAttribute("IDD", x[1]);
					response.sendRedirect("Pula_Register.jsp?me=");

				} catch (Exception e) {

					out.print("error" + e);
				}

			} else {
				out.println(r);
			}

			out.println("</body>");
			out.println("</html>");
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
