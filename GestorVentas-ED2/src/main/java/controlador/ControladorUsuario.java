/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import Conexion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

/**
 *
 * @author Usuario 1
 */
public class ControladorUsuario {

    //Metodo constructor vacio
    public ControladorUsuario() {
    }

    /**
     * Metodo para mostrar la lista de usuarios existentes
     *
     * @return
     */
    public List<Usuario> obtenerListaUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conexion = Conectar.getConexion();
            String sql = "SELECT id, nombre, email, contrasenia, rol FROM usuarios";
            ps = conexion.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Usando el constructor de la clase Usuario
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("email"),
                        rs.getString("contrasenia"), // Considera encriptar/desencriptar de ser necesario
                        rs.getString("rol")
                );

                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Considera usar un logger en un entorno de producción
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return listaUsuarios;
    }

    /**
     * Metodo para eliminar un usuario segun el id
     *
     * @param id
     * @return
     */
    public boolean eliminarUsuario(int id) {
        boolean usuarioEliminado = false;
        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            conexion = Conectar.getConexion();
            String sql = "DELETE FROM usuarios WHERE id = ?";
            ps = conexion.prepareStatement(sql);
            ps.setInt(1, id);

            // Ejecutar la actualización y verificar si se eliminó algún registro
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                usuarioEliminado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Considera usar un logger para entornos de producción
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return usuarioEliminado;
    }

    /**
     * Metodo para editar un usuario segun su id
     * @param id
     * @param nombre
     * @param email
     * @param rol
     * @return 
     */
    public boolean editarUsuario(int id, String nombre, String email, String rol) {
        boolean usuarioEditado = false;
        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            conexion = Conectar.getConexion();
            String sql = "UPDATE usuarios SET nombre = ?, email = ?, rol = ? WHERE id = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, email);
            ps.setString(3, rol);
            ps.setInt(4, id);

            // Ejecutar la actualización y verificar si se actualizó algún registro
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                usuarioEditado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Considera usar un logger para entornos de producción
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return usuarioEditado;
    }

}
