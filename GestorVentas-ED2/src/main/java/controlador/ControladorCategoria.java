package controlador;

import Conexion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;

/**
 *
 * @author Usuario 1
 */
public class ControladorCategoria {

    /**
     * Metodo para obtener todas las categorias existentes
     */
    public List<Categoria> obtenerCategorias() {
        List<Categoria> listaCategorias = new ArrayList<>();

        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establecer la conexión
            conexion = Conectar.getConexion();

            // Consulta SQL para obtener todas las categorías
            String sql = "SELECT * FROM categorias";
            ps = conexion.prepareStatement(sql);

            // Ejecutar la consulta
            rs = ps.executeQuery();

            // Procesar los resultados
            while (rs.next()) {
                int idCategoria = rs.getInt("idCategoria");
                String categoria = rs.getString("categoria");

                // Crear un objeto Categoria y agregarlo a la lista
                Categoria cat = new Categoria(idCategoria, categoria);
                listaCategorias.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Liberar recursos
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

        return listaCategorias;
    }

    /**
     * Metodo para agregar una categoria
     *
     * @param categoria
     * @return
     */
    public boolean agregarCategoria(String categoria) {
        boolean categoriaAgregada = false;

        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            // Establecer la conexión
            conexion = Conectar.getConexion();

            // Consulta SQL para insertar la nueva categoría
            String sql = "INSERT INTO categorias (categoria) VALUES (?)";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, categoria);  // Establecemos el valor de la categoría

            // Ejecutar la consulta
            int filasAfectadas = ps.executeUpdate();

            // Si se insertó al menos una fila, se considera que se agregó correctamente
            if (filasAfectadas > 0) {
                categoriaAgregada = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Liberar recursos
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

        return categoriaAgregada;
    }

    /**
     * Metodo para eliminar una categoria
     *
     * @param id
     * @return
     */
    public boolean eliminarCategoria(int id) {
        boolean categoriaEliminada = false;
        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            // Establecer la conexión con la base de datos
            conexion = Conectar.getConexion();

            // Consulta SQL para eliminar la categoría
            String sql = "DELETE FROM categorias WHERE idCategoria = ?";

            // Preparar la consulta
            ps = conexion.prepareStatement(sql);

            // Establecer el valor del parámetro (ID de la categoría a eliminar)
            ps.setInt(1, id);

            // Ejecutar la consulta
            int filasAfectadas = ps.executeUpdate();

            // Si se afectó al menos una fila, la categoría se eliminó correctamente
            if (filasAfectadas > 0) {
                categoriaEliminada = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
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

        return categoriaEliminada;
    }

    /**
     * Metodo para editar una categoria
     *
     * @param id
     * @param categoria
     * @return
     */
    public boolean editarCategoria(int id, String categoria) {
        boolean categoriaEditada = false;
        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            // Establecer la conexión con la base de datos
            conexion = Conectar.getConexion();

            // Consulta SQL para actualizar la categoría
            String sql = "UPDATE categorias SET categoria = ? WHERE idCategoria = ?";

            // Preparar la consulta
            ps = conexion.prepareStatement(sql);

            // Establecer los valores de los parámetros
            ps.setString(1, categoria);  // Establecemos el nuevo nombre de la categoría
            ps.setInt(2, id);            // Establecemos el ID de la categoría a actualizar

            // Ejecutar la consulta
            int filasAfectadas = ps.executeUpdate();

            // Si se afectó al menos una fila, la categoría se actualizó correctamente
            if (filasAfectadas > 0) {
                categoriaEditada = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
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

        return categoriaEditada;
    }

    /**
     * Metodo para obtener una categoria segun el id
     *
     * @param idCategoria El ID de la categoria a buscar
     * @return La categoria correspondiente o null si no se encuentra
     */
    public Categoria obtenerCategoriaId(int idCategoria) {
        Categoria categoria = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Consulta SQL para buscar la categoria por su ID
            String sql = "SELECT idCategoria, categoria FROM categorias WHERE idCategoria = ?";

            // Preparar la consulta
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setInt(1, idCategoria);

            // Ejecutar la consulta
            resultSet = preparedStatement.executeQuery();

            // Si se encuentra una categoria, construir el objeto
            if (resultSet.next()) {
                int id = resultSet.getInt("idCategoria");
                String nombreCategoria = resultSet.getString("categoria");
                categoria = new Categoria(id, nombreCategoria);
            } else {
                System.out.println("No se encontró la categoria con ID: " + idCategoria);
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar la categoria: " + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }

        return categoria;
    }

}
