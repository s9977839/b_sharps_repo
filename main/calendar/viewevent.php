<!DOCTYPE html>
<head>
    <?php 
    require_once'calendarfunctions.php'; 
    require_once '../inc/global.inc.php';
    include 'db.php';
    $connect = mysqli_connect('localhost', 'php', 'bsharps', 'chamilo');
    ?>
</head>
<body>
    <?php 
    
        $eventid = $_GET['i'];
        $eventtype = $_GET['t'];
        
        if ($eventtype == "e"){
            $query = "Select c_calendar_event.videoconference, c_calendar_event.id, c_calendar_event.c_id, c_calendar_event.title, c_calendar_event.start_date, c_calendar_event.end_date, course.title AS coursetitle, c_calendar_event.session_id, c_calendar_event.content FROM c_calendar_event INNER JOIN course On course.id = c_calendar_event.c_id AND c_calendar_event.id = '$eventid'";
            $result = mysqli_query($connect, $query);
            $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
            // BUILD THE TABLE
            $eventinformation  = '<table cellpadding="0" cellspacing = "0" class = "eventdescription">';
            $eventinformation .= '<tbody>';
            $eventinformation .= '<tr><td>Title</td><td>'.$row["title"].'</td></tr>';
            $eventinformation .= '<tr><td>Course</td><td>'.$row["coursetitle"].'</td></tr>';
            $eventinformation .= '<tr><td>Start Time</td><td>'.$row["start_date"].'</td></tr>';
            $eventinformation .= '<tr><td>End Time</td><td>'.$row["end_date"].'</td></tr>';
            $eventinformation .= '<tr><td>Video Conference</td><td>'.$row["videoconference"].'</td></tr>';
            $eventinformation .= '<tr><td>Content</td><td>'.$row["content"].'</td></tr>';
            $eventinformation .= '<tbody></table>';
        }
        else if ($eventtype == "p") {
            $query = "SELECT id, user, title, date, enddate FROM personal_agenda WHERE id = '$eventid'"; 
            $result = mysqli_query($connect, $query);
            $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
            // BUILD THE TABLE
            $eventinformation  = '<table cellpadding="0" cellspacing = "0" class = "eventdescription">';
            $eventinformation .= '<tbody>';
            $eventinformation .= '<tr><td>Title</td><td>'.$row["title"].'</td></tr>';
            $eventinformation .= '<tr><td>Course</td><td>'.$row["coursetitle"].'</td></tr>';
            $eventinformation .= '<tr><td>Start Time</td><td>'.$row["date"].'</td></tr>';
            $eventinformation .= '<tr><td>End Time</td><td>'.$row["enddate"].'</td></tr>';
            $eventinformation .= '<tbody></table>';
        }
            

        $tpl = new Template ();
	    $tpl->assign('default_view', $defaultView);
	    $tpl->assign('content', $eventinformation);
        // Loading main Chamilo 1 col template
	    $tpl->display_one_col_template();
        
        
   ?>
</body>