<?php

include 'db.php';
  //--------------------------------------------------------------------------
  // 1) Connect to mysql database
  //--------------------------------------------------------------------------
  $con = mysql_connect($host,$user,$pass);
  $dbs = mysql_select_db($databaseName, $con);

  //--------------------------------------------------------------------------
  // 2) Query database for data
  //--------------------------------------------------------------------------
  //$result = mysql_query("SELECT id, c_id, title FROM $tableName");          //query
  #$array = mysql_fetch_row($result);                          //fetch result    
 $connection = mysql_connect($host, $user, $pass);
 mysql_select_db($databaseName,$connection);

  // Query to run
  $query = mysql_query("SELECT id, c_id, title FROM $tableName", $connection);



//while($data = mysql_fetch_row($query))

echo "<table border='1' >
<tr>
<td align=center> <b>ID</b></td>
<td align=center><b>C_ID</b></td>
<td align=center><b>TITLE</b></td>";


while($data = mysql_fetch_row($query))
{   
    echo "<tr>";
    echo "<td align=center>$data[0]</td>";
    echo "<td align=center>$data[1]</td>";
    echo "<td align=center>$data[2]</td>";
    echo "</tr>";
}
echo "</table>";
?>
