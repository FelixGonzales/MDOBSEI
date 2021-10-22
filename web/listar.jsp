<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Beans.InventarioBeans" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Projecto Obsolescencia</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.html">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Mantenimiento
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Listar</a></li>
            <li><a class="dropdown-item" href="#">Editar</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Consultar</a></li>
          </ul>
        </li>
        
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
     
        <div class="container">
            <h2 align="center">Listado de inventario</h2>
            <table class="table">
                <tr gbcolor="skyblue">
                    <th>Código</th>
                    <th>Descripción</th>
                    <th>Características</th>
                    <th>Marca</th>
                    <th>año</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
                <%
                    
                    ArrayList<InventarioBeans> lista=(ArrayList<InventarioBeans>)request.getAttribute("listita");
                    for (int i=0;i<lista.size();i++){
                        InventarioBeans e=lista.get(i);
                     %>
                     <tr>
                     <td><%=e.getCodigo() %></td>
                     <td><%=e.getDescr() %></td>
                     <td><%=e.getCaract() %></td>
                     <td><%=e.getMarca() %></td>
                     <td><%=e.getAño() %></td>
                     <td><%=e.getEstado() %></td>
                     <td><a href="CRUDServlet?op=eliminar&cod=<%=e.getCodigo() %>">Eliminar</a></td>
                     <td><a href="#">Editar Estado</a></td>
                     </tr>
                     <%
                    }    
                %>
            </table>
        </div>
        
    </body>
</html>
