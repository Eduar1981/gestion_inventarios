<?php
// Incluir el archivo de conexión PDO
require 'pdo.php';

session_start();

date_default_timezone_set('America/Bogota');

// Verificar si el usuario ha iniciado sesión y si tiene rol de administrador
if (!isset($_SESSION['documento']) || $_SESSION['rol'] !== 'administrador') {
    header('Location: index.php');
    exit();
}


// Verificar si el formulario ha sido enviado mediante POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Capturar y validar los datos del formulario
    $codigo = !empty($_POST['codigo']) ? trim($_POST['codigo']) : null;
    /* $referencia = !empty($_POST['referencia']) ? trim($_POST['referencia']) : null; */
    $nombre = !empty($_POST['nombre']) ? trim($_POST['nombre']) : null;
    

    $documento_operador = $_SESSION['documento'];
    $estado = 'activo';
    $tiempo_registro = date('Y-m-d H:i:s');

    if ($codigo &&  $nombre) {
        try {
            // Verificar si el código o la referencia ya existen
            $checkSql = "SELECT COUNT(*) FROM categorias WHERE codigo = :codigo";
            $checkStmt = $pdo->prepare($checkSql);
            $checkStmt->bindParam(':codigo', $codigo);
            $checkStmt->execute();
            $exists = $checkStmt->fetchColumn();

            // Si el producto ya existe
            if ($exists > 0) {
                $error_message = "Ya existe una categoria  con el mismo código.";
            } else {
                // Si no existe, proceder con la inserción
                $sql = "INSERT INTO `categorias`(`codigo`, `nombre`, `tiempo_registro`, `documento_operador`, `estado`) 
                        VALUES (:codigo, :nombre, :tiempo_registro, :documento_operador, :estado)";

                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':codigo', $codigo);
                $stmt->bindParam(':nombre', $nombre);
                $stmt->bindParam(':tiempo_registro', $tiempo_registro);
                $stmt->bindParam(':documento_operador', $documento_operador);
                $stmt->bindParam(':estado', $estado);

                if ($stmt->execute()) {
                    header('Location: ver_categorias.php');
                    exit();
                } else {
                    $error_message = "Error al registrar la categoria. Intenta de nuevo.";
                }
            }
        } catch (PDOException $e) {
            $error_message = "Error en la base de datos: " . $e->getMessage();
        }
    } else {
        $error_message = "Por favor, completa todos los campos.";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva Categoría</title>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="style/css/menu.css">
    <link rel="stylesheet" href="style/css/registrar_categoria.css">
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
                <a href="ver_categorias.php">
                    <i class='bx bx-left-arrow-alt'></i>
                </a>
                <h4>REGISTRAR CATEGORIAS</h4>
            </div>
        </section>

        <section id="datos">
        <?php if (!empty($error_message)): ?>
            <div class="alert alert-danger">
                <?php echo $error_message; ?>
            </div>
        <?php endif; ?>
        <!-- Mostrar el mensaje dentro de la sección principal -->
            <form action="registrar_categoria.php" method="post" id="registro_cat">
                
                <div id="section_1" class="contenedores">  

                    <div id="" class="campos">
                        <i class="lni lni-user"></i>
                        <input type="text" name="codigo" maxlength="25" minlength="1"
                        pattern="[a-zA-Z0-9#\- ]{2,25}" placeholder="Código de categoria" autofocus="" tabindex="1" required>
                    </div>

                    <div id="nombre" class="campos">
                        <i class="lni lni-user"></i>
                        <input type="text" name="nombre"
                        placeholder="Nombre de categoria" autofocus="" tabindex="2" required>
                    </div>

                    <button id="registrar" type="submit" class="btn_registrar">Registrar</button>      
                </div>
            </form>
        </section>
    </main>

</body>
</html>