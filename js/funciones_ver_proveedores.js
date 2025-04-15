/* Este bloque contrla el abrir, mostrar y cerra model de evr mas info cliente */
$(document).ready(function() {

    // Usar delegación de eventos para que funcione con HTML y AJAX
    $(document).on('click', '.verMasProveedor', function(e) {
        e.preventDefault();
        
        var contadorProveedor = $(this).data('id');

        $.ajax({
            url: 'detalle_proveedor.php',
            type: 'POST',
            data: { cont_provee: contadorProveedor },
            success: function(data) {
                var proveedor = JSON.parse(data);
                
                $('#tipo_persona').text(proveedor.tipo_persona);
                $('#tipo_documento').text(proveedor.tipo_documento);
                $('#doc_proveedor').text(proveedor.doc_proveedor);
                $('#nom_comercial').text(proveedor.nom_comercial);
<<<<<<< HEAD
                $('#nom_representante').text(proveedor.nom_representante);
                $('#ape_representante').text(proveedor.ape_representante);
                $('#correo').text(proveedor.correo);
                $('#celular').text(proveedor.celular);
=======
                $('#nom_representante').text(proveedor.nom_representate);
                $('#ape_representante').text(proveedor.ape_representante);
                $('#correo').text(proveedor.correo);
>>>>>>> 72767af5e883e4866ae4dfa157f2d66ffef57fe0
                $('#tel_fijo').text(proveedor.tel_fijo);
                $('#ciudad').text(proveedor.ciudad);
                $('#direccion').text(proveedor.direccion);
                $('#num_fact_comp').text(proveedor.num_fact_comp);
                
                $('#modalProveedor').show();
            }
        });
    });

    // Cerrar modal al hacer clic fuera del contenido del modal
    $(document).on("click", function(event) {
        const modal = $("#modalProveedor");
        const contenido = $("#contenidoModal");

        // Si el modal está visible y el clic fue fuera del contenido
        if (modal.is(":visible") && !contenido.is(event.target) && contenido.has(event.target).length === 0) {
            modal.hide();
        }
    });

    // Cerrar modal al hacer clic en la X
    $('#cerrarModal').on('click', function() {
        $('#modalProveedor').hide();
    });

});

/* Este bloque controla la funcionalidad del buscador, mostrar sugerencias */
$(document).ready(function() {

// 1. Búsqueda dinámica
$("#buscarProveedor").on("keyup", function() {
    let query = $(this).val().trim();
    
    if (query.length >= 3) {
        $.ajax({
            url: "buscar_proveedores.php",
            type: "GET",
            data: { q: query },
            dataType: "json",
            success: function(data) {
                let tablaProveedores = $("#tablaProveedores");
                tablaProveedores.empty();
                
                if (data.length > 0) {
                    data.forEach(provee => {
                        tablaProveedores.append(`
                            <tr id="fila_${provee.cont_provee}">
                                <td>${provee.nombre}</td>
                                <td>${provee.celular}</td>
                                <td>${provee.correo}</td>
                                <td>
                                    <a href="editar_proveedor.php?cont_provee=${provee.cont_provee}">
                                        <i class="lni lni-pencil"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="eliminar_proveedor.php?cont_provee=${provee.cont_provee}" title="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este cliente?');">
                                        <i class="lni lni-trash-can"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" class="verMasProveedor" data-id="${provee.cont_provee}">
                                        <i class='bx bx-plus-circle'></i>
                                    </a>
                                </td>
                            </tr>
                        `);
                    });
                } else {
                    tablaProveedores.append('<tr><td colspan="6">No se encontraron proveedores</td></tr>');
                }
            }
        });
    } else if (query.length === 0) {
        $.ajax({
            url: "buscar_proveedores.php",
            type: "GET",
            data: { q: "" },
            dataType: "json",
            success: function(data) {
                const tablaProveedores = $("#tablaProveedores");
                tablaProveedores.empty();

                if (data.length > 0) {
                    data.forEach(provee => {
                        tablaProveedores.append(`
                            <tr id="fila_${provee.cont_provee}">
                                <td>${provee.nombre}</td>
                                <td>${provee.celular}</td>
                                <td>${provee.correo}</td>
                                <td>
                                    <a href="editar_proveedor.php?cont_provee=${provee.cont_provee}">
                                        <i class="lni lni-pencil"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="eliminar_proveedor.php?cont_provee=${provee.cont_provee}" title="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este cliente?');">
                                        <i class="lni lni-trash-can"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" class="verMasProveedor" data-id="${provee.cont_provee}">
                                        <i class='bx bx-plus-circle'></i>
                                    </a>
                                </td>
                            </tr>
                        `);
                    });
                } else {
                    tablaProveedores.append('<tr><td colspan="6">No se encontraron proveedores</td></tr>');
                }
            }
        });
    }

});

// 2. Delegar el click para ver más (modal)
$(document).on("click", ".verMasCliente", function(e) {
    e.preventDefault();
    const clienteID = $(this).data("id");
    /* console.log("Abrir modal para cliente:", clienteID); */
    $("#miModal").show(); // Aquí muestras el modal que ya tienes en HTML
});

<<<<<<< HEAD
});
=======
});
>>>>>>> 72767af5e883e4866ae4dfa157f2d66ffef57fe0
