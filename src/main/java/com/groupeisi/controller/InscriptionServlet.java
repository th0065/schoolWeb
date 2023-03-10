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
import com.groupeisi.dao.IInscription;
import com.groupeisi.dao.IStudent;
import com.groupeisi.dao.IYear;
import com.groupeisi.entities.Courses;
import com.groupeisi.entities.Inscription;
import com.groupeisi.entities.Student;
import com.groupeisi.entities.Year;


/**
 * Servlet implementation class Inscription
 */
@WebServlet(value="/inscription", name="inscription")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private IInscription iinscription ;
	
	@EJB
	private ICourses icourses ;
	
	@EJB
	private IYear iyear ;
	
	@EJB
	private IStudent istudent ;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
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
		  
	       if(session.getAttribute("login")==null) {
	    	   this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	       }
	       Inscription inscr = new Inscription();
	       String paged = request.getParameter("page");
			int pageid=1;
	        int total = 5;
	        int limit = iinscription.list(inscr).size();
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
		 if(param!= null) {
			 Courses cours = new Courses();
	         
	         List<Courses> listCours = icourses.list(cours);
	         
             Student student = new Student();
	         
	         List<Student> listStudent = istudent.list(student);
	         
	         Year year = new Year();
	         
	         List<Year> listYear = iyear.list(year);
	        
	         request.setAttribute("listCours", listCours);
	         request.setAttribute("listYear", listYear);
	         request.setAttribute("listStudent", listStudent);
			 
			 this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
			 
		 }
		
		 String idD = request.getParameter("idP");
		 if(idD!= null) {
			 int id = Integer.parseInt(idD);
			
			 Inscription insc = iinscription.get(id, inscr);
			 
			 Courses cours = new Courses();
	         
	         List<Courses> listCours = icourses.list(cours);
	         
             Student student = new Student();
	         
	         List<Student> listStudent = istudent.list(student);
	         
	         Year year = new Year();
	         
	         List<Year> listYear = iyear.list(year);
	         request.setAttribute("insc", insc);
	         request.setAttribute("listCours", listCours);
	         request.setAttribute("listYear", listYear);
	         request.setAttribute("listStudent", listStudent);
			 
			 this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
			 
		 }
		 String idS = request.getParameter("idD");
		 
		  if(idS != null){
	        	int id =Integer.parseInt(idS);
	        	
	        	int result = iinscription.delete(id,inscr); 
	        	if(result==1) {
	        		 request.setAttribute("success", "Inscription retiré");
	        		 response.sendRedirect("inscription");

	        	}
          }
		
		
        
		Inscription inscription = new Inscription();
         
         List<Inscription> listInscription = iinscription.liste(inscription,pageid,total);
         request.setAttribute("page", page);
         request.setAttribute("pages", pages);
         request.setAttribute("listInscription", listInscription);
         this.getServletContext().getRequestDispatcher("/Inscription/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String details = request.getParameter("details");
		   String student = request.getParameter("student");
		   String cours =  request.getParameter("cours");
		   String annee = request.getParameter("annee");
		   String idM = request.getParameter("id");
		   if(idM==null) {
		   if(cours ==null || annee == null || student == null) {
			   request.setAttribute("success", "Cours ou année ou Etudiant non sélectionné");
			     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
		   }
		   else {
			   int stud_id =Integer.parseInt(student);
			   int cours_id =Integer.parseInt(cours);
			   int year_id =Integer.parseInt(annee);
			     Courses courses = new Courses();
			     Courses course = icourses.get(cours_id,courses);
			     
			     Student stud = new Student();
			     Student stude = istudent.get(stud_id,stud);
			     
			     Year year = new Year();
			     Year years = iyear.get(year_id,year);
	        	 
			  
			   Inscription inscr = new Inscription();
			    inscr.setDetails(details);
			    inscr.setCourses(course);
			    inscr.setYear(years);
			    inscr.setStudent(stude);
			    
			    if(iinscription.add(inscr)==1) {
		        	 request.setAttribute("success", "Enregistrement reussi");
	     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
		        	
		        }else {
		        	 request.setAttribute("echec", "Enregistrement Echoué lamentablement");
		    	     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
		        }
		   }
		    
		    
	       
		   } 
		   
		   if(idM !=null) {
			   if(cours ==null || annee == null || student == null) {
				   request.setAttribute("success", "Cours ou année ou Etudiant non sélectionné");
				     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
			   }
			   else {
				   int id =Integer.parseInt(idM);
				   int stud_id =Integer.parseInt(student);
				   int cours_id =Integer.parseInt(cours);
				   int year_id =Integer.parseInt(annee);
				     Courses courses = new Courses();
				     Courses course = icourses.get(cours_id,courses);
				     
				     Student stud = new Student();
				     Student stude = istudent.get(stud_id,stud);
				     
				     Year year = new Year();
				     Year years = iyear.get(year_id,year);
		        	 
				  
				   Inscription inscr = new Inscription();
				   inscr.setId(id);
				    inscr.setDetails(details);
				    inscr.setCourses(course);
				    inscr.setYear(years);
				    inscr.setStudent(stude);
				    
				    if(iinscription.update(inscr)==1) {
			        	 request.setAttribute("success", "Modification reussi");
		     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
			        	
			        }else {
			        	 request.setAttribute("echec", "Enregistrement Echoué lamentablement");
			    	     this.getServletContext().getRequestDispatcher("/Inscription/addInscription.jsp").forward(request, response);
			        }
			   }
			    
			    
		       
			   } 
		   
	}

}
