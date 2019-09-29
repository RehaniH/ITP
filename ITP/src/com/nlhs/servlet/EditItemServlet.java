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

import com.nlhs.model.Item;
import com.nlhs.service.ItemsServiceImp;

/**
 * Servlet implementation class EditItemServlet
 */
@WebServlet("/EditItemServlet")
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
		maxFileSize = 10485760L, // 10 MB
		maxRequestSize = 20971520L) // 20 MB

public class EditItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "uploadFiles";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditItemServlet() {
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

		ItemsServiceImp iSImp = new ItemsServiceImp();
		Item item = new Item();
		item.setPid(request.getParameter("product_id"));
		item.setpName(request.getParameter("product_name"));
		item.setCategory(request.getParameter("product_category"));
		item.setSupplierName(request.getParameter("supplier_name"));
		item.setSupplierContact(request.getParameter("supplier_contact"));
		item.setUnitSize(Integer.parseInt(request.getParameter("product_unitSize")));
		item.setCostPrice(Integer.parseInt(request.getParameter("cost_price")));
		item.setSellingPrice(Integer.parseInt(request.getParameter("selling_price")));
		item.setBufferStock(Integer.parseInt(request.getParameter("buffer_stock")));
		item.setpDesc(request.getParameter("product_desc"));

		System.out.println("Sevlet Item desc:" + item.getpDesc());
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
		Part part2 = request.getPart("product_image");
		System.out.println(part2.getSize());
		String fileName = extractFileName(part2);
		// refines the fileName in case it is an absolute path
		fileName = new File(fileName).getName(); // THIS IS THE ONE THARIK!!!!!!
		System.out.println("loop");
		item.setpImage(fileName);

		System.out.println(item.getpImage());

		// part.write(savePath + File.separator + fileName);
//		part2.write("C:\\Users\\my\\eclipse-workspace\\servlet\\NewLankaHardware\\WebContent\\productImages"
//				+ File.separator + fileName);
		part2.write("C:\\Users\\my\\git\\ITP\\ITP\\WebContent\\productImages" + File.separator + fileName);
		// }
		String message = iSImp.editItem(item);
		request.setAttribute("message", message);
		getServletContext().getRequestDispatcher("/inventoryManagement.jsp").forward(request, response);

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
