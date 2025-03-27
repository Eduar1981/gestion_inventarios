<?php
require 'pdo.php';
session_start();

if (!isset($_SESSION['documento'])) {
    header('Location: index.php');
    exit();
}


$estado = 'activo';
$stmt = $pdo->prepare('
    SELECT `contador_categoria`, `codigo`, `nombre` 
    FROM `categorias` 
    WHERE `estado` = :activo 
    ORDER BY `contador_categoria` DESC 
    LIMIT 15;'); 
$stmt->bindParam(':activo', $estado);
$stmt->execute();

$categorias = $stmt->fetchAll(PDO::FETCH_OBJ);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorias</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="style/css/menu.css">
    <link rel="stylesheet" href="style/css/ver_categorias.css">
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
                <h4>LISTADO DE CATEGORIAS</h4>
            </div>  

            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a href="registrar_categoria.php" id="add_categoria">
                    <i class='bx bx-plus-circle'></i>
                    <p>Nueva Categoria</p>
                </a>
            <?php endif; ?>
        </section>
        
        <section id="datos">

            <!-- Mostrar el mensaje si existe -->
            <?php if (isset($_SESSION['mensaje'])): ?>
                <p><?= $_SESSION['mensaje']; ?></p>
                <?php unset($_SESSION['mensaje']); // Borrar mensaje ?>
            <?php endif; ?>

            <input type="text" id="buscarCategoria" placeholder="Busca código o nombre..." autocomplete="off">
            
          
            <table id="datos_categoria">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="tablaCategorias">
                    <?php if ($categorias): ?>
                        <?php foreach ($categorias as $categoria): ?>
                            <tr id="fila_<?= $categoria->contador_categoria ?>">
                                <td><?= htmlspecialchars($categoria->codigo) ?></td>
                                <td><?= htmlspecialchars($categoria->nombre) ?></td>
                                
                            
                                <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador'): ?>
                                    <td>
                                        <a href="editar_categoria.php?contador_categoria=<?= $categoria->contador_categoria ?>">
                                            <i class="lni lni-pencil"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="eliminar_categoria.php?contador_categoria=<?= htmlspecialchars($categoria->contador_categoria) ?>" title="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar esta categoria?');">
                                            <i class="lni lni-trash-can"></i>
                                        </a>
                                    </td>
                                <?php else: ?>
                                    <td><i class="lni lni-lock" title="No tienes permisos para editar"></i></td>
                                    <td><i class="lni lni-lock" title="No tienes permisos para editar"></i></td>
                                <?php endif; ?>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="7">No hay categorias para mostrar</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </section>
    </main>

    <script src="js/funciones_ver_categorias.js"></script>
</body>
</html>