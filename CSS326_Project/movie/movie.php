<?php require_once('../connect.php'); ?> 
<html>
    <head>
        <title><?php echo $_GET['mname'] ?></title>
        <link rel='stylesheet' href='style.css'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');
        </style>
    </head>

    <body>
        <?php include '../header.php'; ?>
        <div class='wrapper'>
            <div class='movie-card'>
            <?php
                // select the CinemaID and NAME 
                echo '<img src="../_images/posters/'.$_GET['mid'].'.jpg">';
            ?>
                <div class='text-wp'>
                    <?php
                        // select the CinemaID and NAME 
                        echo '<h3>'.$_GET['mname'].'</h3><br>';
                        $q='select Genre, Duration from movie where MovieID='.$_GET['mid'].';';
                        if($result=$mysqli->query($q)){
                            while($row=$result->fetch_array()){
                                echo '<h4>Genre: '.$row[0].'</h4>';
                                echo '<h4>Duration: '.$row[1].' minutes</h4>';
                            }
                        }else{
                            echo 'Query error: '.$mysqli->error;
                        }
                    ?>
                </div>
            </div>
            <div class="searchbar">
                <form class="form-inline" action=<?php echo '"'."movie.php?mid=".$_GET['mid']."&mname=".$_GET['mname'].'"'; ?> method="post">
                    <input type="date" id="moviedate" name="moviedate">
                    <script>
                    const datePicker = document.getElementById("moviedate");

                    datePicker.min = getDate();
                    datePicker.max = getDate(7);

                    // Borrowed from https://stackoverflow.com/a/29774197/7290573
                    function getDate(days) {
                        let date;

                        if (days !== undefined) {
                            date = new Date(Date.now() + days * 24 * 60 * 60 * 1000);
                        } else {
                            date = new Date();
                        }

                        const offset = date.getTimezoneOffset();

                        date = new Date(date.getTime() - (offset*60*1000));

                        return date.toISOString().split("T")[0];
                    }
                    </script>
                    
                    <select name="cinema">
                    <option value="" selected disabled hidden>cinema</option>
                    <?php
                        // select the MovieID and Title
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
                    <button type="submit" name="sub" value="Submit">Showtime</button>
                </form>
            </div>
            <div class='movie-cinema'>
                <h1>Available screenings</h1>
                <?php
                if(isset($_POST['sub'])) {
                    $q='select distinct CinemaHallID, HallName from all_showings where 
                    movieID='.$_GET['mid'].' and StartDate="'.$_POST['moviedate'].'" and CinemaID='.$_POST['cinema'].';';
                    if($result=$mysqli->query($q)){
                        while($row=$result->fetch_array()){
                ?>
                        <!-- DO something here -->
                        <div class='movie-hall-tab'>
                            <h3 class="hall-label"><?php echo $row['hallName'] ?></h3>

                <?php       $q_2='select StartTime, ShowID from all_showings where 
                            CinemaHallID='.$row['CinemaHallID'] .' and movieID='.$_GET['mid'].' and StartDate="'.$_POST['moviedate'].'" and CinemaID='.$_POST['cinema'].';';
                            if($result_2=$mysqli->query($q_2)){
                                echo "<div class='content-wrapper'>";
                                while($row_2=$result_2->fetch_array()){ ?>
                                    
                                        <a href=<?php echo '"'."/CSS326_Project/movie/seats.php?sid=".$row_2['ShowID'].'"'; ?>
                                        class="time-button"><?php echo $row_2['StartTime'] ?></a>
                                    
                <?php           }
                                echo "</div>";
                            } 
                ?>
                        </div>
                <?php
                        }
                    }else{
                        echo 'Query error: '.$mysqli->error;
                    }
                }else{
                    echo "<h1>Please Select Date and Cinema</h1>";
                }
                ?>
            </div>
        </div>
        <div style='height: 550px'>

        </div>
        <footer>
            <div class='footer-container'>
                <a class='foot-text' href='/CSS326_Project/about.php'>about us</a>
                <a class='foot-text' href='/CSS326_Project/contact.php'>contact us</a>
            </div>
        </footer>
    </body>
</html>