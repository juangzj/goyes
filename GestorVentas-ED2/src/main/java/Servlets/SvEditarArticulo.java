
package Servlets;

import controlador.ControladorArticulo;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEditarArticulo", urlPatterns = {"/SvEditarArticulo"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class SvEditarArticulo extends HttpServlet {

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
        
        String idArticulo = request.getParameter("idEditar");
        String nombre = request.getParameter("nombreEditar");
        String descripcion = request.getParameter("descripcionEditar");
        String precio = request.getParameter("precioEditar");
        String stock = request.getParameter("stockEditar");
        Part imagen = request.getPart("imagenEditar");
        
        
      
        if(idArticulo != null && nombre != null && descripcion != null && precio != null && stock != null && imagen != null){
            
              //Obtenemos el nombre de la imagen
            String nombreImagen = Paths.get(imagen.getSubmittedFileName()).getFileName().toString();
            
            //Obtenemos los bytes de la imagen
            byte[] datosImagen;
            try(InputStream inputStream = imagen.getInputStream()){
                datosImagen = inputStream.readAllBytes();
            }
            
            
            controladorArticulo.editarArticulo(Integer.parseInt(idArticulo), nombre, descripcion, Double.parseDouble(precio), Integer.parseInt(stock), nombreImagen, datosImagen );
        }
        
        response.sendRedirect("gestionArticulos.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
