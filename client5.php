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
	$('#output').html("")
	$.each(data, function() { 
                $.each(this, function(key, value){
			//document.write(key + value);
			//$('#output').remove();
			$('#output').append("<b>" + key + "</b>: " + value + "   " );
                });
		$('#output').append("<br>");
            });
        //--------------------------------------------------------------------
        // 3) Update html content
        //--------------------------------------------------------------------
        //$('#output').html("<b>id: </b>"+id+"<b> c_id: </b>"+c_id+"<b> title: </b><br>"+title); //Set output element html
        //recommend reading up on jquery selectors they are awesome 
        // http://api.jquery.com/category/selectors/

      } 
    });
  }, 10000)); 

  </script>
  </body>
</html>
