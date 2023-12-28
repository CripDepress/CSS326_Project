<!DOCTYPE = html>
<html>

<head>
    <title>Register/Sign in</title>
    <link rel='stylesheet' href='style.css'>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');
    </style>
    <basefont face="'Poppins', 'sans-serif'" size="2" color="#ff0000"></basefont>
</head>

<body>
    <?php include '../header.php'; ?>
    <div style='height: 1000px'>
        <div class = 'body' style="text-align: center;">
        <?php 
        if (isset($_GET['error'])) {
            if ($_GET['error'] == 1) {
                $message = "Username is required.";
            }
            else if ($_GET['error'] == 2) {
                $message = "Password is required.";
            }
            else if ($_GET['error'] == 3) {
                $message = "Email is required.";
            }
            else if ($_GET['error'] == 4) {
                $message = "Phone is required.";
            }
            else if ($_GET['error'] == 5) {
                $message = "Registered successfully.";
            }
            else if ($_GET['error'] == 6) {
                $message = "Username is empty.";
            }
            else if ($_GET['error'] == 7) {
                $message = "Password is empty.";
            }
            else if ($_GET['error'] == 8) {
                $message = "Username or password is incorrect.";
            }
        echo '<p style="margin: 10;">'.$message.'</p>';
        } ?>
        </div>
        <div style="text-align: left; background-color: white; position: relative;  padding: 20px; border-radius: 20px; margin-left: 500; margin-right: 500;" >
            <h2 style="text-align: center;">Register</h2>
            <form action="register.php" method="post" style="margin: 5;">
                <label> Username:</label><br>
                <input type= "text" name = "username" placeholder = "Username"><br>
                <label> Password:</label><br>
                <input type= "password" name = "Password" placeholder = "Password"><br>
                <label> Email: </label><br>
                <input type= "email" name = "email" placeholder = "email" style="tab-size: 100;"><br>
                <label> Phone number:</label><br>
                <input type= "text" name = "phone" placeholder = "phone"><br>
                <input type="submit" value="Register"  style="background-color: #690000; color: white; margin-top: 10;">
            </form>
        </div>
        
        <div style="text-align: left; background-color: white; position: relative;  padding: 20px; border-radius: 20px; margin-top: 50; margin-left: 500; margin-right: 500;" >
            <h2 style="text-align: center;">Sign in</h2>
            <form action="signin_gpt.php" method="post" style="margin: 5;">
                <label> Username:</label><br>
                <input type= "text" name = "signinUsername" placeholder = "Username"><br>
                <label> Password:</label><br>
                <input type= "password" name = "signinPassword" placeholder = "Password"><br>
                <input type="submit" value="Sign in" style="background-color: #690000; color: white; margin-top: 10;">
            </form>
        </div>

    </div>
    <footer>
            <div class='footer-container'>
                <a class='foot-text' href='/CSS326_Project/about.php'>about us</a>
                <a class='foot-text' href='/CSS326_Project/contact.php'>contact us</a>
            </div>
    </footer>
</body>

</html>