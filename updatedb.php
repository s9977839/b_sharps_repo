<?php
//
// http://www.w3schools.com/php/php_mysql_insert.asp
//
// include database config from db.php
//
include 'db.php';
//
// grab variables from post
//
$c_id=$_POST['c_id'];
$coursetitle=$_POST['c_title'];
$guid=$_POST['g_id'];
//$c_id=2;
//$coursetitle="TESTCourse";
//$guid='1234567';
//  $con = mysqli_connect($host,$user,$pass,$databaseName);
//
// connect to db
//
$conn = new mysqli($host,$user,$pass,$databaseName);
//
// Check connection
//
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//$sql = "INSERT INTO MyGuests (firstname, lastname, email)
//VALUES ('John', 'Doe', 'john@example.com')";
$sql = "insert into plugin_bbb_meeting (c_id, meeting_name, attendee_pw, moderator_pw, status, created_at, remote_id  ) 
	VALUES  (" . $c_id . ", '" . $coursetitle . "-0','" . $coursetitle . "','" . $coursetitle .  "mod', 1, NOW(),'" . $guid . "')";

echo $sql;

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

//
// close connection
//
$conn->close();
?>
