<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscription à un cours</title>


 <style><%@include file="/Student/student.css"%>
 <%@include file="/css/bootstrap.css"%>
  <%@include file="/css/fas.css"%>
 
 </style>
</head>
<body>

<section class="intro">
  <div class="bg-image h-100" style="background-color: #6095F0;">
    <div class="mask d-flex align-items-center h-100">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12">
            <div class="card shadow-2-strong" style="background-color: #f5f7fa;">
              <div class="card-body">
              <%@include file="/Student/nav.jsp"%>
             
                <div class="table-responsive">
                
                     <form method="post" action="inscription" class="m-5">
                  <% if(request.getAttribute("insc") == null){%>
               
                   <% if(request.getAttribute("success") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-success '><%= request.getAttribute("success") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                    
                      <% if(request.getAttribute("echec") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-danger '><%= request.getAttribute("echec") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                    
                
                   
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        
                        <th scope="col"> 
                        <div class="form-group">
                          <label>Details :</label>
                            <input class="form-input" type="text"  id="details" name="details" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                          <label>Etudiant  :</label>
                             <select id="student"
 							name="student" size="1" >
							  <option value="">Sélectionner un étudiant</option>
							  <c:forEach  var="stud" items="${listStudent}">
							   <option value=<c:out value="${stud.id}" />>  <c:out value="${stud.firstName}" /> <c:out value="${stud.lastName}" /> </option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                           </tr>
                          <tr>
                        <th scope="col">
                         <div class="form-group">
                          <label>Cours :</label>
                            <select id="cours"
 							name="cours" size="1" >
							  <option value="">Sélectionner un cours</option>
							  <c:forEach  var="cours" items="${listCours}">
							   <option value=<c:out value="${cours.id}" />><c:out value="${cours.name}" /></option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Année :</label>
                           <select id="annee"
 							name="annee" size="1" >
							  <option value="">Sélectionner une année </option>
							  <c:forEach  var="year" items="${listYear}">
							   <option value=<c:out value="${year.id}" />><c:out value="${year.name}" /></option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                       
                      </tr>
                      
                     
                        
                        
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Enregistrer</button></div>
                  
                   
                     <%}%> 
                   
                    <% if(request.getAttribute("insc") != null){%>
                    
                   <% if(request.getAttribute("success") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-success '><%= request.getAttribute("success") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                    
                      <% if(request.getAttribute("echec") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-danger '><%= request.getAttribute("echec") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                    
                
                   
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        
                        <th scope="col"> 
                        <div class="form-group">
                          <label>Details :</label>
                           <input class="form-input" type="text" hidden value="<c:out value="${insc.id}" />" id="id" name="id" />
                          
                            <input class="form-input" type="text" value="<c:out value="${insc.details}" />" id="details" name="details" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                          <label>Etudiant  :</label>
                             <select id="student"
 							name="student" size="1" >
							  <option value=<c:out value="${insc.student.id}" />> <c:out value="${insc.student.firstName}" /> <c:out value="${insc.student.lastName}" /></option>
							  <c:forEach  var="stud" items="${listStudent}">
							   <option value=<c:out value="${stud.id}" />>  <c:out value="${stud.firstName}" /> <c:out value="${stud.lastName}" /> </option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                           </tr>
                          <tr>
                        <th scope="col">
                         <div class="form-group">
                          <label>Cours :</label>
                            <select id="cours"
 							name="cours" size="1" >
							  <option value=<c:out value="${insc.courses.id}" />>  <c:out value="${insc.courses.name}" /></option>
							  <c:forEach  var="cours" items="${listCours}">
							   <option value=<c:out value="${cours.id}" />><c:out value="${cours.name}" /></option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Année :</label>
                           <select id="annee"
 							name="annee" size="1" >
							  <option value=<c:out value="${insc.year.id}" />> <c:out value="${insc.year.name}" /> </option>
							  <c:forEach  var="year" items="${listYear}">
							   <option value=<c:out value="${year.id}" />><c:out value="${year.name}" /></option>
							  
							  </c:forEach>
							 
							  
							</select>
                          </div>
                          </th>
                       
                      </tr>
                      
                     
                        
                        
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Modifier</button></div>
                  
                   
                     <%}%> 
                   
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>