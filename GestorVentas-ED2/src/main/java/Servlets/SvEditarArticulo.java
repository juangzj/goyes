
package Servlets;

import controlador.ControladorArticulo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEditarArticulo", urlPatterns = {"/SvEditarArticulo"})
public class SvEditarArticulo extends HttpServlet {

    ControladorArticulo controladorArticulo = new ControladorArticulo();
    int id = 0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idArticulo = request.getParameter("idArticuloEditar");
        String nombre = request.getParameter("nombreEditar");
        String descripcion = request.getParameter("descripcionEditar");
        String precio = request.getParameter("precioEditar");
        String stock = request.getParameter("stockEditar");
        
        System.out.println("la edicion es: " + idArticulo + nombre + descripcion + precio + stock);
        
        if(idArticulo != null){
            id = Integer.parseInt(idArticulo);
        }
        if(nombre != null && descripcion != null && precio != null && stock != null){
            controladorArticulo.editarArticulo(id, nombre, descripcion, Double.parseDouble(precio), Integer.parseInt(stock));
        }
        
        response.sendRedirect("gestionArticulos.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
