<?php
require 'pdo.php';

session_start();

date_default_timezone_set('America/Bogota');

if (!isset($_SESSION['documento']) || !in_array($_SESSION['rol'], ['administrador', 'vendedor'])) { 
    // Prevenir el almacenamiento en caché
    header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
    header('Cache-Control: post-check=0, pre-check=0', false);
    header('Pragma: no-cache');

    // Redirigir al login
    header('Location: index.php');
    exit();
}

// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $productos = count($_POST['codigo_producto']); // Contar la cantidad de productos

    $error_message = ""; // Mensaje de error, si es necesario

    for ($i = 0; $i < $productos; $i++) {
        $codigo_producto = $_POST['codigo_producto'][$i];
        $referencia = $_POST['referencia'][$i];
        $nombre = $_POST['nombre'][$i];
        $descripcion = $_POST['descripcion'][$i];
        $categoria = $_POST['contador_categoria'][$i];
        $precio_compra = $_POST['precio_compra'][$i];
        $con_iva = isset($_POST['con_iva'][$i]) ? 1 : 0;
        $porcentaje_ganancia = $_POST['porcentaje_ganancia'][$i];
        $precio_venta = isset($_POST['precio_venta'][$i]) ? intval(str_replace(["$", ",", " "], "", $_POST['precio_venta'][$i])) : 0;
        /* $precio_venta = $_POST['precio_venta'][$i]; */
        $cantidad = $_POST['cantidad'][$i];
        $cantidad_minima = $_POST['cantidad_minima'][$i];
    
        $documento_operador = $_SESSION['documento'];
        $estado = 'activo'; // Estado por defecto

        $tiempo_registro = date('Y-m-d H:i:s');
    
        try {
            // Verificar si el código del producto o la referencia ya existen
            $checkSql = "SELECT COUNT(*) FROM productos WHERE codigo_producto = :codigo_producto OR referencia = :referencia";
            $checkStmt = $pdo->prepare($checkSql);
            $checkStmt->bindParam(':codigo_producto', $codigo_producto);
            $checkStmt->bindParam(':referencia', $referencia);
            $checkStmt->execute();
            $exists = $checkStmt->fetchColumn();
    
            if ($exists > 0) {
                $_SESSION['mensaje'] = "<p style='color: red;'>Ya existe un producto con el mismo código o referencia: $codigo_producto o $referencia.</p>";
                header('Location: registro_varios_productos.php'); // Redirigir a la misma página para mostrar el mensaje
                exit(); // Salir del script después de redireccionar
            }
             else {
    
                // Si no existe, insertar el producto
                $sql = "INSERT INTO productos (codigo_producto, referencia, nombre, descripcion, categoria, precio_compra, con_iva, porcentaje_ganancia, precio_venta, cantidad, cantidad_minima, tiempo_registro, documento_operador, estado) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute([$codigo_producto, $referencia, $nombre, $descripcion, $categoria, $precio_compra, $con_iva, $porcentaje_ganancia, $precio_venta, $cantidad, $cantidad_minima, $documento_operador, $estado]);
            }
        } catch (Exception $e) {
            $error_message = "Hubo un error al verificar o registrar el producto: " . $e->getMessage();
            break; // Si ocurre un error, salir del bucle
        }
    }
    
    // Verificar si hubo error en la inserción
    if ($error_message) {
        $_SESSION['mensaje'] = "<p style='color: red;'>$error_message</p>";
        header('Location: registro_varios_productos.php'); // Redirigir a la misma página para mostrar el mensaje
        exit();
    } else {
        $_SESSION['mensaje'] = "Productos registrados exitosamente.";
        header('Location: ver_productos.php'); // Redirigir a la lista de productos
        exit();
    }
    
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Productos</title>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="style/css/registro_varios_productos.css">
    <link rel="stylesheet" href="style/css/menu.css">
</head>
</head>
<body>
<aside class="aside active" id="aside">
        <div class="head">
            <div class="profile">
                <img src="style/images/mundo_pink_perfil.jpg" alt="Logo" id="logo-img">
                <p id="logo-name">Mundo pink</p>
            </div>
            <i class='bx bx-menu' id="menu"></i>
        </div>
        <div class="options">
            <a id="" href="ver_ventas.php">
                <div>
                    <i class='bx bx-receipt'></i>
                    <span class="option">Ventas</span>
                </div>
            </a>

            <a id="" href="ver_productos.php">
                <div>
                    <i class='bx bx-package'></i>
                    <span class="option">Productos</span>
                </div>
            </a>

            <a id="" href="ver_categorias.php">
                <div>
                    <i class='bx bx-category-alt'></i>
                    <span class="option">Categorias</span>
                </div>
            </a>
            
            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a id="" href="ver_usuarios.php">
                    <div>
                        <i class='bx bx-user'></i>
                        <span class="option">Usuarios</span>
                    </div>
                </a>
            <?php endif; ?>

            <a class="links" href="logout.php">
                <div>
                    <i class='bx bx-log-out'></i>
                    <span class="option">Cerrar sesión</span>
                </div>
            </a>
        </div>     
    </aside>
    
    <main id="inicio">
        <section id="barra">
            <div id="atras">
                <a href="ver_productos.php">
                    <i class='bx bx-left-arrow-alt'></i>
                </a>
                <h4>REGISTRAR PRODUCTOS</h4>
            </div>  
        </section>

        <section id="datos">
        <?php if (isset($_SESSION['mensaje'])): ?>
            <div id="mensaje-alerta">
                <?= $_SESSION['mensaje']; ?>
                <?php unset($_SESSION['mensaje']); // Borrar el mensaje después de mostrarlo ?>
            </div>
        <?php endif; ?>

        <form id="registro_prod" action="registro_varios_productos.php" method="POST">
            <input type="hidden" name="accion" id="accion" value="registrar_producto">

                <div id="productos">

                <div class="producto" id="producto_1">
                    <h3 id="num_producto">Producto 1</h3>

                    <div class="campos">
                        <input type="text" name="codigo_producto[]" required placeholder="Código">

                        <input type="text" name="referencia[]" required placeholder="Referencia">
                    </div>

                    <div class="campos">
                        <input type="text" name="nombre[]" required placeholder="Nombre">

                        <textarea name="descripcion[]" placeholder="Descripción"></textarea>
                    </div>

                    <div class="campos" id="campo_categoria">
                        <input type="text" 
                            name="categoria[]" 
                            class="campo_categoria" 
                            id="categoria_1"
                            placeholder="Busca la categoría..."
                            required
                            oninput="buscarCategorias('categoria_1', 'sugerencias_categoria_1')">

                            <input type="hidden" id="categoria_1-hidden" name="contador_categoria[]" value="" />

                        <div id="sugerencias_categoria_1" class="sugerencias"></div>
                            <button type="button" id="new_categoria" data-bs-toggle="modal" data-bs-target="#nuevaCategoriaModal"> Nueva Categoría</button>
                    </div>

                    <div class="campos">
                        <input type="text" step="0.01" name="precio_compra[]" placeholder="$ compra" class="precio_compra" oninput="formatearPrecio(this)" />

                        <div id="campo_iva">
                            <label for="con_iva[]">IVA:</label>
                            <input type="checkbox" name="con_iva[]" class="con_iva">
                        </div>
            
                        <!-- <label for="porcentaje_ganancia[]">Ganancia:</label> -->
                        <input type="number" step="0.01" name="porcentaje_ganancia[]" class="porcentaje_ganancia" placeholder="% ganancia">
                        
                    </div>
                    
                    <div class="campos">
                        <input type="text" step="0.01" name="precio_venta[]" class="precio_venta" required placeholder="Precio sugerido">
                    </div>

                    <div class="campos">
                        <input type="number" name="cantidad[]" required placeholder="Cantidad">

                        <input type="number" name="cantidad_minima[]" required placeholder="Cantidad mínima">
                    </div>
                </div>

                <div id="botones_html">
                    <button id="agregar_producto"><i class='bx bx-plus-circle'></i>Nuevo producto</button>
                    <button type="submit" id="registrar_productos">Registrar</button>
                </div>

            </form>
            
        </section>
    </main>

    <!-- Modal para Registrar Nueva Categoría -->
    <div class="modal fade" id="nuevaCategoriaModal" tabindex="-1" aria-labelledby="nuevaCategoriaModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="nuevaCategoriaModalLabel">Registrar Nueva Categoría</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <form action="registrar_nueva_categoria.php" method="POST">
                            <div class="mb-3">
                                <label for="codigoCategoria" class="form-label">Código</label>
                                <input type="text" name="codigo" class="form-control" maxlength="25" minlength="2"  placeholder="Código" required>
                            </div>
                            <div class="mb-3">
                                <label for="nombreCategoria" class="form-label">Nombre Categoría</label>
                                <input type="text" name="nombre" class="form-control" maxlength="25" minlength="2"  placeholder="Nombre" required>
                            </div>
                            <button type="submit" class="btn btn-primary" id="registrar_categoria_ajax">Registrar Categoría</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/regis_varios_produs.js"></script>

</body>
</html>
