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

    if(empty($susername)){
        header("Location: login.php?error=6");
        exit();
    }
    else if(empty($spassword)){
        header("Location: login.php?error=7");
        exit();
    }
    $path = $_SERVER['SERVER_NAME'];
    $sql = "SELECT name,password,Role from user where Name = '$susername' AND AES_DECRYPT(Password, 'encryptpassword') = '$spassword'";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)===1){
        $row = mysqli_fetch_assoc($result);
        if($row['Name']===$susername ){
            header("Location: login.php?error=fail");
            exit();
        }
        else{
            $_SESSION["name"] = $susername;
            $_SESSION["Role"] = $row['Role'];
            header("location: /CSS326_Project/index.php");
            exit();
        }
    }
    else{
        header("Location: login.php?error=8");
            exit();
        }
    }


$conn->close();
?>
