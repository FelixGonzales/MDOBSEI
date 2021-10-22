<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
    </head>
    <body>

        
        <div class="container">
            <h4>Login de Usuarios</h4>
            <form action="CRUDServlet">
                <table>
                    <tr>
                        <td><label for="exampleInputEmail1" class="form-label">Usuario</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="txtUsu" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="exampleInputPassword1" class="form-label">Password</label></td>
                    </tr>
                    <tr>
                        <td><input type="password" name="txtPas" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" class="btn btn-primary"></td>
                    </tr>
                </table>
                <input type="hidden" name="op" value="login">
            </form>
            <%
                if(request.getAttribute("msg")!=null){
                    String msg=request.getAttribute("msg").toString();
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=msg %>;
                    </div>
                    <%
                }

                %>
        </div>   
        
        
    </body>
</html>

