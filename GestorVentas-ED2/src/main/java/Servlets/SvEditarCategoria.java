package Servlets;

import controlador.ControladorCategoria;
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
@WebServlet(name = "SvEditarCategoria", urlPatterns = {"/SvEditarCategoria"})
public class SvEditarCategoria extends HttpServlet {

    ControladorCategoria controladorCategoria = new ControladorCategoria();

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
        
        String idCategoriaEditar = request.getParameter("idCategoriaEditar");
        String categoriaEditar = request.getParameter("categoriaEditar");

        System.out.println("la categoria es: " + idCategoriaEditar + categoriaEditar);
        if (idCategoriaEditar != null && categoriaEditar != null) {
            controladorCategoria.editarCategoria(Integer.parseInt(idCategoriaEditar), categoriaEditar);
        }

        response.sendRedirect("gestionCategorias.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
