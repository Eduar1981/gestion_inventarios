<?php
require 'pdo.php'; // Asegúrate de que la ruta es correcta

session_start(); // Iniciar sesión

// Verificar si se ha pasado el parámetro 'cont_provee' en la URL
if (isset($_GET['cont_provee'])) {
    $cont_provee = $_GET['cont_provee'];

// Verifica si el usuario tiene permisos de administrador
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    // Puedes redirigir al usuario o mostrar un mensaje de error
    $_SESSION['error'] = "No tienes permisos para eliminar proveedores.";
    header('Location: ver_proveedores.php');
    exit();
}

    // Preparar y ejecutar la consulta para actualizar el estado del usuario a 'inactivo'
    $stmt = $pdo->prepare("UPDATE proveedores SET estado = 'inactivo' WHERE cont_provee = :cont_provee");

    if ($stmt->execute(['cont_provee' => $cont_provee])) {
        // Mensaje de éxito
        $_SESSION['mensaje'] = "Proveedor eliminado exitosamente.";
    } else {
        // Mensaje de error
        $_SESSION['mensaje'] = "Error al eliminar el proveedor.";
    }
} else {
    $_SESSION['mensaje'] = "ID de proveedor no proporcionado.";
}

// Redirigir a la lista de proveedores después de la eliminación
header('Location: ver_proveedores.php');
exit();
?>