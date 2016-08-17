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
            $eventinformation = '<div class="vieweventmenu"><a href="#" onclick = "history.back();"><img class ="backbutton" src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/back.png" alt="Back" title="Back"></a>';
            $eventinformation .= '<a href ="./calendaradd.php?action=edit&type=fromjs&id=course_'.$row["id"].'&course_id=undefined"><img class="editbutton" src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/editevent.png" alt="Edit Event" title="Edit Event"></a></div>';
            $eventinformation .= '<table cellpadding="0" cellspacing = "0" class = "eventdescription">';
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
            $query = "SELECT id, user, title, date, enddate, videoconference, text FROM personal_agenda WHERE id = '$eventid'"; 
            $result = mysqli_query($connect, $query);
            $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
            // BUILD THE TABLE
            $eventinformation = '<div class="vieweventmenu"><a href="#" onclick = "history.back();"><img class ="backbutton" src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/back.png" alt="Back" title="Back"></a>';
            $eventinformation .= '<a href ="./calendaradd.php?action=edit&type=fromjs&id=personal_'.$row["id"].'&course_id=undefined"><img class="editbutton" src="https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/32/editevent.png" alt="Edit Event" title="Edit Event"></a></div>';
            $eventinformation .= '<table cellpadding="0" cellspacing = "0" class = "eventdescription">';
            $eventinformation .= '<tbody>';
            $eventinformation .= '<tr><td>Title</td><td>'.$row["title"].'</td></tr>';
            $eventinformation .= '<tr><td>Course</td><td>'.$row["coursetitle"].'</td></tr>';
            $eventinformation .= '<tr><td>Start Time</td><td>'.$row["date"].'</td></tr>';
            $eventinformation .= '<tr><td>End Time</td><td>'.$row["enddate"].'</td></tr>';
            $eventinformation .= '<tr><td>Video Conference</td><td>'.$row["videoconference"].'</td></tr>';
            $eventinformation .= '<tr><td>Content</td><td>'.$row["text"].'</td></tr>';
            $eventinformation .= '<tbody></table>';
        }
            
        $tpl = new Template ();
	    $tpl->assign('default_view', $defaultView);
	    $tpl->assign('content', $eventinformation);
        // Loading main Chamilo 1 col template
	    $tpl->display_one_col_template();
   ?>
</body>