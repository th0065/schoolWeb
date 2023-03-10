<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Année Scolaire</title>

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
            
               <a href="year?param=add" class="btn btn-sm btn-primary px-5 "> Ajouter Année </a>
              
                <div class="table-responsive">
                
                  <table class="table table-borderless mb-0">
                    <thead>
                      <tr>
                        <th scope="col">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                          </div>
                        </th>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                       
                      </tr>
                    </thead>
                    <tbody>
                     
                      
              <c:forEach var="year" items="${listYear}">
                <tr >
                 <th scope="row">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="qq" />
                          </div>
                 </th>
                    <td><c:out value="${year.id}" /></td>
                    <td><c:out value="${year.name}" /> </td>
                  
                   
                   <td>
                          <a type="button" href="year?idD=<c:out value="${year.id}" />" class="btn btn-danger btn-sm px-3">
                       Delete
                          
                          </a>
                         
                           <a type="button" href="year?idP=<c:out value="${year.id}" />" class="btn btn-info btn-sm px-3">
                          Update
                          </a>
                        </td>
                   

                </tr>
            </c:forEach>
                      
                    </tbody>
                  </table>
                   <nav aria-label="Navigation for Years">
        <ul class="pagination">
            <c:if test="${page != 1}">
                <li class="page-item"><a class="page-link"
                    href="year?page=${ page - 1 }">Previous</a>
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
                            href="year?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${page lt pages}">
                <li class="page-item"><a class="page-link"
                    href="year?page=${page+1}">Next</a>
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