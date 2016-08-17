<?php 

function draw_calendar_menu () {
	$menu = '<div class="calendarmenu">';
	$menu .= '<span class="calendarviewbutton"><a href="./agenda_js.php"><img src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/calendar.png" alt="Calendar View" title="Calendar View"></a></span><span class = "listviewbutton"><a href="./eventlist.php"><img src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/listview.png" alt="List View" title="List View"></a></span>';
	$menu .= '<span class="addeventbutton"><a href="./calendaradd.php?&gradebook=0&origin=&action=add&type=personal"><img src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/addevent.png" alt="Add Event" title="Add Event"></a> </span>';
	$menu .= '</div>';
	return $menu;
}

function draw_calendar($month,$year){
/* ************************************************** */
/* CREDIT TO THIS TUTORIAL FOR HOW TO DRAW A CALENDAR */
/* https://davidwalsh.name/php-event-calendar         */
/* SQL FROM LINE 66 - 82 WAS WRITTEN PERSONALLY       */
/* ************************************************** */
	
	include 'db.php';
	$connect = mysqli_connect('localhost', 'php', 'bsharps', 'chamilo');
	
	/* draw table */
	
	$calendar = '<table cellpadding="0" cellspacing="0" class="calendar">';

	/* table headings */
	$headings = array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
	$calendar.= '<tr class="calendar-row"><td class="calendar-day-head">'.implode('</td><td class="calendar-day-head">',$headings).'</td></tr>';

	/* days and weeks vars now ... */
	$running_day = date('w',mktime(0,0,0,$month,1,$year));
	$days_in_month = date('t',mktime(0,0,0,$month,1,$year));
	$days_in_this_week = 1;
	$day_counter = 0;
	$dates_array = array();

	/* row for week one */
	$calendar.= '<tr class="calendar-row">';

	/* print "blank" days until the first of the current week */
	for($x = 0; $x < $running_day; $x++):
		$calendar.= '<td class="calendar-day-np"> </td>';
		$days_in_this_week++;
	endfor;

/* keep going with days.... */
	for($list_day = 1; $list_day <= $days_in_month; $list_day++):
		$calendar.= '<td class="calendar-day">';
			/* add in the day number */
			$calendar.= '<div class="day-number">'.$list_day.'</div>';

			// MEL CUSTOM WRITTEN CODE //

			$today = $year . "-";
			if ($month < 10) {$today .= "0" . $month;}
			else {$today .= $month;}
			$today .= "-";
			if ($list_day < 10) {$today .= "0" . $list_day;}
			else {$today .= $list_day;}
			
			if (mysqli_connect_errno()) {
				printf("Connect failed: %s\n", mysqli_connect_error());
    			exit();
			}
			
			// PULL GLOBAL CALENDAR EVENTS 
			$query = "Select c_calendar_event.id, c_calendar_event.c_id, c_calendar_event.title, c_calendar_event.start_date, c_calendar_event.end_date, course.title AS coursetitle, c_calendar_event.session_id FROM c_calendar_event INNER JOIN course On course.id = c_calendar_event.c_id AND c_calendar_event.start_date LIKE '%$today%' AND c_calendar_event.session_id = 0";
			if ($result = mysqli_query($connect, $query)) {
				while ($row = mysqli_fetch_assoc($result)) {
					$eventime = substr($row["start_date"], 11);
					$event = $eventime . '<br/>' . $row["title"];
					$calendar .= '<div class="event"><a href="./viewevent.php?i=' .$row["id"]. '&t=e">' .$event. '</a></div>';
				}
			}
			
			// PULL PERSONAL AGENDA EVENTS
			$userId = api_get_user_id();
			$query2 = "SELECT id, user, title, date, enddate FROM personal_agenda WHERE user = '$userId' AND date LIKE '%$today%'";
			if ($result2 = mysqli_query($connect, $query2)) {
				while ($row2 = mysqli_fetch_assoc($result2))
				{
				
			/*	$date = new DateTime($row2["date"]);
				$date->setTimeZone(new DateTimeZone('Australia/Brisbane'));*/
				
				$event2 = $row2["date"] . '<br/>' . $row2["title"] ;
				$calendar .= '<div class = "personalevent"><a href="./viewevent.php?i=' .$row2["id"]. '&t=p">' .$event2. '</a></div>';
				$calendar .= str_repeat('<p> </p>',2);	
				}
			}
			
		$calendar.= '</td>';
		if($running_day == 6):
			$calendar.= '</tr>';
			if(($day_counter+1) != $days_in_month):
				$calendar.= '<tr class="calendar-row">';
			endif;
			$running_day = -1;
			$days_in_this_week = 0;
		endif;
		$days_in_this_week++; $running_day++; $day_counter++;
	endfor;

	/* finish the rest of the days in the week */
	if($days_in_this_week < 8):
		for($x = 1; $x <= (8 - $days_in_this_week); $x++):
			$calendar.= '<td class="calendar-day-np"> </td>';
		endfor;
	endif;

	/* final row */
	$calendar.= '</tr>';

	/* end the table */
	$calendar.= '</table>';
	
	/* all done, return result */
	return $calendar;
}

function draw_list($month,$year){
	
	include 'db.php';
	$connect = mysqli_connect('localhost', 'php', 'bsharps', 'chamilo');
	
	$calendar = '<table cellpadding="0" cellspacing="0" class="eventlist">';
	$calendar .= '<tr>';
	$calendar .= '<th class = "listdate"> Date </th>';
	$calendar .= '<th class = "listevent"> Event </th>';
	$calendar .= '<th class = "listconference"> Video Conference </th>';
	$calendar .= '<th class = "listcourse"> Course </th>';
	$calendar .= '<th>View Event</th>';
	$calendar .= '<th>Edit Event</th>';
	$calendar .= '</tr>';

	$running_day = date('w',mktime(0,0,0,$month,1,$year));
	$days_in_month = date('t',mktime(0,0,0,$month,1,$year));
	$days_in_this_week = 1;
	$day_counter = 0;
	$dates_array = array(); 

	

/* keep going with days.... */
	for($list_day = 1; $list_day <= $days_in_month; $list_day++):

			// MEL CUSTOM WRITTEN CODE //

			$today = $year . "-";
			if ($month < 10) {$today .= "0" . $month;}
			else {$today .= $month;}
			$today .= "-";
			if ($list_day < 10) {$today .= "0" . $list_day;}
			else {$today .= $list_day;}
			
			if (mysqli_connect_errno()) {
				printf("Connect failed: %s\n", mysqli_connect_error());
    			exit();
			}
			
			// PULL GLOBAL CALENDAR EVENTS 
			$query = "Select c_calendar_event.id, c_calendar_event.c_id, c_calendar_event.title, c_calendar_event.start_date, c_calendar_event.end_date, c_calendar_event.videoconference, course.title AS coursetitle, c_calendar_event.session_id FROM c_calendar_event INNER JOIN course On course.id = c_calendar_event.c_id AND c_calendar_event.start_date LIKE '%$today%' AND c_calendar_event.session_id = 0";
			if ($result = mysqli_query($connect, $query)) {
				while ($row = mysqli_fetch_assoc($result))
				{
				$calendar.= '<tr>';
				$calendar .= '<td>' .$row["start_date"]. '</td>';
				$calendar .= '<td>' .$row["title"]. '</td>';
				if ($row["videoconference"] == "y"){
					$calendar .= '<td><img src="../img/video.png"></td>';}
				else {
					$calendar.= '<td></td>';
				}
				$calendar .= '<td>' .$row["coursetitle"].'</td>';
			    $calendar .= '<td> <div class="listevent"><a href="./viewevent.php?i=' .$row["id"]. '&t=e">View Event</a></div></td>';
				$calendar .= '<td> <div class="editevent"><a href="./calendaradd.php?action=edit&type=fromjs&id=course_'.$row["id"].'&course_id=undefined">Edit Event</a></div></td>';
				$calendar .= '</tr>';
					
				}
			}
			
			
			// PULL PERSONAL AGENDA EVENTS
			$userId = api_get_user_id();
			$query2 = "SELECT id, user, title, text, course, date, all_day, enddate, videoconference FROM personal_agenda WHERE user = '$userId' AND date LIKE '%$today%'";
			if ($result2 = mysqli_query($connect, $query2))
			{
				while ($row2 = mysqli_fetch_assoc($result2))
				{
				$calendar .= '<tr>';
				$calendar .= '<td>' .$row2["date"]. '</td>';
				$calendar .= '<td>' .$row2["title"]. '</a></div></td>';
				/* https://thenounproject.com/term/video-camera/1998/ */
				if ($row2["videoconference"] == "y"){
					$calendar .= '<td><img src="../img/video.png"></td>';}
				else {
					$calendar.= '<td></td>';
				}
				$calendar .= '<td>' .$row2["course"]. '</td>';
				$calendar .= '<td> <div class = "personallist"><a href="./viewevent.php?i=' .$row2["id"]. '&t=p">View Event</a></div></td>';
				$calendar .= '<td> <a href ="./calendaradd.php?action=edit&type=fromjs&id=personal_'.$row2["id"].'&course_id=undefined">Edit Event</a></div></td>';
			
				$calendar .= str_repeat('<p> </p>',2);
				$calendar .= '</tr>';
				}
			}
			
		
	endfor;

	/* finish the rest of the days in the week */
	/*if($days_in_this_week < 8):
		for($x = 1; $x <= (8 - $days_in_this_week); $x++):
			$calendar.= '<td class="calendar-day-np"> </td>';
		endfor;
	endif;*/

	/* end the table */
	$calendar.= '</table>';
	
	/* all done, return result */
	return $calendar;
}






?>
