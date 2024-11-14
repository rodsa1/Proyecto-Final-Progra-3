document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    fetch('php/login.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            localStorage.setItem('userRole', data.role);
            window.location.href = 'dashboard.html';
        } else {
            document.getElementById('loginError').classList.remove('d-none');
        }
    });
});

function cerrarSesion() {
    localStorage.removeItem('userRole');
    window.location.href = 'index.html';
}

function cargarContenido() {
    const role = localStorage.getItem('userRole');
    const roleOptions = document.getElementById('roleOptions');

    if (role === 'alumno') {
        roleOptions.innerHTML = `
            <a href="alumno.html" class="btn btn-primary m-2">Consultar Opciones de Alumno</a>
        `;
    } else if (role === 'profesor') {
        roleOptions.innerHTML = `
            <a href="profesor.html" class="btn btn-primary m-2">Consultar Opciones de Profesor</a>
        `;
    } else if (role === 'administrador') {
        roleOptions.innerHTML = `
            <a href="administrador.html" class="btn btn-primary m-2">Gestionar Usuarios y Asignaturas</a>
        `;
    }
}

window.onload = cargarContenido;
