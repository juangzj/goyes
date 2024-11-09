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
@WebServlet(name = "SvAniadirArticulo", urlPatterns = {"/SvAniadirArticulo"})
public class SvAniadirArticulo extends HttpServlet {
    
    ControladorArticulo controladorArticulo = new ControladorArticulo();
    
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
        
        String nombre = request.getParameter("nombreArticuloAgregar");
        String descripcion = request.getParameter("descripcionArticuloAgregar");
        String precio = request.getParameter("precioArticuloAgregar");
        String stock = request.getParameter("stockArticuloAgregar");
        
        if (nombre != null && descripcion != null && precio != null && stock != null) {
            controladorArticulo.agregarProducto(nombre, descripcion, Double.parseDouble(precio), Integer.parseInt(stock));
        }
        response.sendRedirect("gestionArticulos.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
