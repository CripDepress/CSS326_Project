<?php
echo "
	<header>
	<div class='top-nav'>
		<img class='icon' src='/CSS326_Project/_images/movie-icon.png'>
		<div class='top-nav-center'>
			<a class='title' href='/CSS326_Project/index.php'>www.<b>GETMOVIETICKET</b>.com</a>
		</div>
		<div class='top-nav-right'>
			<a class='login' href='/CSS326_Project/login/login.php'>
";
			session_start();
			if (isset($_SESSION['name'])) {
				echo $_SESSION['name']; }
			else{ echo 'login / sign up';} 
echo "
			</a>
			<img class='icon login' src='/CSS326_Project/_images/login-icon.png'>
		</div>
	</div>
	<div class='bot-nav'>
		<a class='bot-nav-item' href='/CSS326_Project/index.php'>home</a>
		<a class='bot-nav-item' href='/CSS326_Project/movie/movie.php?mid=1&mname=Inception'>movie</a>
		<a class='bot-nav-item' href='/CSS326_Project/admin/admin.php'>Admin</a>
	</div>
	</header>
";
?>