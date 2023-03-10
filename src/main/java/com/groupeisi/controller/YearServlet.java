package com.groupeisi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.groupeisi.dao.IYear;
import com.groupeisi.entities.Student;
import com.groupeisi.entities.Year;

/**
 * Servlet implementation class YearServlet
 */
@WebServlet(value="/year",name="year")
public class YearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@EJB
	private IYear iyear;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YearServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession();
	       if(session.getAttribute("login")==null) {
	    	   this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	       }
	       Year year = new Year();
	       String paged = request.getParameter("page");
			int pageid=1;
	        int total = 5;
	        int limit = iyear.list(year).size();
	        int pages = limit/total;
	        int page=1;
	        if(limit%total>0) {
	        	pages=pages+1;
	        }
			if(paged!=null) {
				pageid = Integer.parseInt(paged);
				 page = Integer.parseInt(paged);
			}
			
			
			if(pageid==1) {
				
			}else {
				pageid=pageid-1;
				pageid=pageid*total+1;
			
			}
		 String param = request.getParameter("param");
		 String idM = request.getParameter("idP");
		
		 
		  if(idM!=null) {
	    	   int id =Integer.parseInt(idM);
	       
	       	Year years = iyear.get(id,year);
	       	 request.setAttribute("years", years);
	       	
	              
	           this.getServletContext().getRequestDispatcher("/Year/form.jsp").forward(request, response);
	     
	    	   
	       }
		  String idDel = request.getParameter("idD");
	        
	        if(idDel != null){
	        	int id =Integer.parseInt(idDel);
	        	
	        	int result = iyear.delete(id,year); 
	        	if(result==1) {
	        		 request.setAttribute("success", "Année retirée");
	        		 response.sendRedirect("student");

	        	}else {
	        		 request.setAttribute("success", "Année non rétiré");
	        		 response.sendRedirect("student");
	        	}
          }
		if(param==null) {
		
		List<Year> listYear = iyear.liste(year,pageid,total);
		  request.setAttribute("page", page);
          request.setAttribute("pages", pages);
        request.setAttribute("listYear", listYear);
        this.getServletContext().getRequestDispatcher("/Year/list.jsp").forward(request,response);
        
     
       
		} 
		if(param != null) {
      	  if(param.equals("add")){
              this.getServletContext().getRequestDispatcher("/Year/form.jsp").forward(request, response);
          }

    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String idM = request.getParameter("id");
		Year yearAdd = new Year();
		if(idM == null) {
		yearAdd.setName(name);
		if (iyear.add(yearAdd)==1) {
			
			 request.setAttribute("success", "Enregistrement reussi");
		        this.getServletContext().getRequestDispatcher("/Year/form.jsp").forward(request,response);
		        
		}
			
		}
		if(idM != null) {
			int id = Integer.parseInt(idM);
			yearAdd.setId(id);
			yearAdd.setName(name);
			if(iyear.update(yearAdd)==1) {
				 request.setAttribute("success", "Modification reussi");
			        this.getServletContext().getRequestDispatcher("/Year/form.jsp").forward(request,response);
			        
				
			}
					
			
		}
	}

}
