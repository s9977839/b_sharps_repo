<?php

include 'db.php';
  //--------------------------------------------------------------------------
  // 1) Connect to mysql database
  //--------------------------------------------------------------------------
  $con = mysqli_connect($host,$user,$pass,$databaseName);
  //$dbs = mysql_select_db($databaseName, $con);
header("Content-type: text/javascript");
  //--------------------------------------------------------------------------
  // 2) Query database for data
  //--------------------------------------------------------------------------
  $res = mysqli_query($con,"SELECT b.id, a.c_id, b.title, b.code, a.title, a.start_date FROM c_calendar_event a, course b where a.c_id = b.id;");          //query
  #$array = mysql_fetch_row($result);                          //fetch result    
  $result = array();

  // echo json_encode($table_data);

while($row = mysqli_fetch_assoc($res)){
	 $result[] = $row;

}

    echo json_encode($result);





  //--------------------------------------------------------------------------
  // 3) echo result as json 
  //--------------------------------------------------------------------------
  #echo json_encode($array);

?>