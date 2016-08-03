<?php

$servername = 'localhost';
$username = 'php';
$password = 'bsharps';
$dbname = 'chamilo';

// setup connection
$connect = new mysqli($servername, $username, $password, $dbname);
// test
if ($connect->connect_error) {
	die("Failed" . $connect->connect_error);
}

$sql = "select id, c_id, title from c_calendar_event";
$output = $connect->query($sql);

if ( $output->num_rows > 0) {
	while($row = $output->fetch_assoc()) {
		echo "ID: " . $row["id"] . " C ID: " . $row["c_id"] . " Title: " . $row["title"] . "<br>";
	}
}
$connect->close();

?>
