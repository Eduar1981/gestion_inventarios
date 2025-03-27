<?php
//Parametros de conexion con la DB por medio del pdo
require 'pdo.php';

session_start();

// Verifica que el contador_clientes del cliente esté presente en la URL
if (isset($_GET['contador_clientes'])) {
    $contador_clientes = $_GET['contador_clientes'];

// Verifica si el usuario tiene permisos de administrador
if (!isset($_SESSION['rol']) || ($_SESSION['rol'] !== 'superadmin' && $_SESSION['rol'] !== 'administrador')) {
    // Puedes redirigir al usuario o mostrar un mensaje de error
    // Por ejemplo, lo redirigimos a la página principal con un mensaje
    $_SESSION['error'] = "No tienes permisos para editar clientes.";
    header('Location: ver_clientes.php');
    exit();
}

    // Se hace la consulta para obtener los datos del cliente
    $stmt = $pdo->prepare("SELECT `contador_clientes`, `tipo_persona`, `tipo_documento`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `celular`, `correo`, `ciudad`, `direccion`, `nom_comercial` FROM `clientes` WHERE contador_clientes = :contador_clientes AND estado = 'activo'");
    $stmt->bindParam(':contador_clientes', $contador_clientes, PDO::PARAM_INT);
    $stmt->execute();

    // Almacenar los datos del usuario
    $cliente = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$cliente) {
        die('No se encontró el cliente.');
    }
    
} else {
    echo "No se ha especificado el cliente a actualizar.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
</head>
<body>
    <main id="inicio">
        <div id="atras">
            <a href="ver_clientes.php">
                <i class="lni lni-arrow-left"></i>
            </a>
        </div>
        <h3>Actualiza los datos del cliente</h3>

        <?php if (isset($_SESSION['error'])): ?>
            <div class="mensaje error">
                <i class="lni lni-warning"></i> <?= $_SESSION['error']; ?>
            </div>
            <?php unset($_SESSION['error']); ?>
        <?php endif; ?>

      
        <form action="actualizar_cliente.php" method="POST" id="">
            
            <input type="hidden" name="contador_clientes" value="<?= htmlspecialchars($cliente['contador_clientes']) ?>">
            

            <div id="section_1" class="contenedores">

                <div id="" class="">
                    <p class="letras">Tipo de Persona</p>
                    <select name="tipo_persona" id="" tabindex="1">
                        <option value="">Tipo de persona</option>
                        <option value="Juridica" <?php if ($cliente['tipo_persona'] == 'Juridica') echo 'selected'; ?>>Juridica</option>
                        <option value="Natural" <?php if ($cliente['tipo_persona'] == 'Natural') echo 'selected'; ?>>Natural</option>
                    </select>
                </div>

                <div id="" class="campos_distancia">
                    <label for="tipo_documento" class="letras">Tipo de documento</label>
                    <select name="tipo_documento" id="tipo_documento" class="selecciona" tabindex="2">
                        <option value="nit" <?php if($cliente['tipo_documento'] == 'nit') echo 'selected'; ?>>NIT</option>
                        <option value="cedula de ciudadania" <?php if($cliente['tipo_documento'] == 'cedula de ciudadania') echo 'selected'; ?>>Cedula de ciudadania</option>
                        <option value="cedula de extranjeria" <?php if ($cliente['tipo_documento'] == 'cedula de extranjeria') echo 'selected'; ?>>Cedula de extranjeria</option>
                        <option value="pasaporte" <?php if ($cliente['tipo_documento'] == 'pasaporte') echo 'selected'; ?>>Pasaporte</option>
                        <option value="estatus de proteccion temporal (PPT)" <?php if ($cliente['tipo_documento'] == 'estatus de proteccion temporal (PPT)') echo 'selected'; ?>>Estatus de Proteccion Temporal (PPT)</option>
                    </select>
                </div>

                <div id="" class="campos_distancia">
                    <p class="letras">Número de documento</p>
                    <i class="lni lni-postcard"></i>
                    <input type="text" name="documento" pattern="[0-9]{6,12}" maxlength="12" minlength="6" autocomplete="off" value="<?= htmlspecialchars($cliente['documento']) ?>" tabindex="3">
                </div>

                <div id="nombre" class="campos_distancia">
                    <p class="letras">Nombre</p>
                    <i class="lni lni-user"></i>
                    <input type="text" name="nombre" maxlength="25" minlength="2"
                    pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{2,25}" value="<?= htmlspecialchars($cliente['nombre']) ?>" autofocus="" tabindex="4">
                </div>

            </div>
        
            <div id="section_2" class="contenedores">
                
                <div id="apellido" class="campos_distancia">
                    <p class="letras">Apellido</p>
                    <input type="text" name="apellido" maxlength="25" minlength="2"
                    pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{2,25}" value="<?= htmlspecialchars($cliente['apellido']) ?>" tabindex="5">
                </div>

                <div id="fecha_nacimiento" class="campos_distancia">
                    <p class="letras">Fecha de Nacimiento</p>
                    <input type="date" name="fecha_nacimiento" 
                     value="<?= htmlspecialchars($cliente['fecha_nacimiento']) ?>" tabindex="6">
                </div>
                
                <div id="num_ficha" class="campos_distancia">
                    <p class="letras">Celular</p>
                    <i class='bx bx-hash'></i>
                    <input type="tel" id="" name="celular" maxlength="10" minlength="10" pattern="[0-9]{10}" value="<?= htmlspecialchars($cliente['celular']) ?>" tabindex="5">
                </div>
                
                <div id="" class="">
                    <p class="letras">Correo</p>
                    <i class="lni lni-envelope"></i>
                    <input type="email" name="correo" inputmode="email" maxlength="56" value="<?= htmlspecialchars($cliente['correo']) ?>" tabindex="4">
                </div>
                
            </div>

            <div id="section_3" class="contenedores">

                <div id="" class="">
                    <p class="letras">Ciudad</p>
                    <i class="lni lni-certificate"></i>
                    <input type="text" name="ciudad" maxlength="50" minlength="3" pattern="[a-zA-Z ]{3,50}" value="<?= htmlspecialchars($cliente['ciudad']) ?>" >
                </div>
                <div id="" class="">
                    <p class="letras">Dirección</p>
                    <i class="lni lni-certificate"></i>
                    <input type="text" name="direccion" maxlength="50" minlength="7" pattern="[a-zA-Z0-9#°\- ]{7,50}" value="<?= htmlspecialchars($cliente['direccion']) ?>" >
                </div>

                <div id="" class="">
                    <p class="letras">Nombre Comercial</p>
                    <i class="lni lni-user"></i>
                    <input type="text" name="nom_comercial" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" value="<?= htmlspecialchars($cliente['nom_comercial']) ?>" autofocus="" tabindex="1">
                </div>

                <button type="submit" class="btn_registrar">Actualizar</button>
            </div>
        </form>
    </main>
</body>
</html>