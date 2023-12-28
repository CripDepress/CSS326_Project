<?php require_once('connect.php'); ?> 
<html>
    <head>
        <title>GETMOVIETICKET</title>
        <link rel='stylesheet' href='style.css'>
        <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');
        </style>
    </head>

    <body>
        <?php include 'header.php'; ?>
        <div class="content">
            <div class="topimmage">
                <img src="_images/film-bg.jpg" alt="Background film" style="width:100%;object-fit: cover;">
            </div>
            <div class="searchbar">
                <form class="form-inline" action="index.php" method="post">
                    <select name="cinema">
                    <option value="" selected disabled hidden>Cinema</option>
                    <?php
                        // select the CinemaID and NAME 
                        $q='select CinemaID, Name from cinema;';
                        if($result=$mysqli->query($q)){
                            while($row=$result->fetch_array()){
                                echo '<option value="'.$row[0].'">'.$row[1].'</option>';
                            }
                        }else{
                            echo 'Query error: '.$mysqli->error;
                        }
                    ?>
                    </select>
                    <!-- <select name="movie">
                    <option value="" selected disabled hidden>Movie</option>
                    <?php
                        // // select the MovieID and Title
                        // $q='select MovieID , Title from movie;';
                        // if($result=$mysqli->query($q)){
                        //     while($row=$result->fetch_array()){
                        //         echo '<option value="'.$row[0].'">'.$row[1].'</option>';
                        //     }
                        // }else{
                        //     echo 'Query error: '.$mysqli->error;
                        // }
                    ?>
                    </select> -->
                    <button type="submit" name="sub" value="Submit">Showtime</button>
                </form>
            </div>
            <div class="movie-panel">
                <h2>Current Showings</h2>
                <div class="movie-grid">
                    <?php
                    if(!isset($_POST['sub']) || $_POST['cinema'] == "") {
                        $q='select MovieID ,Title from movie;';
                        if($result=$mysqli->query($q)){
                            while($row=$result->fetch_array()){
                                echo '<a href="Movie/movie.php?mid='.$row[0].'&mname='.$row[1].'"><img src="_images/thumbnails/resized/'.$row[0].'.jpg"></a>';
                            }
                        }else{
                            echo 'Query error: '.$mysqli->error;
                        }
                    }else{
                        if(isset($_POST['cinema']))
                        {
                            $q='select MovieID ,Title from all_showings where CinemaID='.$_POST['cinema'].';';
                            if($result=$mysqli->query($q)){
                                while($row=$result->fetch_array()){
                                    echo '<a href="Movie/movie.php?mid='.$row[0].'&mname='.$row[1].'"><img src="_images/thumbnails/resized/'.$row[0].'.jpg"></a>';
                                }
                            }else{
                                echo 'Query error: '.$mysqli->error;
                            }
                        }
                    }
                    ?>
                </div>
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