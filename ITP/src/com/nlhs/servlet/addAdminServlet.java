package com.nlhs.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.nlhs.model.Admin;
import com.nlhs.service.AdminServiceImp;

/**
 * Servlet implementation class addAdminServlet
 */
@WebServlet("/addAdminServlet")
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
		maxFileSize = 10485760L, // 10 MB
		maxRequestSize = 20971520L) // 20 MB
public class addAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "uploadFiles";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminServiceImp iSImp = new AdminServiceImp();
		Admin item = new Admin();
		item.setAid(request.getParameter("a_id"));
		item.setFname(request.getParameter("a_fname"));
		item.setLname(request.getParameter("a_lname"));
		item.setAge(Integer.parseInt(request.getParameter("a_age")));

		item.setContactNumber(request.getParameter("a_contact"));
		item.setEmail(request.getParameter("a_email"));

		item.setPassword(request.getParameter("a_password"));

		// gets absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");

		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator + SAVE_DIR;
		System.out.println(savePath);
		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		// for (Part part : request.getParts()) {
		Part part2 = request.getPart("profile_image");
		System.out.println(part2.getSize());
		String fileName = extractFileName(part2);
		// refines the fileName in case it is an absolute path
		fileName = new File(fileName).getName(); // THIS IS THE ONE THARIK!!!!!!
		System.out.println("loop");
		item.setProfilePic(fileName);

		System.out.println(fileName);

		// part.write(savePath + File.separator + fileName);
		part2.write("C:\\Users\\my\\eclipse-workspace\\servlet\\NewLankaHardware\\WebContent\\profilePics"
				+ File.separator + fileName);
		// }
		String AdminAddmessage = iSImp.addAdmin(item);
		request.setAttribute("AAmessage", AdminAddmessage);
		getServletContext().getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
