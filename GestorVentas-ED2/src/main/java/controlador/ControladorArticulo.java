package controlador;

import Conexion.Conectar;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
     * Método para obtener los productos existentes
     *
     * @return Lista de objetos Articulo con los datos de cada producto
     */
    public List<Articulo> darArticulos() {
        List<Articulo> articulos = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // SQL para seleccionar todos los artículos, incluyendo imagen y nombre de imagen
            String sql = "SELECT id, nombre, descripcion, precio, cantidad_stock, nombre_imagen, imagen FROM articulos";

            // Preparar la sentencia
            pstmt = conexion.prepareStatement(sql);

            // Ejecutar la consulta
            rs = pstmt.executeQuery();

            // Iterar sobre los resultados
            while (rs.next()) {
                // Crear un nuevo objeto Articulo usando el constructor
                Articulo articulo = new Articulo(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getDouble("precio"),
                        rs.getInt("cantidad_stock"),
                        rs.getString("nombre_imagen"),
                        rs.getBytes("imagen") // Obtener la imagen en bytes
                );

                // Agregar el artículo a la lista
                articulos.add(articulo);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar errores de SQL
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar errores al cerrar la conexión
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
     * @param nombreImagen
     * @param imagen
     * @return
     */
    public boolean agregarProducto(String nombre, String descripcion, double precio, int cantidad, String nombreImagen, byte[] imagen) {
        boolean productoAgregado = false;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Definir la consulta SQL para insertar el producto
            String sql = "INSERT INTO articulos (nombre, descripcion, precio, cantidad_stock, nombre_imagen, imagen) VALUES (?, ?, ?, ?, ?, ?)";

            // Preparar la declaración
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, nombre);
            preparedStatement.setString(2, descripcion);
            preparedStatement.setDouble(3, precio);
            preparedStatement.setInt(4, cantidad);
            preparedStatement.setString(5, nombreImagen);
            preparedStatement.setBytes(6, imagen); // Establecer el campo imagen como byte[]

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
     * Método para editar un artículo según el ID.
     *
     * @param id ID del artículo
     * @param nombre Nuevo nombre del artículo
     * @param descripcion Nueva descripción del artículo
     * @param precio Nuevo precio del artículo
     * @param stock Nueva cantidad en stock del artículo
     * @param nombreImagen Nuevo nombre de la imagen
     * @param imagen Nueva imagen en formato de bytes
     * @return true si el artículo fue editado correctamente, false en caso
     * contrario
     */
    public boolean editarArticulo(int id, String nombre, String descripcion, double precio, int stock, String nombreImagen, byte[] imagen) {
        boolean articuloEditado = false;
        Connection conexion = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Crear la consulta SQL para actualizar el artículo
            String sql = "UPDATE articulos SET nombre = ?, descripcion = ?, precio = ?, cantidad_stock = ?, nombre_imagen = ?, imagen = ? WHERE id = ?";

            // Preparar la declaración
            stmt = conexion.prepareStatement(sql);
            stmt.setString(1, nombre);              // Establecer el nuevo nombre
            stmt.setString(2, descripcion);         // Establecer la nueva descripción
            stmt.setDouble(3, precio);              // Establecer el nuevo precio
            stmt.setInt(4, stock);                  // Establecer el nuevo stock
            stmt.setString(5, nombreImagen);        // Establecer el nuevo nombre de la imagen
            stmt.setBytes(6, imagen);               // Establecer la nueva imagen
            stmt.setInt(7, id);                     // Establecer el id del artículo a editar

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



    // Método para mostrar la imagen
    public void mostrarImagen(int id, HttpServletResponse response) throws IOException {
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            // Configurar la respuesta HTTP para enviar la imagen
            response.setContentType("image/jpeg");  // Cambiar según el tipo de imagen
            outputStream = response.getOutputStream();

            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();

            // Consulta SQL para obtener la imagen del artículo por id
            String sql = "SELECT imagen FROM articulos WHERE id = ?";
            ps = conexion.prepareStatement(sql);
            ps.setInt(1, id); // Establecer el id del artículo

            // Ejecutar la consulta
            rs = ps.executeQuery();

            // Verificar si el artículo existe
            if (rs.next()) {
                // Obtener la imagen como InputStream
                inputStream = rs.getBinaryStream("imagen");
                bufferedInputStream = new BufferedInputStream(inputStream);
                bufferedOutputStream = new BufferedOutputStream(outputStream);

                // Leer la imagen en bloques y escribirla en el OutputStream
                int i;
                while ((i = bufferedInputStream.read()) != -1) {
                    bufferedOutputStream.write(i);
                }
                bufferedOutputStream.flush(); // Asegurarse de que se haya enviado todo el contenido
            } else {
                // Si no se encuentra la imagen, responder con error o imagen predeterminada
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada.");
            }

        } catch (SQLException | IOException e) {
            // Manejar errores
            e.printStackTrace();
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la imagen.");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        } finally {
            // Cerrar los recursos en el bloque finally
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
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                if (bufferedOutputStream != null) {
                    bufferedOutputStream.close();
                }
            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }
    }

}
