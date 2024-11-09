package Servlets;

import controlador.ControladorInicioSesion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvInicioSesion", urlPatterns = {"/SvInicioSesion"})
public class SvInicioSesion extends HttpServlet {

    //Llamado al controladorUsuario
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
        //Obtenemos los credenciales para iniciar sesion  

        String gmail = request.getParameter("correoIngresar");
        String contrasenia = request.getParameter("contraseniaIngresar");

        if (gmail != null && contrasenia != null) {
            String resultadoInicioSesion = controladorUsuario.iniciarSesion(gmail, contrasenia);

            if (resultadoInicioSesion != null) {
                
                
                if (resultadoInicioSesion.equals("Administrador")) {
                    response.sendRedirect("administradorVista.jsp");
                }
                if (resultadoInicioSesion.equals("Cliente")) {
                    response.sendRedirect("clienteIngresado.jsp");
                }
                if (resultadoInicioSesion.equals("Vendedor")) {
                    System.out.println("a");
                }
                
                //Obtenemos el usuario que esta en sesion
                Usuario usuarioEnSesion = controladorUsuario.obtenerUsuario(gmail);
                
                //Obtenemos la sesion 
                HttpSession miSesion = request.getSession();
                //Enviamos al usuario mediante las sesion
                miSesion.setAttribute("usuarioEnSesion" ,usuarioEnSesion );
                
                
            } else {
                response.sendRedirect("index.jsp");
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
