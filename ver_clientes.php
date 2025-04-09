<?php
require 'pdo.php';
session_start();

if (!isset($_SESSION['documento'])) {
    header('Location: index.php');
    exit();
}

// Obtener el rol del usuario autenticado
$rol_usuario = $_SESSION['rol'];

$estado = 'activo';
$stmt = $pdo->prepare('
    SELECT `contador_clientes`, CONCAT(`nombre`," ", `apellido`) AS nombre, `celular`, `correo` FROM `clientes` WHERE `estado` = :activo 
    ORDER BY `contador_clientes` DESC
    LIMIT 15' );
$stmt->bindParam(':activo', $estado);
$stmt->execute();

$clientes = $stmt->fetchAll(PDO::FETCH_OBJ);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="style/css/menu.css">
    <link rel="stylesheet" href="style/css/ver_clientes.css">
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
                <a href="home.php">
                    <i class='bx bx-home-heart'></i>
                </a>
                <h4>Listado de clientes</h4>
                <a href="registrar_cliente.php">
                    <p>Registrar cliente</p>
                </a>
            </div>  
        </section>
        
        <section id="datos">

            <!-- Mostrar el mensaje si existe -->
            <?php if (isset($_SESSION['mensaje'])): ?>
                <p><?= $_SESSION['mensaje']; ?></p>
                <?php unset($_SESSION['mensaje']); // Borrar mensaje ?>
            <?php endif; ?>

            <input type="text" id="buscarCliente" placeholder="Busca documento o nombre..." autocomplete="off">

            <table id="datos_cliente">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Celular</th>
                        <th>Correo</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                        <th>Info</th>
                    </tr>
                </thead>
                <tbody id="tablaClientes">
                    <?php if ($clientes): ?>
                        <?php foreach ($clientes as $cliente): ?>
                            <tr>
                                <td><?= htmlspecialchars($cliente->nombre) ?></td>
                                <td><?= htmlspecialchars($cliente->celular) ?></td>
                                <td><?= htmlspecialchars($cliente->correo) ?></td>
                                
                                
                                <td>
                                    <!-- Mostrar botones solo si el usuario tiene rol de administrador -->
                                    <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador'): ?>
                                        <!-- Botón para editar -->
                                        <a href="editar_cliente.php?contador_clientes=<?= $cliente->contador_clientes ?>">
                                            <i class="lni lni-pencil"></i>
                                        </a>
                                    <?php else: ?>
                                        <i class="lni lni-lock" title="No tienes permisos para editar"></i>
                                    <?php endif; ?>
                                    <td>
                                    <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador'): ?>
                                        <!-- Botón para eliminar -->
                                        <a href="eliminar_cliente.php?contador_clientes=<?= htmlspecialchars($cliente->contador_clientes) ?>" 
                                        title="Eliminar" 
                                        onclick="return confirm('¿Estás seguro de que deseas eliminar este cliente?');">
                                            <i class="lni lni-trash-can"></i>
                                        </a>
                                    <?php else: ?>
                                        <i class="lni lni-lock" title="No tienes permisos para editar"></i>
                                    <?php endif; ?>
                                    </td>
                                    
                                    <td>
                                        <a href="#" class="verMasCliente" data-id="<?= $cliente->contador_clientes ?>">
                                            <i class='bx bx-plus-circle'></i>
                                        </a>
                                    </td>
                                        
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="7">Aun no hay clientes para mostrar</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </section>

        <!-- Modal para mostrar detalles del cliente -->
        <div id="modalCliente" style="display:none;">
            <div id="contenidoModal">
                <span id="cerrarModal">&times;</span>
                <h3>Detalles del Cliente</h3>
                <p><strong>Tipo de Persona:</strong> <span id="tipo_persona"></span></p>
                <p><strong>Tipo de Documento:</strong> <span id="tipo_documento"></span></p>
                <p><strong>Documento:</strong> <span id="documento"></span></p>
                <p><strong>Nombre:</strong> <span id="nombre"></span></p>
                <p><strong>Apellido:</strong> <span id="apellido"></span></p>
                <p><strong>Correo:</strong> <span id="correo"></span></p>
                <p><strong>Fecha de Nacimiento:</strong> <span id="fecha_nacimiento"></span></p>
                <p><strong>Ciudad:</strong> <span id="ciudad"></span></p>
                <p><strong>Dirección:</strong> <span id="direccion"></span></p>
                <p><strong>Nombre Comercial:</strong> <span id="nom_comercial"></span></p>
            </div>
        </div>
    </main>

<script src="js/funciones_ver_clientes.js"></script>
</body>
</html>