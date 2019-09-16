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
 * Servlet implementation class ChangeUser
 */
@WebServlet("/ChangeUser")
public class ChangeUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RegisterUser user = new RegisterUser();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUser() {
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
		doGet(request, response);
		
		System.out.println("Change user dopost");
		
		 response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. */
	            out.println("<!DOCTYPE html>");
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>Servlet ChangeUser</title>");            
	            out.println("</head>");
	            out.println("<body>");
	           
	             String id;
	            if (request.getParameter("submit").equals("Update")) {
	            	 user.setName(request.getParameter("name"));
	     	        user.setUname(request.getParameter("uname"));
	     	        user.setNIC(request.getParameter("NIC"));
	     	        user.setAddress(request.getParameter("address"));
	     	        user.setTelephone(request.getParameter("tele"));
	     	        user.setLnum(request.getParameter("lnum"));
	     	        user.setVnum(request.getParameter("vnum"));
	     	        user.setVmodel(request.getParameter("vmodel"));
	     	        user.setPass(request.getParameter("pass"));
	          HttpSession session=request.getSession();  
	         id=session.getAttribute("IDD").toString().trim();
	           String mess= user.updatedb(id);
	            if (mess.equals("success")) {
	                 response.sendRedirect("myprofile1.jsp");
	            }else{
	                out.println("<h1 style=\"color:red;\">");
	                 out.println(mess);
	                  out.println("</h1>");
	            }  
	            }if (request.getParameter("submit").equals("Delete")) {
	                 out.println("Delete");
	                  HttpSession session=request.getSession();  
	         id=session.getAttribute("IDD").toString().trim();
	              String m=  user.deletedb(id);
	               if (m.equals("success")) {
	                 response.sendRedirect("Login.jsp");
	            }
	            }
	          
	           out.println("</body>");
	            
	            
	            
	            out.println("</body>");
	            out.println("</html>");
	        }
	}
	@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
