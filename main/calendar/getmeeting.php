<?php
//
// pass meeting name
//
$str = $_POST['coursename'];
//echo $str . " ";
$meetingstatus = 0;
//
// http://www.higherpass.com/php/tutorials/retrieving-xml-with-curl-and-simplexml/
// http://php.net/manual/en/simplexml.examples.php
//
$xml_feed_url = "http://52.62.242.210/bigbluebutton/api/getMeetings?checksum=6bd30d44ac02867583d5f24d93377c4f8ccf024f";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $xml_feed_url);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$xml = curl_exec($ch);
curl_close($ch);
$xml2 = simplexml_load_string($xml); 
//print_r($xml2); 
//
// http://www.w3schools.com/php/php_xml_simplexml_get.asp
//
foreach($xml2->children() as $x)
    { 
	//echo "x ";
	//echo $x . "<br>";
	foreach($x->children() as $y) {
		//echo "y ";
		//echo $y . "<br>";
		foreach($y->children() as $z ){
			//echo "z ";
			if ( $z == $str ) {
				$meetingstatus = 1;
			}
			//echo $z . "<br>";
			/*foreach($z->children() as $a ) {
				echo $a ;
				}*/
			}
		}
    }
echo $meetingstatus;
?>
