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

        // Obtener los parámetros de la solicitud
        String idArticulo = request.getParameter("idEditar");
        String nombre = request.getParameter("nombreEditar");
        String descripcion = request.getParameter("descripcionEditar");
        String precio = request.getParameter("precioEditar");
        String stock = request.getParameter("stockEditar");
        Part imagen = request.getPart("imagenEditar");

        // Validación de los parámetros
        if (idArticulo == null || nombre == null || descripcion == null || precio == null || stock == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros requeridos.");
            return;
        }

        // Obtener los valores para la imagen si se cargó una nueva
        byte[] datosImagen = null;
        String nombreImagen = null;

        if (imagen.getSize() > 0) {
            // Si se cargó una nueva imagen, obtener los datos
            try (InputStream inputStream = imagen.getInputStream()) {
                datosImagen = inputStream.readAllBytes();
            }

            // Obtener el nombre de la imagen
            nombreImagen = Paths.get(imagen.getSubmittedFileName()).getFileName().toString();
        }

        // Verificar si se cargó una imagen
        if (datosImagen == null) {
            // Si no se cargó imagen, actualizar el artículo sin imagen
            controladorArticulo.editarArticulo(Integer.parseInt(idArticulo), nombre, descripcion, Double.parseDouble(precio), Integer.parseInt(stock));
        } else {
            // Si se cargó una nueva imagen, actualizar el artículo con la imagen
            controladorArticulo.editarArticuloConImagen(Integer.parseInt(idArticulo), nombre, descripcion, Double.parseDouble(precio), Integer.parseInt(stock), nombreImagen, datosImagen);
        }

        // Redirigir al usuario después de la actualización
        response.sendRedirect("gestionArticulos.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
