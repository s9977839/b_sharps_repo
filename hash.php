<?php

$str = $_POST['input'];

$input = "createname=" . $_POST['createname'] . "&meetingID=" . $_POST['meetingID'] . "&attendeePW=" . $_POST['attendeePW'] . "&moderatorPW=" . $_POST['moderatorPW'] . "04c5360f439c3365ee7d63ea46e4e9df";

//echo $input;
echo sha1("$input");
//
// http://php.net/manual/en/language.variables.external.php
//

?>
