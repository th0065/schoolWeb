<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Login Page for JEE Security</title>
<style type="text/css">H1 {color: cyan}</style>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/main.js" ></script>

</head>
<body>

<div id="warp">
 Admin Login  <% if(request.getAttribute("error") != null){%>
                <div class="row form-group">
                     <hr>
                    <div class="col-md-6 ">
                        <span class='text-danger '><%= request.getAttribute("error") %></span>
                    </div>
                     <hr>
                </div>
                    <%}%> 
  <form  action="login" method="post" id="formu">
    	<div class="admin">
			      <div class="rota">
				        <h1>ADMIN</h1>
        				<input id="login" required type="text" name="login" placeholder="login"/><br />
				        <input id="password" required type="password" name="password" placeholder="mot de passe"/>
      			</div>
    		</div>
    		<div class="cms">
      			<div class="roti">
			        	<h1>Ok</h1>
				        <button id="valid" type="submit" name="valid">Se connecter</button><br />
				        <p><a href="#">Créer compte</a> <a href="#">Mot de passe Oublié</a></p>
      </div>
    		</div>
  	</form>
</div>
   
 </body>
</html>