package com.groupeisi.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.groupeisi.dao.IStudent;
import com.groupeisi.entities.Student;





/**
 * Servlet implementation class StudentServlet
 */
@WebServlet(value="/student",name="student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@EJB
	private IStudent istudent ;
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
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
		String paged = request.getParameter("page");
		int pageid=1;
        int total = 5;
        Student students = new Student();
        int limit = istudent.list(students).size();
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
		
		HttpSession session = request.getSession();
	       if(session.getAttribute("login")==null) {
	    	   this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	       }
	     
	       
	        String idMod =request.getParameter("idP");
	        if(idMod != null){
	        	int id =Integer.parseInt(idMod);
	        	
	        	Student student = istudent.get(id,students);
	        	 request.setAttribute("student", student);
	               
                this.getServletContext().getRequestDispatcher("/Student/addStudent.jsp").forward(request, response);
            }
	        
	        String idDet =request.getParameter("idM");
	        if(idDet != null){
	        	int id =Integer.parseInt(idDet);
	        	
	        	 Student student = istudent.get(id,students);
	        	 request.setAttribute("student", student);
	        	 request.setAttribute("detail", "detail");
	               
                this.getServletContext().getRequestDispatcher("/Student/addStudent.jsp").forward(request, response);
            }
	        String idDel = request.getParameter("idD");
	        
	        if(idDel != null){
	        	int id =Integer.parseInt(idDel);
	        	
	        	int result = istudent.delete(id,students); 
	        	if(result==1) { 
	        		 request.setAttribute("success", "Etudiant retiré");
	        		 response.sendRedirect("student");

	        	}
            }
	        
	        String param = request.getParameter("param");


            if(param != null){
                if(param.equals("add")){
                    this.getServletContext().getRequestDispatcher("/Student/addStudent.jsp").forward(request, response);
                }



            }else{
            	 Student student = new Student();
               
                List<Student> listStudent = istudent.liste(student,pageid,total);
              
                request.setAttribute("listStudent", listStudent);
                request.setAttribute("page", page);
                request.setAttribute("pages", pages);
                this.getServletContext().getRequestDispatcher("/Student/list.jsp").forward(request, response);
                
            }
        }
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String date = request.getParameter("date");
		
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		 LocalDate birthdate = LocalDate.parse(date, formatter);
			String idS = request.getParameter("id");
			if(idS!=null) {
				int id =Integer.parseInt(idS);
				    String phone = request.getParameter("phone");
				    String firstName = request.getParameter("firstName");
				    String lastName = request.getParameter("lastName");
				    Student student = new Student();
				    student.setId(id);
			        student.setFirstName(firstName);
			        student.setLastName(lastName);
			        student.setPhone(phone);
			        student.setBirthdate(birthdate);
			        if(istudent.update(student)==1) {
			        	 request.setAttribute("success", "Modification reussi");
		       this.getServletContext().getRequestDispatcher("/Student/addStudent.jsp").forward(request, response);
			        	
			        }
			}
			
			if(idS==null) {
			   String phone = request.getParameter("phone");
			   String firstName = request.getParameter("firstName");
			   String lastName = request.getParameter("lastName");
			    Student student = new Student();
		        student.setFirstName(firstName);
		        student.setLastName(lastName);
		        student.setPhone(phone);
		        student.setBirthdate(birthdate);
		        if(istudent.add(student)==1) {
		        	 request.setAttribute("success", "Enregistrement reussi");
	       this.getServletContext().getRequestDispatcher("/Student/addStudent.jsp").forward(request, response);
		        	
		        }
			
			}
		
		 
		  
		doGet(request, response);
		   
	}

}
