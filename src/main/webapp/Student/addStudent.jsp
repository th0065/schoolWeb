<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout d'étudiant</title>


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
                
                  <form method="post" action="student" class="m-5">
                 
                   <% if(request.getAttribute("success") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-success '><%= request.getAttribute("success") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                     <% if(request.getAttribute("student") == null){%>
                
                   
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        
                        <th scope="col"> 
                        <div class="form-group">
                          <label>FirstName :</label>
                            <input class="form-input" type="text"  id="firstName" name="firstName" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                          <label>LastName  :</label>
                            <input class="form-input" type="text"  id="lastName" name="lastName" />
                          </div>
                          </th>
                           </tr>
                          <tr>
                        <th scope="col">
                         <div class="form-group">
                          <label>BirthDate :</label>
                            <input class="form-input" type="date"   id="date"  name="date" />
                          </div>
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Phone Number :</label>
                            <input class="form-input" type="text"  id="phone" name="phone" />
                          </div>
                          </th>
                       
                      </tr>
                      
                     
                        
                        
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Enregistrer</button></div>
                   <%}%> 
                   
                    <% if(request.getAttribute("success") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-success '><%= request.getAttribute("success") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
                     <% if((request.getAttribute("student") != null) && (request.getAttribute("detail") == null ) ){%>
                
                   
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        
                        <th scope="col"> 
                          <input class="" type="text" hidden value="<c:out value="${student.id}" />"  id="id" name="id" />
                        
                        <div class="form-group">
                          <label>FirstName :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.firstName}" />"  id="firstName" name="firstName" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                          <label>LastName  :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.lastName}" />" id="lastName" name="lastName" />
                          </div>
                          </th>
                           </tr>
                          <tr>
                        <th scope="col">
                         <div class="form-group">
                          <label>BirthDate : </label>
                           
                          </div>
                           <input class="form-input" type="date" value="<c:out value="${student.birthdate}" />"   id="date"  name="date" />
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Phone Number :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.phone}" />"  id="phone" name="phone" />
                          </div>
                          </th>
                       
                      </tr>
                      
                     
                        
                        
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Enregistrer</button></div>
                   <%}%> 
                   
                    <% if( (request.getAttribute("detail") != null) && (request.getAttribute("student") != null ) ){%>
                
                   
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        
                        <th scope="col"> 
                          <input class="" type="text" hidden value="<c:out value="${student.id}" />"  id="id" name="id" />
                        
                        <div class="form-group">
                          <label>FirstName :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.firstName}" />"  id="firstName" name="firstName" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                          <label>LastName  :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.lastName}" />" id="lastName" name="lastName" />
                          </div>
                          </th>
                           </tr>
                          <tr>
                        <th scope="col">
                         <div class="form-group">
                          <label>BirthDate : </label>
                         <input class="form-input" type="date" value="<c:out value="${student.birthdate}" />"  id="date" name="date" />
                           
                          </div>
                          
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Téléphone :</label>
                            <input class="form-input" type="text" value="<c:out value="${student.phone}" />"  id="phone" name="phone" />
                          </div>
                          </th>
                       
                      </tr>
                      
                      <tr> 
                        <th> <label>Insriptions</label></th>
                         </tr>
                         <tr>
                          <c:forEach var="inscr" items="${student.inscriptions}">
                         
                           <th scope="col">
                         <div class="form-group">
                          <label>Details :</label>
                            <input class="form-input" type="text" value="<c:out value="${inscr.details}" />"  id="phone" name="phone" />
                             </div>
                          </th>
                          
                          <th scope="col">
                         <div class="form-group">
                          <label>Année: </label>
                            <input class="form-input" type="text" value="<c:out value="${inscr.year.name}" />"  id="phone" name="phone" />
                         </div>
                         
                          </th>
                          </tr>
                         </c:forEach>
                         
                     
                      <tr>
                      <th> 
                      <a type="button" href="inscription?param=add" class="btn btn-sm btn-success px-5">Inscrire</a>
                      <br></th>
                       <th scope="col">
                        
                       <a type="button" href="student" class="btn btn-sm btn-danger px-5">Retour</a>
                         </th>
                        </tr>
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                 
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