<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscriptions</title>

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
              <a href="inscription?param=add" class="btn btn-sm btn-primary px-5">Inscrire </a>
             
                <div class="table-responsive">
                
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        <th scope="col">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                          </div>
                        </th>
                        <th scope="col">Details</th>
                        <th scope="col">Etudiant</th>
                        <th scope="col">Cours</th>
                        <th scope="col">Année Scolaire</th>
                        <th scope="col">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                     
                      
              <c:forEach var="inscr" items="${listInscription}">
                <tr >
                 <th scope="row">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="qq" />
                          </div>
                 </th>
                    <td><c:out value="${inscr.details}" /></td>
                    <td><c:out value="${inscr.student.firstName}" /> <c:out value="${inscr.student.lastName}" /></td>
                    <td><c:out value="${inscr.courses.name}" /></td>
                     <td><c:out value="${inscr.year.name}" /></td>
                   
                   <td>
                          <a type="button" href="inscription?idD=<c:out value="${inscr.id}" />" class="btn btn-danger btn-sm px-3">
                       Delete
                          
                          </a>
                         
                           <a type="button" href="inscription?idP=<c:out value="${inscr.id}" />" class="btn btn-primary btn-sm px-3">
                           Update
                          </a>
                        </td>
                   

                </tr>
            </c:forEach>
                      
                    </tbody>
                  </table>
                  
                   <nav aria-label="Navigation for Inscriptions">
        <ul class="pagination">
            <c:if test="${page != 1}">
                <li class="page-item"><a class="page-link"
                    href="inscription?page=${ page - 1 }">Previous</a>
                </li>
            </c:if>

            <c:forEach begin="1" end="${pages}" var="i">
                <c:choose>
                    <c:when test="${ page == i}">
                        <li class="page-item active"><a class="page-link">
                                ${i} <span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link"
                            href="inscription?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${page lt pages}">
                <li class="page-item"><a class="page-link"
                    href="inscription?page=${page+1}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
               
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