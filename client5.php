<html>
  <head>
    <script language="javascript" type="text/javascript" src="jquery.js"></script>
  </head>
  <body>
  <h2> Calendar DB output example </h2>
  <h3>Output: </h3>
  <div id="output">this element will be accessed by jquery and this text replaced</div>
  <script id="source" language="javascript" type="text/javascript">
  //document.write("Hi");
  //alert("Hello");

 function incbyone(i) {
    i = i + 1;
    return i;
 } 
 function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
  }
  $(setInterval(function () 
  {
    //-----------------------------------------------------------------------
    // 2) Send a http request with AJAX http://api.jquery.com/jQuery.ajax/
    //-----------------------------------------------------------------------
    $.ajax({                                      
      url: 'api3.php',                  //the script to call to get data          
      data: "",                        //you can insert url argumnets here to pass to api.php
                                       //for example "id=5&parent=6"
      dataType: 'json',                //data format      
      success: function(data)          //on recieve of reply
      {
	//document.write("Ajax!");

	var date = new Date();
	var timestamp =  date.getUTCFullYear() + "-" + addZero(incbyone(date.getUTCMonth())) + "-" + addZero(date.getUTCDay()) + " " + addZero(date.getUTCHours()) + ":" + addZero(date.getUTCMinutes()) + ":" + addZero(date.getUTCSeconds());
	var chattime = "";
	$('#output').html(timestamp + "<br><br>")
	$.each(data, function() { 
                $.each(this, function(key, value){
			$('#output').append("<b>" + key + "</b>: " + value + "   " );
			if ( key = 'start_date' ) {
			   tempdate = String(value);	
     			   tempdate2 = tempdate.replace(/\D/g,'');
			   chattime = parseInt(tempdate2);
    				}
                });
		//
		//
		$('#output').append("<br>");
		var testvalue = "";
		//
		//
		tempdate2 = timestamp.replace(/\D/g,'');
		systemdate = parseInt(tempdate2);
		//
		//
		if ( systemdate > chattime ){
			testvalue = "past";
			//tempvalue = timestamp.replace(/\D/g,'');
			//testvalue2 = parseInt(tempvalue); ;
		}
		else if ( systemdate < chattime ) {
			testvalue = "future";
			timediff = chattime - systemdate;
			$('#output').append("<br>Time Difference is " + timediff + "<br><br>");
			if ( timediff < 600 ) {
				$('#output').append("<br><b>Lecture is starting in less than 10 minutes.<br></b>");	
			}
	
		}
		//
		//
		$('#output').append(chattime + " " + testvalue + " "  +  "<br>");
	
            });
        //--------------------------------------------------------------------
        // 3) Update html content
        //--------------------------------------------------------------------
        //$('#output').html("<b>id: </b>"+id+"<b> c_id: </b>"+c_id+"<b> title: </b><br>"+title); //Set output element html
        //recommend reading up on jquery selectors they are awesome 
        // http://api.jquery.com/category/selectors/

      } 
    });
  }, 1000)); 

  </script>
  </body>
</html>
