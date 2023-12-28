<?php 
require_once('../connect.php');
session_start();
echo var_dump($_REQUEST);
$numSeats = 0;
$ttPrice = 0;
$q='select * from screening_seat inner join cinema_seat on cinema_seat.CinemaSeatID=screening_seat.CinemaSeatID where ShowID='.$_GET['sid'].';';
if($result=$mysqli->query($q)){
    while($row=$result->fetch_array()){
        if (isset($_POST[$row['ShowSeatID']])) {
            $numSeats = $numSeats + 1;
            $ttPrice = $ttPrice + $row['Price'];
        }
    }
}else{
    echo 'Query error: '.$mysqli->error;
}

$booking = 'INSERT INTO booking (NumberOfSeats, UserID, ShowID) VALUES('.$numSeats.', (select UserID from user where user.Name="'.$_SESSION["name"].'"), '.$_GET['sid'].');';
if($result=$mysqli->query($booking)){
    $bookingID = $mysqli->insert_id;
    echo 'BookingID:'.$bookingID.'<br>';
    $q='select * from screening_seat inner join cinema_seat on cinema_seat.CinemaSeatID=screening_seat.CinemaSeatID where ShowID='.$_GET['sid'].';';
    if($result=$mysqli->query($q)){
        while($row=$result->fetch_array()){
            if (isset($_POST[$row['ShowSeatID']])) {
                $e = 'UPDATE screening_seat SET status = 1, BookingID = '.$bookingID.' WHERE ShowSeatID ='.$row['ShowSeatID'].';';
                echo $e;
                if($update_result=$mysqli->query($e)){
                    
                }else{
                    echo 'Query error: '.$mysqli->error;
                }
            }
        }
        header("location: /CSS326_Project/index.php");
    }
}else{
    echo 'Query error: '.$mysqli->error;
}
?>