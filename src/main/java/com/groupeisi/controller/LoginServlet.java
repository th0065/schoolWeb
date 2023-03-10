package com.groupeisi.controller;


import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.groupeisi.dao.ICompte;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(value="/login",name="login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private ICompte icompte;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
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
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		
		if(login != null && password != null) {
			
			if(icompte.get(login, password)==1) {
				
				    HttpSession session = request.getSession();
		            session.setAttribute("login", login);
		            response.sendRedirect("student");

				
			}else {
				request.setAttribute("error", "Login ou mot de passe  incorrect !!!");
				 this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

			}
			
		}
		
	}

}
