Archivo de conexión

<?php
// conexion.php
$host = 'localhost';
$dbname = 'tu_base_de_datos';
$username = 'tu_usuario';
$password = 'tu_contraseña';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    die();
}
?>