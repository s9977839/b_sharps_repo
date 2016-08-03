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
  $result = mysql_query("SELECT id, c_id, title FROM $tableName");          //query
  #$array = mysql_fetch_row($result);                          //fetch result    

  // echo json_encode($table_data);
while($row = mysql_fetch_row($result)){
	 $array1[] = $row;

}

  //--------------------------------------------------------------------------
  // 3) echo result as json 
  //--------------------------------------------------------------------------
  #echo json_encode($array);
  echo json_encode($array1);

?>
