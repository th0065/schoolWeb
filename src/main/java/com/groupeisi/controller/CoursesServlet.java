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

import com.groupeisi.dao.ICourses;
import com.groupeisi.entities.Courses;


/**
 * Servlet implementation class CoursesServlet
 */
@WebServlet(value="/courses",name="courses")
public class CoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB
	private ICourses icourses ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoursesServlet() {
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
	    HttpSession session = request.getSession();
	    Courses courses = new Courses();
	    String paged = request.getParameter("page");
		int pageid=1;
        int total = 5;
        int limit = icourses.list(courses).size();
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
       if(session.getAttribute("login")==null) {
    	   this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
       }
      
		 String param = request.getParameter("param");
		 if(param!= null) {
	         this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response);
 
		 }
		 
		 String idMod =request.getParameter("idP");
	        if(idMod != null){
	        	int id =Integer.parseInt(idMod);
	        	Courses cours = icourses.get(id,courses);
	        	 request.setAttribute("cours", cours);
	               
             this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response);
         }
	        
	        String idD =request.getParameter("idD");
	        if(idD != null){
	        	int id =Integer.parseInt(idD);
	        	int result = icourses.delete(id,courses);
	        	if(result==1) {
	        		 request.setAttribute("success", "Cours retiré");
	        		 response.sendRedirect("courses");

	        	}
	               
             this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response);
         }
	       
         List<Courses> listCourses = icourses.liste(courses,pageid,total);
        
         request.setAttribute("listCourses", listCourses);
         request.setAttribute("page", page);
         request.setAttribute("pages", pages);
         this.getServletContext().getRequestDispatcher("/Cours/list.jsp").forward(request, response);
         
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
		 String programme = request.getParameter("programme");
		 String idM = request.getParameter("id");
		 if(idM==null) {
		 if(name == null || programme == null) {
			 request.setAttribute("echec", "Nom ou programme vide");
	         this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response);
	          
		 }
		 else {
			 Courses cours = new Courses();
			 cours.setName(name);
			 cours.setProgramme(programme);
			 
			 if(icourses.add(cours)==1) {
				 request.setAttribute("success", "Cours enregistré avec succès");
		         this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response); 
			 }
			 
		 }
		 }else {
			 int id = Integer.parseInt(idM);
			   
			 Courses cours = new Courses();
				    cours.setId(id);
				    cours.setName(name);
				    cours.setProgramme(programme);
		        if(icourses.update(cours)==1) {
		        	 request.setAttribute("success", "Modification reussi");
	       this.getServletContext().getRequestDispatcher("/Cours/addCours.jsp").forward(request, response);
		        	
		        }
		 }
		 
	}

}
