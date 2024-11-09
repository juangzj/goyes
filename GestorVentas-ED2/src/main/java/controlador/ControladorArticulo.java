package controlador;

import Conexion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Articulo;

/**
 *
 * @author Usuario 1
 */
public class ControladorArticulo {

    //metodo constructor vacio
    public ControladorArticulo() {

    }
    /**
     * Metodo para obtener los productos existentes
     * @return 
     */
    public List<Articulo> darArticulos() {
        List<Articulo> articulos = new ArrayList<>();
        Connection conexion = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // SQL para seleccionar todos los artículos
            String sql = "SELECT id, nombre, descripcion, precio, cantidad_stock FROM articulos";

            // Preparar la sentencia
            PreparedStatement pstmt = conexion.prepareStatement(sql);

            // Ejecutar la consulta
            ResultSet rs = pstmt.executeQuery();

            // Iterar sobre los resultados
            while (rs.next()) {
                // Crear un nuevo objeto Articulo usando el constructor
                Articulo articulo = new Articulo(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getDouble("precio"),
                        rs.getInt("cantidad_stock") // Cambia esto a la columna correcta
                );

                // Agregar el artículo a la lista
                articulos.add(articulo);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar errores de SQL
        } finally {
            // Cerrar la conexión
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // Manejar errores al cerrar la conexión
                }
            }
        }

        return articulos; // Retornar la lista de artículos
    }

    /**
     * Metodo para agregar un nuevo producto
     *
     * @param nombre
     * @param descripcion
     * @param precio
     * @param cantidad
     * @return
     */
    public boolean agregarProducto(String nombre, String descripcion, double precio, int cantidad) {
        boolean productoAgregado = false;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Definir la consulta SQL para insertar el producto
            String sql = "INSERT INTO articulos (nombre, descripcion, precio, cantidad_stock) VALUES (?, ?, ?, ?)";

            // Preparar la declaración
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, nombre);
            preparedStatement.setString(2, descripcion);
            preparedStatement.setDouble(3, precio);
            preparedStatement.setInt(4, cantidad);

            // Ejecutar la inserción
            int filasAfectadas = preparedStatement.executeUpdate();
            if (filasAfectadas > 0) {
                productoAgregado = true; // El producto fue agregado exitosamente
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar la excepción
        } finally {
            // Cerrar recursos
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepción en el cierre
            }
        }

        return productoAgregado; // Retornar el resultado de la inserción
    }

    /**
     * Metodo para eliminar un articulo segun el id
     *
     * @param id
     * @return
     */
    public boolean eliminarArticulo(int id) {
        boolean articuloEliminado = false;
        Connection conexion = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Crear la consulta SQL para eliminar el artículo
            String sql = "DELETE FROM articulos WHERE id = ?";

            // Preparar la declaración
            stmt = conexion.prepareStatement(sql);
            stmt.setInt(1, id); // Establecer el ID del artículo a eliminar

            // Ejecutar la consulta
            int filasAfectadas = stmt.executeUpdate();

            // Verificar si se eliminó algún registro
            if (filasAfectadas > 0) {
                articuloEliminado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de la excepción en caso de error
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return articuloEliminado;
    }

    /**
     * Metodo para editar un articulo segun el id
     *
     * @param id
     * @param nombre
     * @param descripcion
     * @param precio
     * @param stock
     * @return
     */
    public boolean editarArticulo(int id, String nombre, String descripcion, double precio, int stock) {
        boolean articuloEditado = false;
        Connection conexion = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Crear la consulta SQL para actualizar el artículo
            String sql = "UPDATE articulos SET nombre = ?, descripcion = ?, precio = ?, cantidad_stock = ? WHERE id = ?";

            // Preparar la declaración
            stmt = conexion.prepareStatement(sql);
            stmt.setString(1, nombre);            // Establecer el nuevo nombre
            stmt.setString(2, descripcion);       // Establecer la nueva descripción
            stmt.setDouble(3, precio);            // Establecer el nuevo precio
            stmt.setInt(4, stock);                // Establecer el nuevo stock
            stmt.setInt(5, id);                   // Establecer el id del artículo a editar

            // Ejecutar la consulta
            int filasAfectadas = stmt.executeUpdate();

            // Verificar si se actualizó algún registro
            if (filasAfectadas > 0) {
                articuloEditado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de la excepción en caso de error
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return articuloEditado;
    }

}
