<!DOCTYPE html>
<head>
    <?php 
    require_once'calendarfunctions.php'; 
    require_once '../inc/global.inc.php';
    ?>
    <style>
        table.calendar		{ border-left:1px solid #999; }
        tr.calendar-row	{ height: 100px; vertical-align: top;}
        td.calendar-day	{  font-size:11px; position:relative; } * html div.calendar-day { }
        td.calendar-day:hover	{ background:#eceff5; }
        td.calendar-day-np	{ background:#eee; min-height:200px; } * html div.calendar-day-np { height:200px; }
        td.calendar-day-head { background:#ccc; font-weight:bold; text-align:center; width:120px; padding:5px; border-bottom:1px solid #999; border-top:1px solid #999; border-right:1px solid #999; }
        div.day-number		{ background:#999; padding:5px; color:#fff; font-weight:bold; float:left; clear:both; margin:-5px -5px 0 0; width:20px; text-align:center; }
        /* shared */
        td.calendar-day, td.calendar-day-np { width:120px; padding:5px; border-bottom:1px solid #999; border-right:1px solid #999; }
        .event {color:red; font-size: 14px; clear:both; margin-top:30px; text-align:center;}
        </style>
</head>
<body>
    <?php 
    /* date settings */
        
        $month = (int) ($_GET['month'] ? $_GET['month'] : date('m'));
        $year = (int)  ($_GET['year'] ? $_GET['year'] : date('Y'));
        
        /* select month control */
        $select_month_control = '<select name="month" id="month">';
        for($x = 1; $x <= 12; $x++) {
        	$select_month_control.= '<option value="'.$x.'"'.($x != $month ? '' : ' selected="selected"').'>'.date('F',mktime(0,0,0,$x,1,$year)).'</option>';
        }
        $select_month_control.= '</select>';
        
        /* select year control */
        $year_range = 7;
        $select_year_control = '<select name="year" id="year">';
        
        /*for ($x = $thisyear; $x <= $thisyear + 6; $x++) { */
        for($x = ($year-floor($year_range/2)); $x <= ($year+floor($year_range/2)); $x++) {
        	$select_year_control.= '<option value="'.$x.'"'.($x != $year ? '' : ' selected="selected"').'>'.$x.'</option>';
        }
        $select_year_control.= '</select>';
        
        /* "next month" control */
        $next_month_link = '<a href="?month='.($month != 12 ? $month + 1 : 1).'&year='.($month != 12 ? $year : $year + 1).'" class="control">Next Month >></a>';
        
        /* "previous month" control */
        $previous_month_link = '<a href="?month='.($month != 1 ? $month - 1 : 12).'&year='.($month != 1 ? $year : $year - 1).'" class="control"><< 	Previous Month</a>';
        
        /* bringing the controls together */
        $controls = '<form method="get">'.$select_month_control.$select_year_control.' <input type="submit" name="submit" value="Go" />      '.$previous_month_link.'     '.$next_month_link.' </form>';
        
        echo $controls;
        echo draw_calendar($month, $year);
   ?>
    
</body>
