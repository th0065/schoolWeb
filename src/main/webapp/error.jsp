<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Erreur</title>
<style type="text/css">H1 {color: navy}</style>
</head>
<body>
  <% if(request.getAttribute("error") != null){%>
        <div class="  form-group">

                <span class='text-danger'><%= request.getAttribute("error") %></span>

        </div>
    <%}%>
<table width="500" border="0">
   <tbody>
      <tr>
         <td colspan="3" width="80%" align="center"><b><font face="Verdana" size="+2" 
             color="#15406a"> Erreur d'authentification</font></b><hr>
         </td>
      </tr>
      <tr>
         <td colspan="3" width="560" align="center" height="58" 
             valign="top"><br>Erreur d'authentification. 
            Svp, verifiez votre login et mot de passe et réessayez !!!.
            <hr>
            <a href="index.jsp">Se connecter</a>
            </td>
      </tr>
   </tbody>
</table></body>
</html>