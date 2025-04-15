<?php
require 'pdo.php';
session_start();

// Seguridad
if (!isset($_SESSION['documento']) || !in_array($_SESSION['rol'], ['superadmin', 'administrador'])) {
    header('Location: index.php');
    exit();
}

// Obtener las facturas con proveedor sin duplicados
$sql = "SELECT 
            f.num_fact_comp,
            f.fecha_compra,
            f.doc_proveedor,
            p.nom_comercial
        FROM factura_compra_proveedores f
        INNER JOIN proveedores p ON f.doc_proveedor = p.doc_proveedor
        ORDER BY p.nom_comercial ASC, f.fecha_compra DESC";

$stmt = $pdo->query($sql);
$facturas = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Agrupar por proveedor
$agrupado = [];
foreach ($facturas as $f) {
    $doc = $f['doc_proveedor'];
    $agrupado[$doc]['nom_comercial'] = $f['nom_comercial'];
    $agrupado[$doc]['facturas'][] = [
        'num_fact_comp' => $f['num_fact_comp'],
        'fecha_compra' => $f['fecha_compra']
    ];
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <link rel="stylesheet" href="style/css/ver_facturas_compras.css">
    <link rel="stylesheet" href="style/css/menu.css"> 
    
</head>
<body>

    <aside class="aside active" id="aside">
        <div class="head">
            <div class="profile">
                <img src="style/images/logo_gestion.png" alt="Gestión de Inventario - Logo">
                <p id="logo-name">Pilidev</p>   
            </div>
            <i class='bx bx-menu' id="menu"></i>
        </div>
        <div class="options">
            <a id="" href="ver_ventas.php" class="tooltip" data-tooltip="Ventas">
                <div>
                    <i class='bx bx-receipt'></i>
                    <span class="option">Ventas</span>
                </div>
            </a>

            <a id="" href="ver_productos.php" class="tooltip" data-tooltip="Productos">
                <div>
                    <i class='bx bx-package'></i>
                    <span class="option">Productos</span>
                </div>
            </a>

            <a id="" href="ver_categorias.php" class="tooltip" data-tooltip="Categorias">
                <div>
                    <i class='bx bx-category-alt'></i>
                    <span class="option">Categorias</span>
                </div>
            </a>

            <a id="" href="ver_clientes.php" class="tooltip" data-tooltip="Clientes">
                <div>
                    <i class='bx bx-group'></i>
                    <span class="option">Clientes</span>
                </div>
            </a>
            
            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a id="" href="ver_proveedores.php" class="tooltip" data-tooltip="Proveedores">
                    <div>
                        <i class='bx bxs-truck'></i>
                        <span class="option">Proveedores</span>
                    </div>
                </a>
            <?php endif; ?>

            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a id="" href="ver_compras_proveedores.php" class="tooltip" data-tooltip="Compras">
                    <div>
                        <i class='bx bxs-package'></i>
                        <span class="option">Compras Porveedores</span>
                    </div>
                </a>
            <?php endif; ?>
            
            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a id="" href="ver_usuarios.php" class="tooltip" data-tooltip="Usuarios">
                    <div>
                        <i class='bx bx-user'></i>
                        <span class="option">Usuarios</span>
                    </div>
                </a>
            <?php endif; ?>

            <a class="links tooltip" href="logout.php"  data-tooltip="Cerrar sesión">
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
                <h4>🧾 Compras a Proveedores</h4>
            </div> 
        
            <?php if ($_SESSION['rol'] === 'superadmin' || $_SESSION['rol'] === 'administrador') : ?>
                <a id="add_factura" href="registro_nueva_factura.php">
                    <i class='bx bx-plus-circle'></i>
                    <p>Nueva Factura</p>
                </a>
            <?php endif; ?>
        </section>
        
        <section id="datos">
            
        <input type="text" id="buscarFactura" placeholder="Busca numero factura o proveeedor..." autocomplete="off">

        <table id="datos_facturas">

            <thead>
                <tr>
                    <th>Proveedor</th>
                    <th>Fecha Factura</th>
                    <th>Factura N°</th>
                    <th>Más Info</th>
                </tr>
            </thead>
            <?php if (!empty($agrupado)): ?>
            <tbody>
                <?php foreach ($agrupado as $doc_proveedor => $datos): ?>
                    <?php foreach ($datos['facturas'] as $i => $fact): ?>
                        <tr>
                            <?php if ($i === 0): ?>
                                <td rowspan="<?= count($datos['facturas']) ?>">
                                    <?= htmlspecialchars($datos['nom_comercial']) ?>
                                </td>
                            <?php endif; ?>
                            <td><?= htmlspecialchars($fact['fecha_compra']) ?></td>
                            <td><?= htmlspecialchars($fact['num_fact_comp']) ?></td>
                            <td>
                                <a href="#" class="verMasFactComp" 
                                data-factura="<?= $fact['num_fact_comp'] ?>" 
                                data-proveedor="<?= $doc_proveedor ?>">
                                    <i class='bx bx-plus-circle' style="font-size: 20px;"></i>
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endforeach; ?>
            </tbody>
        </table>

        <?php else: ?>
            </table>
            <p style="text-align:center; padding: 20px;">🛒 Aún no hay compras registradas para ver.</p>
        <?php endif; ?>

        </section>

    </main>

    <!-- Modal para mostrar los productos -->
    <div id="modalFactura">
        <div id="contenidoModal">
            <div class="modal-header">
                <h3>Detalles de la Factura</h3>
                <span id="cerrarModal">&times;</span>
            </div>

            <div class="factura-info">
                <div class="info-grid">
                    <div class="info-group">
                        <label>Número Factura</label>
                        <span id="facturaTitulo"></span>
                    </div>
                    <div class="info-group">
                        <label>Proveedor</label>
                        <span id="proveedorFactura"></span>
                    </div>
                    <div class="info-group">
                        <label>Fecha Compra</label>
                        <span id="fechaFactura"></span>
                    </div>
                    <div class="info-group">
                        <label>Fecha Pago</label>
                        <span id="fechaPagoFactura"></span>
                    </div>

                    <div class="info-group">
                        <label>Total Factura</label>
                        <span id="totalFactura"></span>
                    </div>
                </div>
            </div>

            <div class="productos-section">
                <h4>Productos Comprados</h4>
                <div id="detalleFactura"></div>
            </div>

            <button id="btnImprimirFactura" class="btn-submit">Imprimir Factura</button>
        </div>
    </div>


<script src="js/funciones_ver_facturas_compras.js"></script>
</body>
</html>
