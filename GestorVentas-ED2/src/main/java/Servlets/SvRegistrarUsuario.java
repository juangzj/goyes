package Servlets;

import controlador.ControladorInicioSesion;
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
@WebServlet(name = "SvRegistrarUsuario", urlPatterns = {"/SvRegistrarUsuario"})
public class SvRegistrarUsuario extends HttpServlet {
    
    //Llamado al controlador de usuario para acceder a sus metodos
    ControladorInicioSesion controladorUsuario = new ControladorInicioSesion();
    
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
        
        //Obtenemos los datos ingresados por el usuario
        String nombre = request.getParameter("nombreRegistrar");
        String gmail = request.getParameter("emailRegistrar");
        String contrasenia = request.getParameter("contraseniaRegistrar");
        
        if(nombre != null && gmail != null && contrasenia != null){
            controladorUsuario.registrarUnNuevoUsuario(nombre, gmail, contrasenia, "Cliente");
        }
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
