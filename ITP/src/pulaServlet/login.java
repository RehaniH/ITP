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
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("dopost login");
		System.out.println(request.getParameter("uname"));
		System.out.println(request.getParameter("pass"));
		//response.sendRedirect("details.jsp");
		RegisterUser user = new RegisterUser();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            String uname,pass,mess;
            String details[];
            if (request.getParameter("submit").equals("submit")) {
                 uname=request.getParameter("uname").trim();
                 pass=request.getParameter("pass");
              
                 mess=user.logUser(uname, pass);
                 out.print(mess);
                 if (mess.startsWith("login")) {
                     details=mess.split("/");
                     HttpSession session=request.getSession();  
                     session.setAttribute("IDD", details[1]);
                    response.sendRedirect("details.jsp");
                }else{
                          response.sendRedirect("Login.jsp?mess="+mess);
                 }
                 
            }
               
            out.println("</body>");
            out.println("</html>");
        }
		doGet(request, response);
	}
	
	 @Override
	    public String getServletInfo() {
	        return "Short description";
	    }


}
