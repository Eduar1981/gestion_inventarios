<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
</head>
<body>
    <main id="inicio">

        <div id="atras">
            <a href="ver_proveedores.php">
                <i class="lni lni-arrow-left"></i>
            </a>
        </div>
        
        <!-- Mostrar el mensaje dentro de la sección principal -->
        <?php if (!empty($error_message)): ?>
            <div class="alert alert-danger">
                <?php echo $error_message; ?>
            </div>
        <?php endif; ?>
        <h3>Registra un nuevo proveedor</h3>
        <form action="registrar_proveedores.php" method="post" id="info_registro">
            
            <div id="section_1" class="contenedores">  

                <div id="nom_comercial" class="campos">
                    <i class="lni lni-user"></i>
                    <input type="text" name="nom_comercial" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" placeholder="Nombre Comercial" autofocus="" tabindex="1" required>
                </div>

                <div class="campos">
                    <label for="tipo_persona">Tipo de persona</label>
                    <select name="tipo_persona" id="tipo_persona" class="campo_select" tabindex="2">
                        <option value="">Tipo Persona</option>
                        <option value="Natural">Natural</option>
                        <option value="Juridica">Juridica</option>
                    </select>
                </div>
                     
                <div id="nombre" class="campos">
                    <i class="lni lni-user"></i>
                    <input type="text" name="nom_representante" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" placeholder="Nombre (s)"  tabindex="3" required>
                </div>

                <div id="apellido" class="campos">
                    <!-- <p>Apellido</p> -->
                    <input type="text" name="ape_representante" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,25}" placeholder="Apellido (s)" tabindex="4" required>
                </div>

                <div class="campos">
                    <select name="tipo_documento" id="tipo_documento" class="campo_select" tabindex="5">
                        <option value="">Tipo de documento</option>
                        <option value="NIT">NIT</option>
                        <option value="Cedula de Ciudadania">Cédula de ciudadanía</option>
                        <option value="Cedula de Extranjeria">Cédula de extranjería</option>
                        <option value="Pasaporte">Pasaporte</option>
                        <option value="Estatus de Proteccion Temporal">Estatus de protección temporal (PPT)</option>
                    </select>
                </div>

                <div id="num_doc" class="campos">
                    <i class="lni lni-postcard"></i>
                    <input type="text" name="documento" pattern="[0-9]{6,12}" maxlength="12" minlength="6" autocomplete="off" placeholder="Documento" tabindex="6" required>
                </div>

                <div id="ciudad" class="campos">
                    <!-- <p>ciudad</p> -->
                    <input type="text" name="ciudad" maxlength="25" minlength="2"
                    pattern="[a-zA-Z ]{2,56}" placeholder="Ciudad" tabindex="7" required>
                </div>

                <div id="direccion" class="campos">
                    <input type="text" name="direccion" maxlength="60" minlength="10"
                    pattern="[a-zA-Z0-9#\- ]{10,60}" placeholder="Direccion" tabindex="8" required>
                </div>

            </div>

            <div id="section_2" class="contenedores">

                <div id="num_movil" class="campos">
                    <i class="lni lni-phone"></i>
                    <input type="tel" name="celular"  maxlength="10" minlength="10"  autocomplete="off" placeholder="Celular" tabindex="9" required>
                </div>

                <div id="tel_fijo" class="campos">
                    <i class='bx bx-phone'></i>
                    <input type="tel" name="tel_fijo"  maxlength="10" placeholder="Telefono Fijo" tabindex="10">
                </div>

                <div id="correo" class="campos"> 
                    <i class="lni lni-envelope"></i>
                    <input type="email" name="correo" inputmode="email" maxlength="56" placeholder="Correo" tabindex="11" required>
                </div>

           </div>

            <div id="section_3" class="contenedores">
                <button type="submit" class="btn_registrar">Registrar</button>      
            </div>
        </form>
    </main>
</body>
</html>