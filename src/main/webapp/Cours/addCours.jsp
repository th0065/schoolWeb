<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout d'un cours</title>


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
                
                  <form method="post" action="courses" class="m-5">
                 <% if(request.getAttribute("cours") == null){%>
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
                          <label>Nom :</label>
                            <input class="form-input" type="text"  id="name" name="name" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                         
                             <textarea rows="2"  id="prosgramme" name="programme" placeholder="Programme" class="form-input"></textarea>
                          </div>
                          </th>
                           </tr>
                          
                      
                     
                        
                        
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Enregistrer</button></div>
                   <%}%> 
                   
                     <% if(request.getAttribute("cours") != null){%>
                   
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
                         <input class="" type="text" hidden value="<c:out value="${cours.id}" />"  id="id" name="id" />
                        
                        <div class="form-group">
                          <label>Nom :</label>
                            <input class="form-input" type="text" value="<c:out value="${cours.name}" />" id="name" name="name" />
                          </div>
                          </th>
                         
                        <th scope="col">
                         <div class="form-group">
                           <label>Programme :</label>
                             <input type="text"  id="prosgramme" name="programme" value="<c:out value="${cours.programme}" />"  class="form-input"/>
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