document.addEventListener("DOMContentLoaded", function () { 
    // Verificar si debemos limpiar el carrito al cargar la página
    if (sessionStorage.getItem("limpiarCarrito") === "true") {
        localStorage.removeItem("carrito");
        sessionStorage.removeItem("limpiarCarrito");
    }

    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    const buscarProducto = document.getElementById("buscarProducto");
    const sugerencias = document.getElementById("sugerencias");
    const nombreProducto = document.getElementById("nombreProducto");
    const disponibleProducto = document.getElementById("disponibleProducto");
    const precioProducto = document.getElementById("precioProducto");
    const cantidadProducto = document.getElementById("cantidadProducto");
    const metodoPago = document.getElementById("metodo_pago");
    const campoRecibido = document.getElementById("campoRecibido");
    const inputRecibido = document.getElementById("recibido");
    const campoCambio = document.getElementById("campoCambio");
    const cambioSpan = document.getElementById("cambio");
    const resumenTabla = document.getElementById("resumenTabla");
    const totalVentaResumen = document.getElementById("totalVenta");
    const totalItems = document.getElementById("total_items");
    const documentoOperador = document.getElementById("documento_operador");
    
    // Nuevos elementos para el descuento
    const campoDescuento = document.getElementById("campoDescuento");
    const inputDescuento = document.getElementById("descuento");
    const resumenDescuento = document.getElementById("resumenDescuento");
    const subtotalAntesDescuento = document.getElementById("subtotalAntesDescuento");
    const valorDescuento = document.getElementById("valorDescuento");
    const totalConDescuento = document.getElementById("totalConDescuento");

    function formatNumber(value) {
        let number = parseInt(value.replace(/[^0-9]/g, ""), 10);
        if (isNaN(number)) return "0";
        return "$" + number.toLocaleString("es-CO");
    }

    function unformatNumber(value) {
        if (!value) return "0";
        return value.replace(/\$/g, "").replace(/\./g, "");
    }

    async function buscarProductos(query) {
        try {
            const response = await fetch(`buscar_productos.php?query=${encodeURIComponent(query)}`, {
                method: 'GET',
                credentials: 'include',
                headers: {
                    'Accept': 'application/json',
                    'Cache-Control': 'no-cache'
                }
            });
            
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            
            return await response.json();
        } catch (error) {
            console.error("Error en la búsqueda:", error);
            throw error;
        }
    }

    function seleccionarProducto(producto) {
        buscarProducto.value = producto.nombre;
        nombreProducto.textContent = producto.nombre;
        disponibleProducto.textContent = producto.cantidad;
        precioProducto.textContent = formatNumber(producto.precio_venta.toString());
        nombreProducto.dataset.id = producto.cont_producto;
        sugerencias.innerHTML = "";
        sugerencias.style.display = "none";
    }

    let timeoutId = null;
    buscarProducto.addEventListener("keyup", function () {
        const query = buscarProducto.value.trim();

        if (timeoutId) {
            clearTimeout(timeoutId);
        }

        if (query.length < 3) {
            sugerencias.innerHTML = "";
            sugerencias.style.display = "none";
            return;
        }

        timeoutId = setTimeout(async () => {
            try {
                const response = await fetch(`buscar_productos.php?query=${encodeURIComponent(query)}`);
                const data = await response.json();

                sugerencias.innerHTML = "";

                if (data.length === 0) {
                    sugerencias.style.display = "none";
                    return;
                }

                sugerencias.style.display = "block";

                data.forEach(producto => {
                    let item = document.createElement("div");
                    item.classList.add("sugerencia");
                    item.textContent = producto.nombre;
                    item.style.padding = "10px";
                    item.style.border = "1px solid black";
                    item.style.background = "white";
                    item.style.cursor = "pointer";

                    const handleSelection = (e) => {
                        e.preventDefault();
                        seleccionarProducto(producto);
                        sugerencias.style.display = "none";
                    };

                    item.addEventListener("click", handleSelection);
                    item.addEventListener("touchstart", handleSelection);

                    sugerencias.appendChild(item);
                });
            } catch (error) {
                console.error("Error en fetch:", error);
                sugerencias.innerHTML = "<div class='error'>Error al cargar productos. Intente nuevamente.</div>";
                sugerencias.style.display = "block";
            }
        }, 300);
    });

    function actualizarCarrito() {
        resumenTabla.innerHTML = `
            <tr>
                <th>Producto</th>
                <th>Subtotal</th>
                <th>Cantidad</th>
            </tr>`;

        let total = 0;
        let items = 0;

        carrito.forEach((producto, index) => {
            const subtotal = producto.cantidad * producto.precio;
            total += subtotal;
            items += producto.cantidad;

            const row = resumenTabla.insertRow();
            row.innerHTML = `
                <td>${producto.nombre}</td>
                <td>${formatNumber(subtotal.toString())}</td>
                <td id="acciones">
                    <button onclick="window.modificarCantidad(${index}, -1)">-</button>
                    <span>${producto.cantidad}</span>
                    <button onclick="window.modificarCantidad(${index}, 1)">+</button>
                    <button id="elim_cantidad" onclick="window.eliminarProducto(${index})"><i class="lni lni-trash-can"></i></button>
                </td>
            `;
        });

        totalVentaResumen.textContent = formatNumber(total.toString());
        totalItems.textContent = items;
        localStorage.setItem("carrito", JSON.stringify(carrito));

        // Si el campo de descuento está visible, actualizar los cálculos de descuento
        if (campoDescuento && campoDescuento.style.display === "block") {
            actualizarDescuento();
        }
    }

    // Función para actualizar los cálculos de descuento
    function actualizarDescuento() {
        const totalOriginal = parseInt(unformatNumber(totalVentaResumen.textContent)) || 0;
        const porcentajeDescuento = parseFloat(inputDescuento.value) || 0;
        
        // Calcular el valor del descuento
        const descuento = Math.round(totalOriginal * (porcentajeDescuento / 100));
        const nuevoTotal = totalOriginal - descuento;
        
        // Actualizar los campos en la UI
        subtotalAntesDescuento.textContent = formatNumber(totalOriginal.toString());
        valorDescuento.textContent = formatNumber(descuento.toString());
        totalConDescuento.textContent = formatNumber(nuevoTotal.toString());
        
        // Si hay un valor en el campo recibido, actualizar el cálculo del cambio
        if (inputRecibido.value) {
            let recibidoTexto = inputRecibido.value.replace(/\./g, "").replace(/\D/g, "");
            let recibido = parseInt(recibidoTexto) || 0;
            const cambio = recibido - nuevoTotal;
            cambioSpan.textContent = `$${cambio.toLocaleString("es-CO")}`;
            campoCambio.style.display = "block";
        }
    }

    document.getElementById("agregarProducto").addEventListener("click", function () {
        const nombre = nombreProducto.textContent;
        const cont_producto = nombreProducto.dataset.id;
        const precio = parseInt(unformatNumber(precioProducto.textContent));
        const cantidad = parseInt(cantidadProducto.value);

        if (!nombre || isNaN(precio) || isNaN(cantidad) || cantidad <= 0) {
            alert("Debe seleccionar un producto válido y una cantidad mayor a 0.");
            return;
        }

        carrito.push({ cont_producto, nombre, cantidad, precio });
        actualizarCarrito();

        buscarProducto.value = "";
        nombreProducto.textContent = "";
        disponibleProducto.textContent = "";
        precioProducto.textContent = "";
        cantidadProducto.value = "";
    });

    window.eliminarProducto = function (index) {
        carrito.splice(index, 1);
        actualizarCarrito();
    };

    window.modificarCantidad = function (index, cambio) {
        carrito[index].cantidad += cambio;
        if (carrito[index].cantidad <= 0) {
            eliminarProducto(index);
        } else {
            actualizarCarrito();
        }
    };

    metodoPago.addEventListener("change", function () {
        if (metodoPago.value === "efectivo") {
            campoRecibido.style.display = "block";
            // Mostrar siempre el campo de descuento independientemente del método
            campoDescuento.style.display = "block";
            resumenDescuento.style.display = "block";
            inputRecibido.value = "";
            campoCambio.style.display = "none";
            actualizarDescuento();
        } else {
            campoRecibido.style.display = "none";
            // Mantener visible el campo de descuento para otros métodos
            campoDescuento.style.display = "block";
            resumenDescuento.style.display = "block";
            campoCambio.style.display = "none";
            inputRecibido.value = "";
            actualizarDescuento();
        }
    });

    // Evento para el input del descuento
    inputDescuento.addEventListener("input", function() {
        // Limitar entre 0 y 100
        if (parseFloat(this.value) > 100) {
            this.value = "100";
        } else if (parseFloat(this.value) < 0 || this.value === "") {
            this.value = "0";
        }
        actualizarDescuento();
    });

    let timeoutRecibido = null;
    // Evento cuando el usuario escribe en el input "Recibido"
    inputRecibido.addEventListener("input", function (e) {
        let valorNumerico = e.target.value.replace(/\D/g, ""); // Eliminar todo lo que no sea número

        // Si el usuario borra todo, dejar el campo vacío
        if (valorNumerico === "") {
            e.target.value = "";
            cambioSpan.textContent = "$0"; // Mantener el cambio visible con $0
            campoCambio.style.display = "block"; // Se mantiene visible
            return;
        }

        // Limitar a 9 dígitos máximo
        if (valorNumerico.length > 9) {
            valorNumerico = valorNumerico.substring(0, 9);
        }

        // Mostrar el número con formato en el input para que sea más legible para el usuario
        const numeroFormateado = parseInt(valorNumerico).toLocaleString("es-CO");
        e.target.value = numeroFormateado;

        // Aplicar el cálculo del cambio con un pequeño retraso
        clearTimeout(timeoutRecibido);
        timeoutRecibido = setTimeout(() => {
            // Convertir de nuevo a número eliminando los puntos
            const recibidoSinFormato = parseInt(valorNumerico) || 0;
            
            // Usar el total con descuento si hay descuento aplicado
            let totalPagar;
            if (metodoPago.value === "efectivo" && inputDescuento.value) {
                totalPagar = parseInt(unformatNumber(totalConDescuento.textContent)) || 0;
            } else {
                totalPagar = parseInt(unformatNumber(totalVentaResumen.textContent)) || 0;
            }

            if (recibidoSinFormato >= totalPagar) {
                const cambio = recibidoSinFormato - totalPagar;
                cambioSpan.textContent = `$${cambio.toLocaleString("es-CO")}`;
                campoCambio.style.display = "block"; // Mostrar el cambio
            } else {
                cambioSpan.textContent = "$0"; // Si es menor, mostrar $0 en cambio
                campoCambio.style.display = "block"; // Se mantiene visible
            }
        }, 300);
    });

    document.getElementById("finalizarCompra").addEventListener("click", function () {
        if (carrito.length === 0) {
            alert("El carrito está vacío.");
            return;
        }
        
        if (!metodoPago.value) {
            alert("Debe seleccionar un método de pago antes de continuar.");
            return;
        }
        
        let metodo = metodoPago.value;
        let recibido = null;
        // Aplicar descuento independientemente del método de pago
        let descuento = parseFloat(inputDescuento.value) || 0;
        let totalOriginal = parseInt(unformatNumber(totalVentaResumen.textContent)) || 0;
        let totalPagar = totalOriginal;
        
        // Aplicar descuento para cualquier método de pago
        if (descuento > 0) {
            totalPagar = parseInt(unformatNumber(totalConDescuento.textContent)) || 0;
        }
        
        if (metodo === "efectivo") {
            // Obtener el valor sin formato eliminando los puntos y cualquier caracter no numérico
            let recibidoTexto = inputRecibido.value.replace(/\./g, "").replace(/\D/g, "");
            recibido = parseInt(recibidoTexto) || 0;
            
            // Para depuración
            console.log("Valor recibido (texto):", inputRecibido.value);
            console.log("Valor recibido (sin formato):", recibidoTexto);
            console.log("Valor recibido (número):", recibido);
            console.log("Total a pagar:", totalPagar);
            
            if (recibido < totalPagar) {
                alert("El monto recibido es inferior al total.");
                return;
            }
        }
        
        let cambio = null;
        if (metodo === "efectivo") {
            cambio = recibido - totalPagar;
        }
        
        const documento = documentoOperador.value;
        if (!documento) {
            alert("Error: No se ha podido obtener el documento del operador.");
            return;
        }
        
        fetch("registrar_venta.php", {
            method: "POST",
            headers: { 
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify({
                productos: carrito,
                metodo_pago: metodo,
                documento_operador: documento,
                estado: "activo",
                recibido: recibido,
                cambio: cambio,
                descuento_porcentaje: descuento,
                total_original: totalOriginal,
                total_con_descuento: totalPagar
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                localStorage.removeItem("carrito");
                sessionStorage.setItem("limpiarCarrito", "true");
                alert(data.success);
                window.location.href = "ver_ventas.php";
            } else if (data.error) {
                alert(data.error);
            }
        })
        .catch(error => {
            console.error("Error en la solicitud:", error);
            alert("Error al procesar la venta. Por favor, intente nuevamente.");
        });
    });
    
    actualizarCarrito();
});