/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import controlador.ControladorUsuario;
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
@WebServlet(name = "SvEditarUsuario", urlPatterns = {"/SvEditarUsuario"})
public class SvEditarUsuario extends HttpServlet {

    ControladorUsuario controladorUsuario = new ControladorUsuario();
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
        String idUsuario = request.getParameter("idUsuarioEditar");
        String nombre = request.getParameter("nombreEditar");
        String email = request.getParameter("emailEditar");
        String rol = request.getParameter("rolEditar");
        
        
        if(idUsuario != null){
            id = Integer.parseInt(idUsuario);
        }
        if(nombre != null && email != null && rol != null){
            controladorUsuario.editarUsuario(id, nombre, email, rol);
        }
        
        response.sendRedirect("gestionUsuario.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
