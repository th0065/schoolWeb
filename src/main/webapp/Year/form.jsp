<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout d'une année Scolaire</title>


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
                
                  <form method="post" action="year" class="m-5">
                   <% if(request.getAttribute("years") == null){%>
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
                          <label>Name :</label>
                            <input class="form-input" type="text" placeholder="2022-2023"  id="name" name="name" />
                          </div>
                          </th>
                         
                       
                           </tr>
                       
                    </thead>
                    <tbody>
                     
                      
            
                      
                    </tbody>
                  </table>
                  <div class="m-5 "> <button type="submit" class="btn btn-sm btn-success px-5">Enregistrer</button></div>
                  
                    <%}%> 
                     <% if(request.getAttribute("years") != null){%>
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
                        
                          <label>Name :</label>
                            <input class="form-input" hidden type="text"  value="<c:out value="${years.id}" />"  id="id" name="id" />
                            <input class="form-input" type="text" value="<c:out value="${years.name}" />"  id="name" name="name" />
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