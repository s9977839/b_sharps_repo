<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
 <?php echo '<p>Hello World</p>'; 

$context  = stream_context_create(array('http' => array('header' => 'Accept: application/xml')));
$url = "http://52.62.242.210/bigbluebutton/api/getMeetings?checksum=6bd30d44ac02867583d5f24d93377c4f8ccf024f";
$xml = file_get_contents($url, false, $context);
$xml = simplexml_load_string($xml);
print_r($xml);
echo "<br>";
echo $xml->returncode . "<br>";

/* foreach ($returrncode->meetings->meeting as $meeting) {
    printf(
        "<p>%d meeting id.</p>",
        $meeting[meetingID],
    );
};*/
?> 
 </body>
</html>
