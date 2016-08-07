<?php

$str = $_POST['input'];

$input = "createname=" . $_POST['createname'] . "&meetingID=" . $_POST['meetingID'] . "&attendeePW=" . $_POST['attendeePW'] . "&moderatorPW=" . $_POST['moderatorPW'];

//echo $input;
echo sha1("$input");
//
// http://php.net/manual/en/language.variables.external.php
//

?>
