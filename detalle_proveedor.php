<?php
require 'pdo.php';

session_start();

// Verifica si se ha recibido el contador del proveedor
if (isset($_POST['cont_provee'])) {
    $cont_provee = $_POST['cont_provee'];
    
    // Consulta para obtener los detalles del proveedor específico
    $statement = $pdo->prepare("
<<<<<<< HEAD
        SELECT `cont_provee`, `nom_comercial`, `tipo_persona`, `tipo_documento`, `doc_proveedor`, `nom_representante`, `ape_representante`, `celular`, `tel_fijo`, `correo`, `direccion`, `ciudad` FROM `proveedores` WHERE 
=======
        SELECT `cont_provee`, 
                `nom_comercial`, 
                `tipo_persona`, 
                `tipo_documento`, 
                `doc_proveedor`, 
                `nom_representante`, 
                `ape_representante`, 
                `celular`, 
                `tel_fijo`, 
                `correo`, 
                `direccion`, 
                `ciudad`, 
                `num_fact_comp`
        FROM `proveedores` WHERE 
>>>>>>> 72767af5e883e4866ae4dfa157f2d66ffef57fe0
            `cont_provee` = :cont_provee 
        AND `estado` = 'activo'
    ");
    $statement->bindParam(':cont_provee', $cont_provee, PDO::PARAM_INT);
    $statement->execute();
    
    $result = $statement->fetch(PDO::FETCH_OBJ);
    
    // Enviar los datos en formato JSON
    echo json_encode($result);
}
?>