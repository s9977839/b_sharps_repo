<?php
//
// pass meeting name
//A
$input = "create?name=" . $_POST['name'] . "&meetingID=" . $_POST['meetingID'] . "&attendeePW=" . $_POST['attendeePW'] . "&moderatorPW=" . $_POST['moderatorPW'] . "&checksum=" . $_POST['checksum'];
//$str = $_POST['coursename'];
//
// http://www.higherpass.com/php/tutorials/retrieving-xml-with-curl-and-simplexml/
// http://php.net/manual/en/simplexml.examples.php
//
$xml_feed_url = "http://52.62.242.210/bigbluebutton/api/" . $input;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $xml_feed_url);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$xml = curl_exec($ch);
curl_close($ch);
//$xml2 = simplexml_load_string($xml); 
//print_r($xml2); 
?>
