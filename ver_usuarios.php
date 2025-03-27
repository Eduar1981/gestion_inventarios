<?php
// Conexión con la DB
require 'pdo.php';

session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['documento'])) {
    header('Location: index.php');
    exit();
}

// Obtener el rol del usuario autenticado
$rol_usuario = $_SESSION['rol'];

$estado = 'activo'; // Solo mostrar usuarios activos
$usuarios = []; // Inicializamos la variable para evitar errores

// Si el usuario es "superadmin", puede ver todos los usuarios
if ($rol_usuario === 'superadmin') {
    $stmt = $pdo->prepare("SELECT contador_usuarios, nombre, apellido, rol FROM usuarios WHERE estado = :activo");
} 
// Si es "administrador", solo puede ver "administrador", "vendedor" y "almacenista"
else if ($rol_usuario === 'administrador') {
    $stmt = $pdo->prepare("SELECT contador_usuarios, nombre, apellido, rol 
                           FROM usuarios 
                           WHERE estado = :activo 
                           AND rol IN ('administrador', 'vendedor', 'almacenista')");
} 

// Solo ejecutar la consulta si $stmt fue definido
if (isset($stmt)) {
    $stmt->bindParam(':activo', $estado);
    $stmt->execute();
    $usuarios = $stmt->fetchAll(PDO::FETCH_OBJ);
}


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
    <link rel="stylesheet" href="style/css/ver_usuarios.css">
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
                <h4>LISTADO DE USUARIOS</h4>
            </div>  
        </section>

        <section id="datos">
            <table id="datos_usuario">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Rol</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                        <th>Info</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($usuarios): ?>
                        <?php foreach ($usuarios as $usuario): ?>
                            <tr>
                                <td><?= htmlspecialchars($usuario->nombre) ?></td>
                                <td><?= htmlspecialchars($usuario->apellido) ?></td>
                                <td><?= htmlspecialchars($usuario->rol) ?></td>
                                
                                
                                <td>
                                    <!-- Mostrar botones solo si el usuario tiene rol de administrador -->
                                    <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador'): ?>
                                        <!-- Botón para editar -->
                                        <a href="editar_usuario.php?contador_usuarios=<?= $usuario->contador_usuarios ?>">
                                            <i class="lni lni-pencil"></i>
                                        </a>
                                    <?php else: ?>
                                        <i class="lni lni-lock" title="No tienes permisos para editar"></i>
                                    <?php endif; ?>
                                    <td>
                                    <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador'): ?>
                                        <!-- Botón para eliminar -->
                                        <a href="eliminar_usuario.php?contador_usuarios=<?= htmlspecialchars($usuario->contador_usuarios) ?>" 
                                        title="Eliminar" 
                                        onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                            <i class="lni lni-trash-can"></i>
                                        </a>
                                    <?php else: ?>
                                        <i class="lni lni-lock" title="No tienes permisos para editar"></i>
                                    <?php endif; ?>
                                    </td>
                                    
                                    <td>
                                        <a href="#" class="verMasUsuario" data-id="<?= $usuario->contador_usuarios ?>">
                                            <i class='bx bx-plus-circle'></i>
                                        </a>
                                    </td>

                                        
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="7">No hay usuarios para mostrar</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </section>
         <!-- Modal para mostrar detalles del usuario -->
         <div id="modalUsuario" style="display:none;">
            <div id="contenidoModal">
                <span id="cerrarModal">&times;</span>
                <h3>Detalles del Usuario</h3>
                <p>Tipo de Documento: <span id="tipo_doc"></span></p>
                <p>Documento: <span id="documento"></span></p>
                <p>Nombre: <span id="nombre"></span></p>
                <p>Apellido: <span id="apellido"></span></p>
                <p>Fecha de Nacimiento: <span id="fecha_nacimiento"></span></p>
                <p>Correo: <span id="correo"></span></p>
                <p>Celular: <span id="celular"></span></p>
                <p>Dirección: <span id="direccion"></span></p>
                <p>Ciudad: <span id="ciudad"></span></p>
            </div>
        </div>
    </main>

<script>
   $(document).ready(function() {
    // Cuando se haga clic en el ícono para ver más detalles
    $('.verMasUsuario').on('click', function(e) {
        e.preventDefault();
        
        // Obtiene el contador del proveedor
        var contadorUsuarios = $(this).data('id');
        
        // Hace la solicitud AJAX al servidor
        $.ajax({
            url: 'detalle_usuario.php',
            type: 'POST',
            data: { contador_usuarios: contadorUsuarios },
            success: function(data) {
                // Parsear el JSON recibido
                var usuario = JSON.parse(data);
                
                // Mostrar los datos en el modal
                $('#tipo_doc').text(usuario.tipo_doc);
                $('#documento').text(usuario.documento);
                $('#nombre').text(usuario.nombre);
                $('#apellido').text(usuario.apellido);
                $('#fecha_nacimiento').text(usuario.fecha_nacimiento);
                $('#correo').text(usuario.correo);
                $('#celular').text(usuario.celular);
                $('#direccion').text(usuario.direccion);
                $('#ciudad').text(usuario.ciudad);
                
                // Mostrar el modal
                $('#modalUsuario').fadeIn();
            }
        });
    });

    // Cerrar el modal al hacer clic en la 'X'
    $('#cerrarModal').on('click', function() {
        $('#modalUsuario').fadeOut();
    });

    // Cerrar el modal al hacer clic fuera del contenido
    $(document).on('click', function(event) {
        var modal = $('#modalUsuario'); 
        if (event.target === modal[0]) { // Si se hace clic en el fondo del modal
            modal.fadeOut();
        }
    });
});

</script>

</body>
</html>