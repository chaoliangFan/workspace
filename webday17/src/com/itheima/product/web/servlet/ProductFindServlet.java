package com.itheima.product.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.Product;
import com.itheima.product.service.ProductService;

/**
 * Servlet implementation class ProductFindServlet
 */
public class ProductFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String pid = request.getParameter("pid");
		ProductService productService = new ProductService();
		Product product = productService.find(pid);
		request.setAttribute("product", product);
		request.getRequestDispatcher("/jsp/editProduct.jsp").forward(request, response);
		
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
