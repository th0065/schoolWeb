

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand text-primary" href="#">THSchool</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       
        <li class="nav-item">
          <a class="nav-link" href="student?page=1">Etudiants</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="inscription">Inscriptions</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="courses">Cours</a>
         </li>
          <li class="nav-item">
          <a class="nav-link" href="year">Année</a>
         </li>
       
       
      </ul>
       <% if(session.getAttribute("login") != null){%>
                
      <a href="logout" class="btn btn-outline-primary px-5 m-5"> <%= session.getAttribute("login") %> <br> Déconnexion</a>
      
       <%}%> 
    </div>
  </div>
</nav>