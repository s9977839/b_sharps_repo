<html>
  <head>
    <script language="javascript" type="text/javascript" src="jquery.js"></script>
  </head>
  <body>
  <h2> Calendar DB output example </h2>
  <h3>Output: </h3>
  <div id="output">this element will be accessed by jquery and this text replaced</div>
  <script id="source" language="javascript" type="text/javascript">

 //
 // pass an int, increment by 1 and return value
 //
 function incbyone(i) {
    i = i + 1;
    return i;
 } 
 // 
 // if number less than 10, prepend 0
 //
 function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
  }
  //
  // generate GUID http://guid.us/GUID/JavaScript
  function S4() {
    return (((1+Math.random())*0x10000)|0).toString(16).substring(1); 
  }
  //
  // start of ajax stuff
  // setInterval - sets how often ajax refreshes data
  //
  $(setInterval(function () 
  {
    //
    // make call to api3.php and expect json data return.
    // api3.php returns a json dump of a calendar database
    //
    $.ajax({                                      
      url: 'api3.php',                 
      data: "",                        
      dataType: 'json',               
      //
      // if successful, do something with the returned data
      //       
      success: function(data)         
      {
	//
	// grab the current date, convert it to UTC and format it YYYY-MM-DD HH:MM:ss
	//
	var date = new Date();
	var timestamp =  date.getUTCFullYear() + "-" + addZero(incbyone(date.getUTCMonth())) + "-" + addZero(date.getUTCDate()) + " " + addZero(date.getUTCHours()) + ":" + addZero(date.getUTCMinutes()) + ":" + addZero(date.getUTCSeconds());
	//
	// place holder variable for start time in each meeting object
	//
	var chattime = "";
	//
	//
	//
	$('#output').html("Current time: " + timestamp + "<br><br>");
	//
	// loop through the returned json data (data)
	//
	$.each(data, function() { 
                $.each(this, function(key, value){
			//
			// write out each key - value pair
			//
			//$('#output').append("<b>" + key + "</b>: " + value + "   " );
			//
			// if key is course code, set var to value
			//
			if ( key == 'code' ) { 
				coursetitle = value;
			}	
			//
			// if key is date assign to tempdate, convert to integer and pull
			// out all non digits, used later to compare date/time
			//
			else if ( key == 'start_date' ) {
			   tempdate = String(value);	
     			   tempdate2 = tempdate.replace(/\D/g,'');
			   chattime = parseInt(tempdate2);
    			}
                });
		//
		//
		//
		$('#output').append("<br>");
		//
		// generate meetingID
		//
		//guid = (S4() + S4() + "-" + S4() + "-4" + S4().substr(0,3) + "-" + S4() + "-" + S4() + S4() + S4()).toLowerCase();
		guid = 123456789
		//
		// generate api call string
		//
		apicall = "createname=" + coursetitle + "&meetingID=" + guid +  "&attendeePW=" + coursetitle + "&moderatorPW=" + coursetitle + "mod04c5360f439c3365ee7d63ea46e4e9df"  ;
		//$('#output').append( apicall + "<br>");
		//$('#output').append("<br>" + meeturl + coursetitle + "&meetingid=" + guid + "&checksum=1231232312312" + "<br>");
		var testvalue = "";
		//
		//	
		//
		tempdate2 = timestamp.replace(/\D/g,'');
		systemdate = parseInt(tempdate2);
		//
		// check if current time is greater than calendar entry time
		//
		if ( systemdate > chattime ){
			timediff2 = systemdate - chattime;
			$('#output').append("<br>past.." + systemdate + " " + chattime + " " + timediff2 + " " + coursetitle);
			if ( timediff2 < 1000 ) {
				$('#output').append("<br><b>Lecture has started</b><br>");
				                //
                				// check running meetings
                				//
                				//
                				$.ajax({
                        				type: "POST",
                        				url: "getmeeting.php",
                        				datatype: "html",
                        				data: 'coursename=' + coursetitle,
                        				success: function(data) {
                        				$('#output').append("<br><br>xml..." + data);  
                        				//alert(data);
							if ( data == "1") {
								$('#output').append("Meeting already started.. doing nothing");
							}
							else {
								$('#output').append("Meeting hasn't started.. starting..");
								//
								// gen api call
								//
								        /*        $.ajax({
                     									type: "POST",
                        								url: 'hash.php',
                        								datatype: "html",
                        								data: apicall,
                        								success: function(data) {
                        								meetingurl = "name=" + coursetitle + "&meetingID=" + guid +  "&attendeePW=" + coursetitle + "&moderatorPW=" + coursetitle + "mod" + "&checksum=" + data;
											$('#output').append(meetingurl);
                                                                                	$.ajax({
                                                                                        	type: "POST",
                                                                                        	url: 'startmeeting.php',
                                                                                        	datatype: "html",
                                                                                        	data: meetingurl,
                                                                                       	 	success: function(data) {
													$('#output').append("Meeting started..");
												}
												});
										
                        								}
                									});							
									*/		// make database update
											// make api call
							}
							}
							});
                        			
		}
		}
		else if ( systemdate < chattime ) {
			//
			// if chat is in future check the difference
			//
			testvalue = "future";
			timediff = chattime - systemdate;
			$('#output').append("<br>Future Time Difference is " + timediff + "<br><br>");
			//
			// if time difference less than 600 seconds, output a warning
			//
			if ( timediff < 1200 ) {
				$('#output').append("<br><b>Lecture is starting in less than 10 minutes.<br></b>");	
                                                //
                                                // check running meetings
                                                //
                                                //
                                                $.ajax({
                                                        type: "POST",
                                                        url: "getmeeting.php",
                                                        datatype: "html",
                                                        data: 'coursename=' + coursetitle,
                                                        success: function(data) {
                                                        //$('#output').append("<br><br>xml..." + data);  
                                                        //alert(data);
                                                        if ( data == 1) {
                                                                $('#output').append("Meeting already started.. doing nothing");
                                                        }
                                                        else {
                                                                $('#output').append("Meeting hasn't started.. starting..");
                                                        }
                                                        }
                                                });
			}
	
		} 
		//
		//
		//
		//$('#output').append(chattime + " " + testvalue + " "  +  "<br>");
            //});
      } 
     }
    });
  }, 5000)); 

  </script>
  </body>
</html>
