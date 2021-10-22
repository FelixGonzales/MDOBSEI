package Servlets;

import Utils.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Beans.InventarioBeans;
import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CRUDServlet", urlPatterns = {"/CRUDServlet"})
public class CRUDServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String op=request.getParameter("op");
        
        if(op.equals("listar")){
            
            try{
                PreparedStatement psta=ConexionDB.getConexion().prepareStatement("Select * from inventario");
                ResultSet rs=psta.executeQuery();
                
                ArrayList<InventarioBeans> lista=new ArrayList<InventarioBeans>();
                
                while(rs.next()){
                    InventarioBeans inv=new InventarioBeans(rs.getString(1),
                    rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6));
                    lista.add(inv);
                }
                request.setAttribute("listita", lista);
                request.getRequestDispatcher("listar.jsp").forward(request, response);
            }catch(Exception e){
                System.out.println("Error Servlet" +e);
            }            
            
        }else if(op.equals("eliminar")){
            String cod=request.getParameter("cod");
            try{
                PreparedStatement psta=ConexionDB.getConexion().prepareStatement("delete from inventario where codigo=?");
                psta.setString(1, cod);
                psta.executeUpdate();
                request.getRequestDispatcher("CRUDServlet?op=listar").forward(request, response);
            }catch(Exception e){
                System.out.println("Error Eliminar"+e);
            }
        }else if(op.equals("insertar")){
            String cod=request.getParameter("txtCod");
            String descr=request.getParameter("txtDescr");
            String caract=request.getParameter("txtCaract");
            String marca=request.getParameter("txtMarca");
            int año=Integer.parseInt(request.getParameter("txtAño"));
            String estado=request.getParameter("txtEstado");
            try{
                PreparedStatement psta=ConexionDB.getConexion().prepareStatement("insert into inventario values(?,?,?,?,?,?)");
                psta.setString(1, cod);
                psta.setString(2, descr);
                psta.setString(3, caract);
                psta.setString(4, marca);
                psta.setInt(5, año);
                psta.setString(6, estado);
                psta.executeUpdate();
                request.getRequestDispatcher("CRUDServlet?op=listar").forward(request, response);
            }catch(Exception e){
                System.out.println("Error Eliminar: "+e);
            }
        }else if(op.equals("login")){
            String usu=request.getParameter("txtUsu");
            String pas=request.getParameter("txtPas");
            try{
                PreparedStatement psta=ConexionDB.getConexion().prepareStatement("Select * from usuarios where usuario=? and pass=?");
                psta.setString(1, usu);
                psta.setString(2, pas);
                ResultSet rs=psta.executeQuery();
                if(rs.next()){
                    request.getRequestDispatcher("CRUDServlet?op=listar").forward(request, response);
                }else{
                    String msg="Error Usuario o Password incorrecto";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }catch(Exception e){
                
            }
        }
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
