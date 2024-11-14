<?php
// procesar_accion.php
require_once 'conexion.php';

$id = $_POST['id'] ?? '';
$accion = $_POST['accion'] ?? '';
$tipo = $_POST['tipo'] ?? '';

try {
    switch($accion) {
        case 'eliminar':
            $sql = "DELETE FROM $tipo WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            echo "Registro eliminado correctamente";
            break;
            
        case 'editar':
            // Aquí obtendrías los datos del registro para mostrar el formulario de edición
            $sql = "SELECT * FROM $tipo WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            $datos = $stmt->fetch();
            echo json_encode($datos);
            break;
            
        default:
            echo "Acción no válida";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>