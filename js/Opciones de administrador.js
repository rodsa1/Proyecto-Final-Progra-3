
let usuarios = [
    { id: 1, nombre: 'Juan Pérez', email: 'juan@email.com' },
    { id: 2, nombre: 'María López', email: 'maria@email.com' }
];

function altaUsuario() {
    const panel = document.getElementById('panelGestion');
    panel.classList.remove('hidden');
    actualizarTabla();
}

function actualizarTabla() {
    const tbody = document.getElementById('tablaUsuarios');
    tbody.innerHTML = '';
    
    usuarios.forEach(usuario => {
        tbody.innerHTML += `
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nombre}</td>
                <td>${usuario.email}</td>

            </tr>
        `;
    });
}

function crearUsuario() {
    const nombre = prompt("Ingrese nombre del usuario:");
    const email = prompt("Ingrese email del usuario:");
    
    if (nombre && email) {
        const nuevoUsuario = {
            id: usuarios.length + 1,
            nombre: nombre,
            email: email
        };
        usuarios.push(nuevoUsuario);
        actualizarTabla();
    }
}

// Función para eliminar un usuario
function eliminarUsuario(id) {
    if (confirm('¿Desea eliminar este usuario?')) {
        usuarios = usuarios.filter(u => u.id !== id);
        actualizarTabla();
    }
}











