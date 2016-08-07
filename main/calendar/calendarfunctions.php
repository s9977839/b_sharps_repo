<?php 

function draw_calendar($month,$year){
	
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
			$result = mysqli_query($connect, $query);
			$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
			$eventime = substr($row["start_date"], 11);
			$event = $eventime . '<br/>' . $row["title"];
			$calendar .= '<div class="event"><a href="./viewevent.php?i=' .$row["id"]. '&t=e">' .$event. '</a></div>';
			
			// PULL PERSONAL AGENDA EVENTS
			$userId = api_get_user_id();
			$query2 = "SELECT id, user, title, date, enddate FROM personal_agenda WHERE user = '$userId' AND date LIKE '%$today%'";
			$result2 = mysqli_query($connect, $query2);
			$row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
			$eventime2 = substr($row2["date"], 11);
			$event2 = $eventime2 . '<br/>' . $row2["title"];
			$calendar .= '<div class = "personalevent"><a href="./viewevent.php?i=' .$row2["id"]. '&t=p">' .$event2. '</a></div>';
			$calendar.= str_repeat('<p> </p>',2);
			
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





?>
