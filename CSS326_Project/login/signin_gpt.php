<?php
session_start();
$servername = "localhost:3306";
$username = "root";
$password = "root";
$dbname = "movie_booking";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $susername = $_POST["signinUsername"];
    $spassword = $_POST["signinPassword"];

    if (empty($susername)) {
        header("Location: login.php?error=6");
        exit();
    } else if (empty($spassword)) {
        header("Location: login.php?error=7");
        exit();
    }

    // Use prepared statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT name, password, Role FROM user WHERE Name = ? AND AES_DECRYPT(Password, 'encryptpassword') = ?");
    $stmt->bind_param("ss", $susername, $spassword);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 1) {
        $stmt->bind_result($name, $password, $role);
        $stmt->fetch();

        if ($name !== $susername) {
            header("Location: login.php?error=fail");
            exit();
        } else {
            $_SESSION["name"] = $susername;
            $_SESSION["Role"] = $role;
            header("location: /CSS326_Project/index.php");
            exit();
        }
    } else {
        header("Location: login.php?error=8");
        exit();
    }
}

$conn->close();
?>
