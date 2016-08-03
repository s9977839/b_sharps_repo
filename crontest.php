<?php
// the message
$msg = " Hello world\n";
$msg2 = time();
echo $msg2;
// use wordwrap() if lines are longer than 70 characters
$msg = wordwrap($msg,70);

// send email
$file = 'test.txt';
$current = file_get_contents($file);
$current .= $msg2;
$current .= $msg;
file_put_contents($file, $current);
?>
