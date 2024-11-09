/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
@WebServlet(name = "SvEliminarArticulo", urlPatterns = {"/SvEliminarArticulo"})
public class SvEliminarArticulo extends HttpServlet {

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
        String idArticulo = request.getParameter("idArticuloEliminar");
        String confirmacion = request.getParameter("confirmacionEliminacion");
        
       if(idArticulo != null){
           id = Integer.parseInt(idArticulo);
       }
       if(confirmacion != null){
           controladorArticulo.eliminarArticulo(id);
       }
        
        response.sendRedirect("gestionArticulos.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
