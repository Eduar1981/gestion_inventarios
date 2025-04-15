<?php
//Parametros de conexion con la DB por medio del pdo
require 'pdo.php';

session_start();

// Verifica que el cont_provee del proveedor esté presente en la URL
if (isset($_GET['cont_provee'])) {
    $cont_provee = $_GET['cont_provee'];

// Verifica si el usuario tiene permisos de administrador
if (!isset($_SESSION['rol']) || !in_array($_SESSION['rol'], ['administrador', 'superadmin'])) {
    // Puedes redirigir al usuario o mostrar un mensaje de error
    // Por ejemplo, lo redirigimos a la página principal con un mensaje
    $_SESSION['error'] = "No tienes permisos para editar proveedores.";
    header('Location: ver_proveedores.php');
    exit();
}

    // Se hace la consulta para obtener los datos del proveedor
    $stmt = $pdo->prepare("SELECT `cont_provee`, `nom_comercial`, `tipo_persona`, `tipo_documento`, `doc_proveedor`, `nom_representante`, `ape_representante`, `celular`, `tel_fijo`, `correo`, `direccion`, `ciudad` FROM `proveedores` WHERE cont_provee = :cont_provee AND estado = 'activo'");
    $stmt->bindParam(':cont_provee', $cont_provee, PDO::PARAM_INT);
    $stmt->execute();

    // Almacenar los datos del usuario
    $proveedor = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$proveedor) {
        die('No se encontró el proveedor.');
    }
    
} else {
    echo "No se ha especificado el proveedor a actualizar.";
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
            <a href="ver_proveedores.php">
                <i class="lni lni-arrow-left"></i>
            </a>
        </div>
        <h3>Actualiza los datos del proveedor</h3>
      
        <form action="actualizar_proveedor.php" method="POST" id="info_registro">
            
            <input type="hidden" name="cont_provee" value="<?= htmlspecialchars($proveedor['cont_provee']) ?>">

            <div id="section_1" class="contenedores">

                <div id="" class="">
                    <p class="letras">Tipo de Persona</p>
                    <select name="tipo_persona" id="" tabindex="6">
                        <option value="">Tipo de persona</option>
                        <option value="Juridica" <?php if ($proveedor['tipo_persona'] == 'Juridica') echo 'selected'; ?>>Juridica</option>
                        <option value="Natural" <?php if ($proveedor['tipo_persona'] == 'Natural') echo 'selected'; ?>>Natural</option>
                    </select>
                </div>

                <div id="" class="">
                    <p class="letras">Nombre Comercial</p>
                    <i class="lni lni-user"></i>
                    <input type="text" name="nom_comercial" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" value="<?= htmlspecialchars($proveedor['nom_comercial']) ?>">
                </div>

                <div id="nombre" class="campos_distancia">
                    <p class="letras">Nombre</p>
                    <i class="lni lni-user"></i>
                    <input type="text" name="nom_representante" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" value="<?= htmlspecialchars($proveedor['nom_representante']) ?>">
                </div>

                <div id="apellido" class="campos_distancia">
                    <p class="letras">Apellido</p>
                    <input type="text" name="ape_representante" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" value="<?= htmlspecialchars($proveedor['ape_representante']) ?>">
                </div>
                <div id="num_doc" class="campos_distancia">
                    <label for="tipo_documento" class="letras">Tipo de documento</label>
                    <select name="tipo_documento" id="tipo_documento" class="selecciona">
                        <option value="nit" <?php if($proveedor['tipo_documento'] == 'nit') echo 'selected'; ?>>NIT</option>
                        <option value="cedula de ciudadania" <?php if($proveedor['tipo_documento'] == 'cedula de ciudadania') echo 'selected'; ?>>Cedula de ciudadania</option>
                        <option value="cedula de extranjeria" <?php if ($proveedor['tipo_documento'] == 'cedula de extranjeria') echo 'selected'; ?>>Cedula de extranjeria</option>
                        <option value="pasaporte" <?php if ($proveedor['tipo_documento'] == 'pasaporte') echo 'selected'; ?>>Pasaporte</option>
                        <option value="estatus de proteccion temporal (PPT)" <?php if ($proveedor['tipo_documento'] == 'estatus de proteccion temporal (PPT)') echo 'selected'; ?>>Estatus de Proteccion Temporal (PPT)</option>
                    </select>
                </div>
                
                <div id="num_doc" class="campos_distancia">
                    <p class="letras">Número de documento</p>
                    <i class="lni lni-postcard"></i>
                    <input type="text" name="doc_proveedor" pattern="[0-9]{6,12}" maxlength="12" minlength="6" autocomplete="off" value="<?= htmlspecialchars($proveedor['doc_proveedor']) ?>">
                </div>
                
            </div>
        
            <div id="section_2" class="contenedores">
                
                <div id="" class="">
                    <p class="letras">Correo</p>
                    <i class="lni lni-envelope"></i>
                    <input type="email" name="correo" inputmode="email" maxlength="56" value="<?= htmlspecialchars($proveedor['correo']) ?>">
                </div>

                <div id="num_ficha" class="campos_distancia">
                    <p class="letras">Celular</p>
                    <i class='bx bx-hash'></i>
                    <input type="tel" id="" name="celular" maxlength="10" minlength="10" pattern="[0-9]{10}" value="<?= htmlspecialchars($proveedor['celular']) ?>">
                </div>
            </div>

            <div id="section_3" class="contenedores">

                <div id="num_ficha" class="campos_distancia">
                    <p class="letras">Telefoo Fijo</p>
                    <i class='bx bx-hash'></i>
                    <input type="tel" id="" name="tel_fijo" maxlength="10" minlength="10" pattern="[0-9]{10}" value="<?= htmlspecialchars($proveedor['tel_fijo']) ?>">
                </div>
                <div id="" class="">
                    <p class="letras">Ciudad</p>
                    <i class="lni lni-certificate"></i>
                    <input type="text" name="ciudad" maxlength="50" minlength="3" pattern="[a-zA-Z ]{3,50}" value="<?= htmlspecialchars($proveedor['ciudad']) ?>">
                </div>
                <div id="" class="">
                    <p class="letras">Dirección</p>
                    <i class="lni lni-certificate"></i>
                    <input type="text" name="direccion" maxlength="50" minlength="7" pattern="[a-zA-Z0-9#°\- ]{7,50}" value="<?= htmlspecialchars($proveedor['direccion']) ?>">
                </div>
                <button type="submit" class="btn_registrar">Actualizar</button>
            </div>
        </form>
    </main>
</body>
</html>