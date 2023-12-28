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
    $username = $_POST["username"];
    $password = $_POST["Password"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];

    if(empty($username)){
        header("Location: login.php?error=1");
        exit();
    }
    else if(empty($password)){
        header("Location: login.php?error=2");
        exit();
    }
    else if(empty($email)){
        header("Location: login.php?error=3");
        exit();
    }
    else if(empty($phone)){
        header("Location: login.php?error=4");
        exit();
    }
    else{
    $sql = "INSERT INTO user (name, password, email, phone, role)
    VALUES ('$username', AES_ENCRYPT('$password', 'encryptpassword'), '$email', '$phone', 'customer')";
    if (mysqli_query($conn, $sql)) {
        header("Location: login.php?error=5");
      } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
      }
    }
}
$conn->close();
?>
