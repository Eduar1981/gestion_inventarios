<?php
require 'pdo.php'; // Conexión a la base de datos

session_start(); // 🔹 Iniciar sesión para obtener `documento_operador`

header('Content-Type: application/json');

error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['error' => 'Método no permitido']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    echo json_encode(['error' => 'Error al recibir JSON']);
    exit;
}

if (!isset($data['productos']) || !isset($data['metodo_pago'])) {
    echo json_encode(['error' => 'Datos incompletos']);
    exit;
}

// 🔹 Obtener `documento_operador` desde la sesión
if (!isset($_SESSION['documento'])) {
    echo json_encode(['error' => 'Usuario no autenticado']);
    exit;
}

// 🔹 Validar que el rol sea 'administrador' o 'vendedor'
$rolesPermitidos = ['administrador', 'vendedor', 'superadmin'];
if (!in_array($_SESSION['rol'], $rolesPermitidos)) {
    echo json_encode(['error' => 'Acceso denegado. Solo administradores y vendedores pueden registrar ventas.']);
    exit;
}

try {
    $pdo->beginTransaction();

    $productos = $data['productos'];
    $metodo_pago = $data['metodo_pago'];
    $documento_operador = $_SESSION['documento']; // ✅ Tomar documento del usuario en sesión
    $recibido = isset($data['recibido']) ? $data['recibido'] : null;
    $cambio = isset($data['cambio']) ? $data['cambio'] : null;
    $estado_venta = 'activo'; // ✅ Enviar estado = 'activo'

     // 🔹 Calcular total sin descuento
     $total_sin_descuento = array_reduce($productos, function ($total, $p) {
        return $total + ($p['cantidad'] * $p['precio']);
    }, 0);

    // 🔹 Aplicar descuento si existe
    $descuento_porcentaje = isset($data['descuento_porcentaje']) ? floatval($data['descuento_porcentaje']) : 0;
    $total_venta = ($descuento_porcentaje > 0) 
        ? $total_sin_descuento * (1 - ($descuento_porcentaje / 100))  // Aplica el descuento
        : $total_sin_descuento;  // Si no hay descuento, usa el total normal

    // 🔹 Insertar en la tabla `ventas`
    $stmt = $pdo->prepare("INSERT INTO ventas (descripcion, total_venta, metodo_pago, tiempo_registro, documento_operador, estado, recibido, cambio) 
                            VALUES ('Venta de productos', ?, ?, NOW(), ?, ?, ?, ?)");
    $stmt->execute([$total_venta, $metodo_pago, $documento_operador, $estado_venta, $recibido, $cambio]);
    $cont_venta = $pdo->lastInsertId();

    // 🔹 Insertar productos en `detalle_venta`
    $stmtDetalle = $pdo->prepare("INSERT INTO detalle_venta (cont_venta, cont_producto, descripcion, cantidad_productos, sub_total, precio_unitario, porcentaje_descuento, tiempo_registro, documento_operador, estado) 
                                  VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, 'activo')");

    foreach ($productos as $producto) {
        if (!isset($producto['cont_producto'])) {
            throw new Exception("Falta `cont_producto` en producto: " . json_encode($producto));
        }
        
        $stmtDetalle->execute([
            $cont_venta,
            $producto['cont_producto'],
            $producto['nombre'], // ✅ Guardar 'nombre' como descripción
            $producto['cantidad'],
            $producto['cantidad'] * $producto['precio'], // ✅ subtotal
            $producto['precio'],
            $data['descuento_porcentaje'],
            $documento_operador
        ]);

        // 🔹 Actualizar stock en la tabla `productos`
        $stmtUpdateStock = $pdo->prepare("UPDATE productos SET cantidad = cantidad - ? WHERE cont_producto = ?");
        $stmtUpdateStock->execute([$producto['cantidad'], $producto['cont_producto']]);
    }

    $pdo->commit();
    
    echo json_encode(['success' => 'Venta registrada con éxito', 'cont_venta' => $cont_venta]);

} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['error' => 'Error en la transacción: ' . $e->getMessage()]);
}
?>
