document.querySelectorAll('.verMasFactComp').forEach(function (link) {
    link.addEventListener('click', function (event) {
        event.preventDefault();

        const facturaNum = this.getAttribute('data-factura');

        function formatearFecha(fechaISO) {
            const partes = fechaISO.split("-"); // [aaaa, mm, dd]
            return `${partes[2]}-${partes[1]}-${partes[0]}`; // dd-mm-aaaa
        }
        

        fetch('detalle_factura_compra.php', {
            method: 'POST',
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: `num_fact_comp=${facturaNum}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert("❌ No se pudo cargar la información de la factura.");
                return;
            }

            // ✅ Mostrar info general de la factura
            document.getElementById("facturaTitulo").textContent = data.factura.num_fact_comp;
            document.getElementById("proveedorFactura").textContent = data.factura.nom_comercial;
            document.getElementById("fechaFactura").textContent = formatearFecha(data.factura.fecha_compra);
            document.getElementById("fechaPagoFactura").textContent = formatearFecha(data.factura.fecha_pago_fact_comp);
            document.getElementById("totalFactura").textContent = formatoCOP(data.factura.precio_compra_total);

            // ✅ Construir tabla de productos
            let detalleHTML = `<table border="1">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio Compra</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>`;

            data.productos.forEach(prod => {
                const subtotal = prod.cantidad * prod.precio_compra;
                detalleHTML += `
                    <tr>
                        <td>${prod.nombre}</td>
                        <td>${prod.descripcion}</td>
                        <td>${prod.cantidad}</td>
                        <td>${formatoCOP(prod.precio_compra)}</td>
                        <td>${formatoCOP(subtotal)}</td>
                    </tr>`;
            });

            detalleHTML += `</tbody></table>`;

            document.getElementById("detalleFactura").innerHTML = detalleHTML;

            // ✅ Mostrar modal
            document.getElementById("modalFactura").style.display = "block";
        })
        .catch(error => {
            console.error("❌ Error:", error);
            document.getElementById("detalleFactura").innerHTML = "<p style='color:red;'>Error al cargar los datos.</p>";
        });
    });
});

// ✅ Cerrar modal
document.getElementById("cerrarModal").addEventListener("click", function () {
    document.getElementById("modalFactura").style.display = "none";
});

// ✅ Cerrar al hacer clic fuera del modal
window.addEventListener("click", function (e) {
    const modal = document.getElementById("modalFactura");
    if (e.target === modal) {
        modal.style.display = "none";
    }
});

// ✅ Función para formatear precios en pesos colombianos
function formatoCOP(valor) {
    return new Intl.NumberFormat("es-CO", {
        style: "currency",
        currency: "COP",
        minimumFractionDigits: 0
    }).format(valor);
};

/* Este bloque controla la funcionalidad del buscador, mostrar sugerencias */
$(document).ready(function() {

    // 1. Búsqueda dinámica
    $("#buscarFactura").on("keyup", function() {
        let query = $(this).val().trim();
        
        if (query.length >= 3) {
            $.ajax({
                url: "buscar_facturas_compras.php",
                type: "GET",
                data: { q: query },
                dataType: "json",
                success: function(data) {
                    let tablaFacturas = $("#tablaFacturas");
                    tablaFacturas.empty();
                    
                    if (data.length > 0) {
                        data.forEach(fact => {
                            tablaFacturas.append(`
                                <tr id="fila_${fact.cont_fact_compra}">
                                    <td>${fact.nombre}</td>
                                    <td>${fact.celular}</td>
                                    <td>${fact.correo}</td>
                                    <td>
                                        <a href="editar_fact_compra.php?cont_fact_compra=${fact.cont_fact_compra}">
                                            <i class="lni lni-pencil"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="eliminar_fact_compra.php?cont_fact_compra=${fact.cont_fact_compra}" title="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar esta factura?');">
                                            <i class="lni lni-trash-can"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="#" class="verMasFactComp" data-id="${fact.cont_fact_compra}">
                                            <i class='bx bx-plus-circle'></i>
                                        </a>
                                    </td>
                                </tr>
                            `);
                        });
                    } else {
                        tablaFacturas.append('<tr><td colspan="6">No se encontraron facturass</td></tr>');
                    }
                }
            });
        } else if (query.length === 0) {
            $.ajax({
                url: "buscar_facturas_compras.php",
                type: "GET",
                data: { q: "" },
                dataType: "json",
                success: function(data) {
                    const tablaFacturas = $("#tablaFacturas");
                    tablaFacturas.empty();

                    if (data.length > 0) {
                        data.forEach(cat => {
                            tablaFacturas.append(`
                                <tr id="fila_${fact.cont_fact_compra}">
                                    <td>${fact.nombre}</td>
                                    <td>${cat.celular}</td>
                                    <td>${fact.correo}</td>
                                    <td>
                                        <a href="editar_fact_compra.php?cont_fact_compra=${fact.cont_fact_compra}">
                                            <i class="lni lni-pencil"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="eliminar_fact_compra.php?cont_fact_compra=${fact.cont_fact_compra}" title="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar esta factura?');">
                                            <i class="lni lni-trash-can"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="#" class="verMasFactComp" data-id="${fact.cont_fact_compra}">
                                            <i class='bx bx-plus-circle'></i>
                                        </a>
                                    </td>
                                </tr>
                            `);
                        });
                    } else {
                        tablaFacturas.append('<tr><td colspan="6">No se encontraron facturas</td></tr>');
                    }
                }
            });
        }

    });

    // 2. Delegar el click para ver más (modal)
    $(document).on("click", ".verMasFactComp", function(e) {
        e.preventDefault();
        const facturaID = $(this).data("id");
        /* console.log("Abrir modal para factura:", facturaID); */
        $("#miModal").show(); // Aquí muestras el modal que ya tienes en HTML
    });

});
