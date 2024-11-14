<?php
// obtener_datos.php
require_once 'conexion.php';

$tipo = $_GET['tipo'] ?? '';

switch($tipo) {
    case 'usuarios':
        $sql = "SELECT * FROM usuarios";
        $titulo = "Alta de Usuarios";
        $columnas = ['ID', 'Nombre', 'Email', 'Acciones'];
        break;
        
    case 'asignaturas':
        $sql = "SELECT * FROM asignaturas";
        $titulo = "Alta de Asignaturas";
        $columnas = ['Código', 'Asignatura', 'Créditos', 'Acciones'];
        break;
        
    case 'matriculas':
        $sql = "SELECT m.id, u.nombre as alumno, a.nombre as asignatura, m.fecha 
                FROM matriculas m 
                JOIN usuarios u ON m.usuario_id = u.id 
                JOIN asignaturas a ON m.asignatura_id = a.id";
        $titulo = "Matrícula de Alumnos";
        $columnas = ['Alumno', 'Asignatura', 'Fecha', 'Acciones'];
        break;
        
    default:
        echo "Tipo de tabla no válido";
        exit;
}

try {
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $resultados = $stmt->fetchAll();

    $html = '<div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4>' . $titulo . '</h4>
                        <button class="btn btn-success" onclick="mostrarFormulario(\'' . $tipo . '\')">Nuevo</button>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>';
    
    foreach($columnas as $columna) {
        $html .= '<th>' . $columna . '</th>';
    }
    
    $html .= '</tr></thead><tbody>';

    foreach($resultados as $fila) {
        $html .= '<tr>';
        switch($tipo) {
            case 'usuarios':
                $html .= '<td>' . $fila['id'] . '</td>';
                $html .= '<td>' . $fila['nombre'] . '</td>';
                $html .= '<td>' . $fila['email'] . '</td>';
                break;
                
            case 'asignaturas':
                $html .= '<td>' . $fila['codigo'] . '</td>';
                $html .= '<td>' . $fila['nombre'] . '</td>';
                $html .= '<td>' . $fila['creditos'] . '</td>';
                break;
                
            case 'matriculas':
                $html .= '<td>' . $fila['alumno'] . '</td>';
                $html .= '<td>' . $fila['asignatura'] . '</td>';
                $html .= '<td>' . $fila['fecha'] . '</td>';
                break;
        }
        
        $html .= '<td>
                    <button class="btn btn-warning btn-sm" onclick="procesarAccion(' . $fila['id'] . ', \'editar\', \'' . $tipo . '\')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="procesarAccion(' . $fila['id'] . ', \'eliminar\', \'' . $tipo . '\')">Eliminar</button>
                  </td>';
        $html .= '</tr>';
    }

    $html .= '</tbody></table></div></div>';
    
    echo $html;

} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
Last edited hace 7 minutos