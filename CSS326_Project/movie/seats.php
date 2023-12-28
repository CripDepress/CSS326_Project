<?php require_once('../connect.php'); ?> 
<html>
    <head>
        <title>Bookings</title>
        <link rel='stylesheet' href='style_seats.css'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');
        </style>
    </head>

    <body>
        <?php include '../header.php'; ?>
        <div class='wrapper'>
            <h1>Available Seats</h1>
            <?php
            $q='select * from screening_seat inner join cinema_seat on cinema_seat.CinemaSeatID=screening_seat.CinemaSeatID where ShowID='.$_GET['sid'].';';
            if($result=$mysqli->query($q)){
                echo '<form action="confirm.php?sid='.$_GET['sid'].'" name="seatform" id="seatform" method="post">';
                echo '<div class="seat_wrapper">';
                while($row=$result->fetch_array()){
                    //echo var_dump($row);
                    if ($row['Type']==0) {
                        if ($row['Status']==0) {
                            echo '<input type="checkbox" name="'.$row['ShowSeatID'].'" id="seat'.$row['ShowSeatID'].'" form="seatform" class="css-checkbox">';
                            echo '<label for="seat'.$row['ShowSeatID'].'" class="css-label-0-0"></label>';
                        }else{
                            echo '<input type="checkbox" name="'.$row['ShowSeatID'].'" id="seat'.$row['ShowSeatID'].'" form="seatform" class="css-checkbox" disabled="disabled">';
                            echo '<label for="seat'.$row['ShowSeatID'].'" class="css-label-0-1"></label>';
                        }
                    }else{
                        if ($row['Status']==0) {
                            echo '<input type="checkbox" name="'.$row['ShowSeatID'].'" id="seat'.$row['ShowSeatID'].'" form="seatform" class="css-checkbox">';
                            echo '<label for="seat'.$row['ShowSeatID'].'" class="css-label-1-0"></label>';
                        }else{
                            echo '<input type="checkbox" name="'.$row['ShowSeatID'].'" id="seat'.$row['ShowSeatID'].'" form="seatform" class="css-checkbox" disabled="disabled">';
                            echo '<label for="seat'.$row['ShowSeatID'].'" class="css-label-1-1"></label>';
                        }
                    }
                }
                echo '</div>';
                echo '<br><button type="submit" form="seatform" name="sub" value="Submit">Reserve</button>';
                echo '<a href="javascript:history.back()" class="cancle-button">Cancle</a>';
            }else{
                echo 'Query error: '.$mysqli->error;
            }
            ?>
            </form>
            <br><br>
            <div style="display:inline-block;">
                <img class='icon login' src='/CSS326_Project/_images/seattype1.png'><br>Premium chair<br><b>550 THB</b><br>
                <img class='icon login' src='/CSS326_Project/_images/seattype2.png'><br>Privilege chair<br><b>650 THB</b>
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