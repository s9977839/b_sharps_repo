<?php
/* For licensing terms, see /license.txt */

/**
 * Class GradebookUtils
 */
class GradebookUtils
{
    /**
     * Adds a resource to the unique gradebook of a given course
     * @param   int
     * @param   string  Course code
     * @param   int     Resource type (use constants defined in linkfactory.class.php)
     * @param   int     Resource ID in the corresponding tool
     * @param   string  Resource name to show in the gradebook
     * @param   int     Resource weight to set in the gradebook
     * @param   int     Resource max
     * @param   string  Resource description
     * @param   int     Visibility (0 hidden, 1 shown)
     * @param   int     Session ID (optional or 0 if not defined)
     * @param   int
     * @param integer $resource_type
     * @return  boolean True on success, false on failure
     */
    public static function add_resource_to_course_gradebook(
        $category_id,
        $course_code,
        $resource_type,
        $resource_id,
        $resource_name = '',
        $weight = 0,
        $max = 0,
        $resource_description = '',
        $visible = 0,
        $session_id = 0,
        $link_id = null
    ) {
        $link = LinkFactory :: create($resource_type);
        $link->set_user_id(api_get_user_id());
        $link->set_course_code($course_code);

        if (empty($category_id)) {
            return false;
        }
        $link->set_category_id($category_id);
        if ($link->needs_name_and_description()) {
            $link->set_name($resource_name);
        } else {
            $link->set_ref_id($resource_id);
        }
        $link->set_weight($weight);

        if ($link->needs_max()) {
            $link->set_max($max);
        }
        if ($link->needs_name_and_description()) {
            $link->set_description($resource_description);
        }

        $link->set_visible(empty($visible) ? 0 : 1);

        if (!empty($session_id)) {
            $link->set_session_id($session_id);
        }
        $link->add();
        return true;
    }

    /**
     * Update a resource weight
     * @param    int     Link/Resource ID
     * @param   string
     * @param float
     * @return   bool    false on error, true on success
     */
    public static function update_resource_from_course_gradebook($link_id, $course_code, $weight)
    {
        $course_code = Database::escape_string($course_code);
        if (!empty($link_id)) {
            $link_id = intval($link_id);
            $sql = 'UPDATE ' . Database :: get_main_table(TABLE_MAIN_GRADEBOOK_LINK) . '
                    SET weight = ' . "'" . Database::escape_string((float) $weight) . "'" . '
                    WHERE course_code = "' . $course_code . '" AND id = ' . $link_id;
            Database::query($sql);
        }

        return true;
    }

    /**
     * Remove a resource from the unique gradebook of a given course
     * @param    int     Link/Resource ID
     * @return   bool    false on error, true on success
     */
    public static function remove_resource_from_course_gradebook($link_id)
    {
        if (empty($link_id)) {
            return false;
        }

        // TODO find the corresponding category (the first one for this course, ordered by ID)
        $l = Database::get_main_table(TABLE_MAIN_GRADEBOOK_LINK);
        $sql = "DELETE FROM $l WHERE id = ".(int)$link_id;
        Database::query($sql);

        return true;
    }

    /**
     * Block students
     */
    public static function block_students()
    {
        if (!api_is_allowed_to_edit()) {
            api_not_allowed();
        }
    }

    /**
     * Builds an img tag for a gradebook item
     */
    public static function build_type_icon_tag($kind, $attributes = array())
    {
        return Display::return_icon(self::get_icon_file_name($kind), ' ', $attributes, ICON_SIZE_SMALL);
    }

    /**
     * Returns the icon filename for a gradebook item
     * @param string $type value returned by a gradebookitem's get_icon_name()
     */
    public static function get_icon_file_name($type)
    {
        switch ($type) {
            case 'cat':
                $icon = 'gradebook.png';
                break;
            case 'evalempty':
                $icon = 'empty_evaluation.png';
                break;
            case 'evalnotempty':
                $icon = 'no_empty_evaluation.png';
                break;
            case 'exercise':
            case LINK_EXERCISE:
                $icon = 'quiz.gif';
                break;
            case 'learnpath':
            case LINK_LEARNPATH:
                $icon = 'learnpath.png';
                break;
            case 'studentpublication':
            case LINK_STUDENTPUBLICATION:
                $icon = 'works.gif';
                break;
            case 'link':
                $icon = 'link.gif';
                break;
            case 'forum':
            case LINK_FORUM_THREAD:
                $icon = 'forum.gif';
                break;
            case 'attendance':
            case LINK_ATTENDANCE:
                $icon = 'attendance.gif';
                break;
            case 'survey':
            case LINK_SURVEY:
                $icon = 'survey.gif';
                break;
            case 'dropbox':
            case LINK_DROPBOX:
                $icon = 'dropbox.gif';
                break;
            default:
                $icon = 'link.gif';
                break;
        }

        return $icon;
    }

    /**
     * Builds the course or platform admin icons to edit a category
     * @param Category $cat category
     * @param Category $selectcat id of selected category
     */
    public static function build_edit_icons_cat($cat, $selectcat)
    {
        $show_message = $cat->show_message_resource_delete($cat->get_course_code());
        $grade_model_id = $selectcat->get_grade_model_id();
        $selectcat = $selectcat->get_id();
        $modify_icons = null;

        if ($show_message === false) {
            $visibility_icon = ($cat->is_visible() == 0) ? 'invisible' : 'visible';
            $visibility_command = ($cat->is_visible() == 0) ? 'set_visible' : 'set_invisible';

            $modify_icons .= '<a class="view_children" data-cat-id="' . $cat->get_id() . '" href="javascript:void(0);">' .
                Display::return_icon('view_more_stats.gif', get_lang('Show'), '', ICON_SIZE_SMALL) . '</a>';

            if (!api_is_allowed_to_edit(null, true)) {
                $modify_icons .= Display::url(
                    Display::return_icon(
                        'stats.png',
                        get_lang('FlatView'),
                        '',
                        ICON_SIZE_SMALL
                    ),
                    'personal_stats.php?' . http_build_query([
                        'selectcat' => $cat->get_id()
                    ]) . '&' . api_get_cidreq(),
                    [
                        'class' => 'ajax',
                        'data-title' => get_lang('FlatView')
                    ]
                );
            }

            if (api_is_allowed_to_edit(null, true)) {

                // Locking button
                if (api_get_setting('gradebook_locking_enabled') == 'true') {
                    if ($cat->is_locked()) {
                        if (api_is_platform_admin()) {
                            $modify_icons .= '&nbsp;<a onclick="javascript:if (!confirm(\'' . addslashes(get_lang('ConfirmToUnlockElement')) . '\')) return false;" href="' . api_get_self() . '?' . api_get_cidreq() . '&category_id=' . $cat->get_id() . '&action=unlock">' .
                                Display::return_icon('lock.png', get_lang('UnLockEvaluation'), '', ICON_SIZE_SMALL) . '</a>';
                        } else {
                            $modify_icons .= '&nbsp;<a href="#">' . Display::return_icon('lock_na.png', get_lang('GradebookLockedAlert'), '', ICON_SIZE_SMALL) . '</a>';
                        }
                        $modify_icons .= '&nbsp;<a href="gradebook_flatview.php?export_pdf=category&selectcat=' . $cat->get_id() . '" >' . Display::return_icon('pdf.png', get_lang('ExportToPDF'), '', ICON_SIZE_SMALL) . '</a>';
                    } else {
                        $modify_icons .= '&nbsp;<a onclick="javascript:if (!confirm(\'' . addslashes(get_lang('ConfirmToLockElement')) . '\')) return false;" href="' . api_get_self() . '?' . api_get_cidreq() . '&category_id=' . $cat->get_id() . '&action=lock">' .
                            Display::return_icon('unlock.png', get_lang('LockEvaluation'), '', ICON_SIZE_SMALL) . '</a>';
                        $modify_icons .= '&nbsp;<a href="#" >' . Display::return_icon('pdf_na.png', get_lang('ExportToPDF'), '', ICON_SIZE_SMALL) . '</a>';
                    }
                }

                if (empty($grade_model_id) || $grade_model_id == -1) {
                    if ($cat->is_locked() && !api_is_platform_admin()) {
                        $modify_icons .= Display::return_icon('edit_na.png', get_lang('Modify'), '', ICON_SIZE_SMALL);
                    } else {
                        $modify_icons .= '<a href="gradebook_edit_cat.php?' .'editcat=' . $cat->get_id() . '&cidReq=' .$cat->get_course_code() . '&id_session='.$cat->get_session_id().'">' .
                            Display::return_icon(
                                'edit.png',
                                get_lang('Modify'),
                                '',
                                ICON_SIZE_SMALL
                            ) . '</a>';
                    }
                }

               $modify_icons .= '<a href="gradebook_edit_all.php?selectcat=' .$cat->get_id() . '&cidReq=' . $cat->get_course_code() . '&id_session='.$cat->get_session_id().'">' .
                    Display::return_icon(
                        'percentage.png',
                        get_lang('EditAllWeights'),
                        '',
                        ICON_SIZE_SMALL
                    ) . '</a>';

                $modify_icons .= '<a href="gradebook_flatview.php?selectcat=' .$cat->get_id() . '&cidReq=' . $cat->get_course_code() . '&id_session='.$cat->get_session_id(). '">' .
                    Display::return_icon(
                        'stats.png',
                        get_lang('FlatView'),
                        '',
                        ICON_SIZE_SMALL
                    ) . '</a>';
                $modify_icons .= '&nbsp;<a href="' . api_get_self() .'?visiblecat=' . $cat->get_id() . '&' .$visibility_command . '=&selectcat=' . $selectcat .'&cidReq=' . $cat->get_course_code() . '&id_session='.$cat->get_session_id(). '">' .
                    Display::return_icon(
                        $visibility_icon . '.png',
                        get_lang('Visible'),
                        '',
                        ICON_SIZE_SMALL
                    ) . '</a>';

                if ($cat->is_locked() && !api_is_platform_admin()) {
                    $modify_icons .= Display::return_icon('delete_na.png', get_lang('DeleteAll'), '', ICON_SIZE_SMALL);
                } else {
                    $modify_icons .= '&nbsp;<a href="' . api_get_self() . '?deletecat=' . $cat->get_id() . '&selectcat=' . $selectcat . '&cidReq=' . $cat->get_course_code() . '&id_session='.$cat->get_session_id(). '" onclick="return confirmation();">' .
                        Display::return_icon('delete.png', get_lang('DeleteAll'), '', ICON_SIZE_SMALL) . '</a>';
                }
            }

            return $modify_icons;
        }
    }

    /**
     * Builds the course or platform admin icons to edit an evaluation
     * @param  Evaluation $eval evaluation object
     * @param int $selectcat id of selected category
     */
    public static function build_edit_icons_eval($eval, $selectcat)
    {
        $status = CourseManager::get_user_in_course_status(api_get_user_id(), api_get_course_id());
        $is_locked = $eval->is_locked();
        $eval->get_course_code();
        $cat = new Category();
        $message_eval = $cat->show_message_resource_delete($eval->get_course_code());

        if ($message_eval === false && api_is_allowed_to_edit(null, true)) {
            $visibility_icon = ($eval->is_visible() == 0) ? 'invisible' : 'visible';
            $visibility_command = ($eval->is_visible() == 0) ? 'set_visible' : 'set_invisible';
            if ($is_locked && !api_is_platform_admin()) {
                $modify_icons = Display::return_icon('edit_na.png', get_lang('Modify'), '', ICON_SIZE_SMALL);
            } else {
                $modify_icons = '<a href="gradebook_edit_eval.php?editeval=' . $eval->get_id() . '&cidReq=' . $eval->get_course_code() . '&id_session='.$eval->getSessionId(). '">' .
                    Display::return_icon('edit.png', get_lang('Modify'), '', ICON_SIZE_SMALL) . '</a>';
            }

            $modify_icons .= '&nbsp;<a href="' . api_get_self() . '?visibleeval=' . $eval->get_id() . '&' . $visibility_command . '=&selectcat=' . $selectcat . '&id_session='.$eval->getSessionId(). ' ">' .
                Display::return_icon($visibility_icon . '.png', get_lang('Visible'), '', ICON_SIZE_SMALL) . '</a>';
            if (api_is_allowed_to_edit(null, true)) {
                $modify_icons .= '&nbsp;<a href="gradebook_showlog_eval.php?visiblelog=' . $eval->get_id() . '&selectcat=' . $selectcat . ' &cidReq=' . $eval->get_course_code() . '&id_session='.$eval->getSessionId(). '">' .
                    Display::return_icon('history.png', get_lang('GradebookQualifyLog'), '', ICON_SIZE_SMALL) . '</a>';
            }

            if ($is_locked && !api_is_platform_admin()) {
                $modify_icons .= '&nbsp;' . Display::return_icon('delete_na.png', get_lang('Delete'), '', ICON_SIZE_SMALL);
            } else {
                $modify_icons .= '&nbsp;<a href="' . api_get_self() . '?deleteeval=' . $eval->get_id() . '&selectcat=' . $selectcat . ' &cidReq=' . $eval->get_course_code() . '&id_session='.$eval->getSessionId(). '" onclick="return confirmation();">' . Display::return_icon('delete.png', get_lang('Delete'), '', ICON_SIZE_SMALL) . '</a>';
            }
            return $modify_icons;
        }
    }

    /**
     * Builds the course or platform admin icons to edit a link
     * @param AbstractLink $link
     * @param int $selectcat id of selected category
     */
    public static function build_edit_icons_link($link, $selectcat)
    {
        $cat = new Category();
        $message_link = $cat->show_message_resource_delete($link->get_course_code());
        $is_locked = $link->is_locked();

        $modify_icons = null;

        if (!api_is_allowed_to_edit(null, true)) {
            return null;
        }

        if ($message_link === false) {
            $visibility_icon = ($link->is_visible() == 0) ? 'invisible' : 'visible';
            $visibility_command = ($link->is_visible() == 0) ? 'set_visible' : 'set_invisible';

            if ($is_locked && !api_is_platform_admin()) {
                $modify_icons = Display::return_icon('edit_na.png', get_lang('Modify'), '', ICON_SIZE_SMALL);
            } else {
                $modify_icons = '<a href="gradebook_edit_link.php?editlink=' . $link->get_id() . '&cidReq=' . $link->get_course_code() . '&id_session='.$link->get_session_id().'">' .
                    Display::return_icon('edit.png', get_lang('Modify'), '', ICON_SIZE_SMALL) . '</a>';
            }
            $modify_icons .= '&nbsp;<a href="' . api_get_self() . '?visiblelink=' . $link->get_id() . '&' . $visibility_command . '=&selectcat=' . $selectcat . '&id_session='.$link->get_session_id(). ' ">' .
                Display::return_icon($visibility_icon . '.png', get_lang('Visible'), '', ICON_SIZE_SMALL) . '</a>';
            $modify_icons .= '&nbsp;<a href="gradebook_showlog_link.php?visiblelink=' . $link->get_id() . '&selectcat=' . $selectcat . '&cidReq=' . $link->get_course_code() . '&id_session='.$link->get_session_id(). '">' .
                Display::return_icon('history.png', get_lang('GradebookQualifyLog'), '', ICON_SIZE_SMALL) . '</a>';

            //If a work is added in a gradebook you can only delete the link in the work tool

            if ($is_locked && !api_is_platform_admin()) {
                $modify_icons .= '&nbsp;' . Display::return_icon('delete_na.png', get_lang('Delete'), '', ICON_SIZE_SMALL);
            } else {
                $modify_icons .= '&nbsp;<a href="' . api_get_self() . '?deletelink=' . $link->get_id() . '&selectcat=' . $selectcat . ' &cidReq=' . $link->get_course_code() . '&id_session='.$link->get_session_id(). '" onclick="return confirmation();">' .
                    Display::return_icon('delete.png', get_lang('Delete'), '', ICON_SIZE_SMALL) . '</a>';
            }
            return $modify_icons;
        }
    }

    /**
     * Checks if a resource is in the unique gradebook of a given course
     * @param    string  $course_code Course code
     * @param    int     $resource_type Resource type (use constants defined in linkfactory.class.php)
     * @param    int     $resource_id Resource ID in the corresponding tool
     * @param    int     $session_id Session ID (optional -  0 if not defined)
     *
     * @return   array     false on error or array of resource
     */
    public static function is_resource_in_course_gradebook($course_code, $resource_type, $resource_id, $session_id = 0)
    {
        $table = Database::get_main_table(TABLE_MAIN_GRADEBOOK_LINK);
        $course_code = Database::escape_string($course_code);
        $sql = "SELECT * FROM $table l
                WHERE
                    course_code = '$course_code' AND
                    type = ".(int)$resource_type . " AND
                    ref_id = " . (int)$resource_id;
        $res = Database::query($sql);

        if (Database::num_rows($res) < 1) {
            return false;
        }
        $row = Database::fetch_array($res, 'ASSOC');
        
        return $row;
    }

    /**
     * Remove a resource from the unique gradebook of a given course
     * @param    int     Link/Resource ID
     * @return   bool    false on error, true on success
     */
    public static function get_resource_from_course_gradebook($link_id)
    {
        if (empty($link_id)) {
            return false;
        }
        // TODO find the corresponding category (the first one for this course, ordered by ID)
        $l = Database::get_main_table(TABLE_MAIN_GRADEBOOK_LINK);
        $sql = "SELECT * FROM $l WHERE id = " . (int) $link_id;
        $res = Database::query($sql);
        $row = array();
        if (Database::num_rows($res) > 0) {
            $row = Database::fetch_array($res, 'ASSOC');
        }
        return $row;
    }

    /**
     * Return the course id
     * @param    int
     * @return   String
     */
    public static function get_course_id_by_link_id($id_link)
    {
        $course_table = Database::get_main_table(TABLE_MAIN_COURSE);
        $tbl_grade_links = Database::get_main_table(TABLE_MAIN_GRADEBOOK_LINK);
        $sql = 'SELECT c.id FROM ' . $course_table . ' c
                INNER JOIN ' . $tbl_grade_links . ' l
                ON c.code = l.course_code
                WHERE l.id=' . intval($id_link) . ' OR l.category_id=' . intval($id_link);
        $res = Database::query($sql);
        $array = Database::fetch_array($res, 'ASSOC');
        return $array['id'];
    }

    /**
     * @param $type
     * @return string
     */
    public static function get_table_type_course($type)
    {
        global $table_evaluated;
        return Database::get_course_table($table_evaluated[$type][0]);
    }

    /**
     * @param Category $cat
     * @param $users
     * @param $alleval
     * @param $alllinks
     * @param $params
     * @param null $mainCourseCategory
     * @return array
     */
    public static function get_printable_data($cat, $users, $alleval, $alllinks, $params, $mainCourseCategory = null)
    {
        $datagen = new FlatViewDataGenerator(
            $users,
            $alleval,
            $alllinks,
            $params,
            $mainCourseCategory
        );

        $offset = isset($_GET['offset']) ? $_GET['offset'] : '0';
        $offset = intval($offset);

        // step 2: generate rows: students
        $datagen->category = $cat;

        $count = (($offset + 10) > $datagen->get_total_items_count()) ? ($datagen->get_total_items_count() - $offset) : GRADEBOOK_ITEM_LIMIT;
        $header_names = $datagen->get_header_names($offset, $count, true);
        $data_array = $datagen->get_data(
            FlatViewDataGenerator :: FVDG_SORT_LASTNAME,
            0,
            null,
            $offset,
            $count,
            true,
            true
        );

        $result = array();
        foreach ($data_array as $data) {
            $result[] = array_slice($data, 1);
        }
        $return = array($header_names, $result);

        return $return;
    }

    /**
     * XML-parser: handle character data
     */
    public static function character_data($parser, $data)
    {
        global $current_value;
        $current_value = $data;
    }

    /**
     * XML-parser: handle end of element
     */
    public static function element_end($parser, $data)
    {
        global $user;
        global $users;
        global $current_value;
        switch ($data) {
            case 'Result' :
                $users[] = $user;
                break;
            default :
                $user[$data] = $current_value;
                break;
        }
    }

    /**
     * XML-parser: handle start of element
     */
    public static function element_start($parser, $data)
    {
        global $user;
        global $current_tag;
        switch ($data) {
            case 'Result' :
                $user = array();
                break;
            default :
                $current_tag = $data;
        }
    }

    public static function overwritescore($resid, $importscore, $eval_max)
    {
        $result = Result :: load($resid);
        if ($importscore > $eval_max) {
            header('Location: gradebook_view_result.php?selecteval=' . Security::remove_XSS($_GET['selecteval']) . '&overwritemax=');
            exit;
        }
        $result[0]->set_score($importscore);
        $result[0]->save();
        unset($result);
    }

    /**
     * Read the XML-file
     * @param string $file Path to the XML-file
     * @return array All user information read from the file
     */
    public static function parse_xml_data($file)
    {
        global $current_tag;
        global $current_value;
        global $user;
        global $users;
        $users = array();
        $parser = xml_parser_create();
        xml_set_element_handler($parser, 'element_start', 'element_end');
        xml_set_character_data_handler($parser, "character_data");
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, false);
        xml_parse($parser, file_get_contents($file));
        xml_parser_free($parser);
        return $users;
    }

    /**
     * register user info about certificate
     * @param int The category id
     * @param int The user id
     * @param float The score obtained for certified
     * @param Datetime The date when you obtained the certificate
     * @param integer $cat_id
     * @param integer $user_id
     * @param string $date_certificate
     * @return void()
     */
    public static function register_user_info_about_certificate($cat_id, $user_id, $score_certificate, $date_certificate)
    {
        $table = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CERTIFICATE);
        $sql = 'SELECT COUNT(*) as count
                FROM ' . $table . ' gc
                WHERE gc.cat_id="' . intval($cat_id) . '" AND user_id="' . intval($user_id) . '" ';
        $rs_exist = Database::query($sql);
        $row = Database::fetch_array($rs_exist);
        if ($row['count'] == 0) {
            $params = [
                'cat_id' => $cat_id,
                'user_id' => $user_id,
                'score_certificate' => $score_certificate,
                'created_at' => $date_certificate
            ];
            Database::insert($table, $params);
        }
    }

    /**
     * Get date of user certificate
     * @param int $cat_id The category id
     * @param int $user_id The user id
     * @return Datetime The date when you obtained the certificate
     */
    public static function get_certificate_by_user_id($cat_id, $user_id)
    {
        $table_certificate = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CERTIFICATE);
        $sql = 'SELECT * FROM ' . $table_certificate . '
                WHERE cat_id="' . intval($cat_id) . '" AND user_id="' . intval($user_id) . '"';

        $result = Database::query($sql);
        $row = Database::fetch_array($result, 'ASSOC');

        return $row;
    }

    /**
     * Get list of users certificates
     * @param int $cat_id The category id
     * @param array $userList Only users in this list
     * @return array
     */
    public static function get_list_users_certificates($cat_id = null, $userList = array())
    {
        $table_certificate = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CERTIFICATE);
        $table_user = Database::get_main_table(TABLE_MAIN_USER);
        $sql = 'SELECT DISTINCT u.user_id, u.lastname, u.firstname, u.username
                FROM ' . $table_user . ' u
                INNER JOIN ' . $table_certificate . ' gc
                ON u.user_id=gc.user_id ';
        if (!is_null($cat_id) && $cat_id > 0) {
            $sql.=' WHERE cat_id=' . intval($cat_id);
        }
        if (!empty($userList)) {
            $userList = array_map('intval', $userList);
            $userListCondition = implode("','", $userList);
            $sql .= " AND u.user_id IN ('$userListCondition')";
        }
        $sql.=' ORDER BY u.firstname';
        $rs = Database::query($sql);

        $list_users = array();
        while ($row = Database::fetch_array($rs)) {
            $list_users[] = $row;
        }

        return $list_users;
    }

    /**
     * Gets the certificate list by user id
     * @param int $user_id The user id
     * @param int $cat_id The category id
     * @return array
     */
    public static function get_list_gradebook_certificates_by_user_id($user_id, $cat_id = null)
    {
        $table_certificate = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CERTIFICATE);
        $sql = 'SELECT gc.score_certificate, gc.created_at, gc.path_certificate, gc.cat_id, gc.user_id, gc.id
                FROM  ' . $table_certificate . ' gc
                WHERE gc.user_id="' . intval($user_id) . '" ';
        if (!is_null($cat_id) && $cat_id > 0) {
            $sql.=' AND cat_id=' . intval($cat_id);
        }

        $rs = Database::query($sql);
        $list_certificate = array();
        while ($row = Database::fetch_array($rs)) {
            $list_certificate[] = $row;
        }
        return $list_certificate;
    }

    /**
     * @param int $user_id
     * @param string $course_code
     * @param int $sessionId
     * @param bool $is_preview
     * @param bool $hide_print_button
     *
     * @return array
     */
    public static function get_user_certificate_content($user_id, $course_code, $sessionId, $is_preview = false, $hide_print_button = false)
    {
        // Generate document HTML
        $content_html = DocumentManager::replace_user_info_into_html($user_id, $course_code, $sessionId, $is_preview);
        $new_content_html = null;
        $variables = null;
        $contentHead = null;

        if (isset($content_html['content'])) {
            $new_content = explode('</head>', $content_html['content']);
            $new_content_html = $new_content[1];
            $contentHead = $new_content[0];
        }

        if (isset($content_html['variables'])) {
            $variables = $content_html['variables'];
        }

        $path_image = api_get_path(WEB_COURSE_PATH) . api_get_course_path($course_code) . '/document/images/gallery';
        $new_content_html = str_replace('../images/gallery', $path_image, $new_content_html);

        $path_image_in_default_course = api_get_path(WEB_CODE_PATH) . 'default_course_document';
        $new_content_html = str_replace('/main/default_course_document', $path_image_in_default_course, $new_content_html);
        $new_content_html = str_replace(SYS_CODE_PATH . 'img/', api_get_path(WEB_IMG_PATH), $new_content_html);
        $print = '';

        //add print header
        if ($hide_print_button == false) {
            $print .= '<style media="print" type="text/css">#print_div {visibility:hidden;}</style>';
            $print .= '<a href="javascript:window.print();" style="float:right; padding:4px;" id="print_div">';
            $print .= Display::return_icon('printmgr.gif', get_lang('Print'));
            $print .= '</a>';
        }

        // Add header
        $new_content_html =  $contentHead. $print . '</head>' . $new_content_html;

        return array(
            'content' => $new_content_html,
            'variables' => $variables
        );
    }

    /**
     * @param null $course_code
     * @param int $gradebook_model_id
     * @return mixed
     */
    public static function create_default_course_gradebook($course_code = null, $gradebook_model_id = 0)
    {
        if (api_is_allowed_to_edit(true, true)) {
            if (!isset($course_code) || empty($course_code)) {
                $course_code = api_get_course_id();
            }
            $session_id = api_get_session_id();

            $t = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CATEGORY);
            $sql = "SELECT * FROM $t WHERE course_code = '" . Database::escape_string($course_code) . "' ";
            if (!empty($session_id)) {
                $sql .= " AND session_id = " . (int) $session_id;
            } else {
                $sql .= " AND (session_id IS NULL OR session_id = 0) ";
            }
            $sql .= " ORDER BY id";
            $res = Database::query($sql);
            if (Database::num_rows($res) < 1) {
                //there is no unique category for this course+session combination,
                $cat = new Category();
                if (!empty($session_id)) {
                    $my_session_id = api_get_session_id();
                    $s_name = api_get_session_name($my_session_id);
                    $cat->set_name($course_code . ' - ' . get_lang('Session') . ' ' . $s_name);
                    $cat->set_session_id($session_id);
                } else {
                    $cat->set_name($course_code);
                }
                $cat->set_course_code($course_code);
                $cat->set_description(null);
                $cat->set_user_id(api_get_user_id());
                $cat->set_parent_id(0);
                $default_weight_setting = api_get_setting('gradebook_default_weight');
                $default_weight = isset($default_weight_setting) && !empty($default_weight_setting) ? $default_weight_setting : 100;
                $cat->set_weight($default_weight);

                $cat->set_grade_model_id($gradebook_model_id);
                $cat->set_certificate_min_score(75);

                $cat->set_visible(0);
                $cat->add();
                $category_id = $cat->get_id();
                unset($cat);
            } else {
                $row = Database::fetch_array($res);
                $category_id = $row['id'];
            }

            return $category_id;
        }

        return false;
    }

    /**
     * @param FormValidator $form
     */
    public static function load_gradebook_select_in_tool($form)
    {
        $course_code = api_get_course_id();
        $session_id = api_get_session_id();

        self::create_default_course_gradebook();

        // Cat list
        $all_categories = Category :: load(null, null, $course_code, null, null, $session_id, false);
        $select_gradebook = $form->addElement('select', 'category_id', get_lang('SelectGradebook'));

        if (!empty($all_categories)) {
            foreach ($all_categories as $my_cat) {
                if ($my_cat->get_course_code() == api_get_course_id()) {
                    $grade_model_id = $my_cat->get_grade_model_id();
                    if (empty($grade_model_id)) {
                        if ($my_cat->get_parent_id() == 0) {
                            //$default_weight = $my_cat->get_weight();
                            $select_gradebook->addoption(get_lang('Default'), $my_cat->get_id());
                            $cats_added[] = $my_cat->get_id();
                        } else {
                            $select_gradebook->addoption($my_cat->get_name(), $my_cat->get_id());
                            $cats_added[] = $my_cat->get_id();
                        }
                    } else {
                        $select_gradebook->addoption(get_lang('Select'), 0);
                    }
                }
            }
        }
    }

    /**
     * @param FlatViewTable $flatviewtable
     * @param Category $cat
     * @param $users
     * @param $alleval
     * @param $alllinks
     * @param array $params
     * @param null $mainCourseCategory
     */
    public static function export_pdf_flatview(
        $flatviewtable,
        $cat,
        $users,
        $alleval,
        $alllinks,
        $params = array(),
        $mainCourseCategory = null
    ) {

        // Getting data
        $printable_data = self::get_printable_data($cat[0], $users, $alleval, $alllinks, $params, $mainCourseCategory);

        // HTML report creation first
        $course_code = trim($cat[0]->get_course_code());

        $displayscore = ScoreDisplay :: instance();
        $customdisplays = $displayscore->get_custom_score_display_settings();

        $total = array();
        if (is_array($customdisplays) && count(($customdisplays))) {
            foreach ($customdisplays as $custom) {
                $total[$custom['display']] = 0;
            }
            $user_results = $flatviewtable->datagen->get_data_to_graph2(false);
            foreach ($user_results as $user_result) {
                $total[$user_result[count($user_result) - 1][1]]++;
            }
        }

        $parent_id = $cat[0]->get_parent_id();
        if (isset($cat[0]) && isset($parent_id)) {
            if ($parent_id == 0) {
                $grade_model_id = $cat[0]->get_grade_model_id();
            } else {
                $parent_cat = Category::load($parent_id);
                $grade_model_id = $parent_cat[0]->get_grade_model_id();
            }
        }

        $use_grade_model = true;
        if (empty($grade_model_id) || $grade_model_id == -1) {
            $use_grade_model = false;
        }

        if ($use_grade_model) {
            if ($parent_id == 0) {
                $title = api_strtoupper(get_lang('Average')) . '<br />' . get_lang('Detailed');
            } else {
                $title = api_strtoupper(get_lang('Average')) . '<br />' . $cat[0]->get_description() . ' - (' . $cat[0]->get_name() . ')';
            }
        } else {
            if ($parent_id == 0) {
                $title = api_strtoupper(get_lang('Average')) . '<br />' . get_lang('Detailed');
            } else {
                $title = api_strtoupper(get_lang('Average'));
            }
        }

        $columns = count($printable_data[0]);
        $has_data = is_array($printable_data[1]) && count($printable_data[1]) > 0;

        $table = new HTML_Table(array('class' => 'data_table'));
        $row = 0;
        $column = 0;

        $table->setHeaderContents($row, $column, get_lang('NumberAbbreviation'));
        $column++;
        foreach ($printable_data[0] as $printable_data_cell) {
            if (!is_array($printable_data_cell)) {
                $printable_data_cell = strip_tags($printable_data_cell);
            }
            $table->setHeaderContents($row, $column, $printable_data_cell);
            $column++;
        }
        $row++;

        if ($has_data) {
            $counter = 1;
            foreach ($printable_data[1] as &$printable_data_row) {
                $column = 0;
                $table->setCellContents($row, $column, $counter);
                $table->updateCellAttributes($row, $column, 'align="center"');
                $column++;
                $counter++;

                foreach ($printable_data_row as $key => &$printable_data_cell) {
                    $attributes = array();
                    $attributes['align'] = 'center';
                    $attributes['style'] = null;

                    if ($key === 'name') {
                        $attributes['align'] = 'left';
                    }
                    if ($key === 'total') {
                        $attributes['style'] = 'font-weight:bold';
                    }
                    $table->setCellContents($row, $column, $printable_data_cell);
                    $table->updateCellAttributes($row, $column, $attributes);
                    $column++;
                }
                $table->updateRowAttributes($row, $row % 2 ? 'class="row_even"' : 'class="row_odd"', true);
                $row++;
            }
        } else {
            $column = 0;
            $table->setCellContents($row, $column, get_lang('NoResults'));
            $table->updateCellAttributes($row, $column, 'colspan="' . $columns . '" align="center" class="row_odd"');
        }

        $pdfParams = array(
            'filename' => get_lang('FlatView') . '_' . api_get_utc_datetime(),
            'pdf_title' => $title,
            'course_code' => $course_code,
            'add_signatures' => true
        );

        $page_format = $params['orientation'] == 'landscape' ? 'A4-L' : 'A4';
        ob_start();
        $pdf = new PDF($page_format, $page_format, $pdfParams);
        $pdf->html_to_pdf_with_template($flatviewtable->return_table());
        $content = ob_get_contents();
        ob_end_clean();
        echo $content;
        exit;
    }

    /**
     * @param string[] $list_values
     * @return string
     */
    public static function score_badges($list_values)
    {
        $counter = 1;
        $badges = array();
        foreach ($list_values as $value) {
            $class = 'warning';
            if ($counter == 1) {
                $class = 'success';
            }
            $counter++;
            $badges[] = Display::badge($value, $class);
        }
        return Display::badge_group($badges);
    }

    /**
     * returns users within a course given by param
     * @param string $courseCode
     */
    public static function get_users_in_course($courseCode)
    {
        $tbl_course_user = Database:: get_main_table(TABLE_MAIN_COURSE_USER);
        $tbl_session_course_user = Database:: get_main_table(TABLE_MAIN_SESSION_COURSE_USER);
        $tbl_user = Database:: get_main_table(TABLE_MAIN_USER);
        $order_clause = api_sort_by_first_name() ? ' ORDER BY firstname, lastname ASC' : ' ORDER BY lastname, firstname ASC';

        $current_session = api_get_session_id();
        $courseCode = Database::escape_string($courseCode);
        $courseInfo = api_get_course_info($courseCode);
        $courseId = $courseInfo['real_id'];

        if (!empty($current_session)) {
            $sql = "SELECT user.user_id, user.username, lastname, firstname, official_code
                    FROM $tbl_session_course_user as scru, $tbl_user as user
                    WHERE
                        scru.user_id = user.user_id AND
                        scru.status=0  AND
                        scru.c_id='$courseId' AND
                        session_id ='$current_session'
                    $order_clause
                    ";
        } else {
            $sql = 'SELECT user.user_id, user.username, lastname, firstname, official_code
                    FROM '.$tbl_course_user.' as course_rel_user, '.$tbl_user.' as user
                    WHERE
                        course_rel_user.user_id=user.user_id AND
                        course_rel_user.status='.STUDENT.' AND
                        course_rel_user.c_id = "'.$courseId.'" '.
                    $order_clause;
        }

        $result = Database::query($sql);

        return self::get_user_array_from_sql_result($result);
    }

    /**
     * @param Doctrine\DBAL\Driver\Statement|null $result
     * @return array
     */
    public static function get_user_array_from_sql_result($result)
    {
        $a_students = array();
        while ($user = Database::fetch_array($result)) {
            if (!array_key_exists($user['user_id'], $a_students)) {
                $a_current_student = array ();
                $a_current_student[] = $user['user_id'];
                $a_current_student[] = $user['username'];
                $a_current_student[] = $user['lastname'];
                $a_current_student[] = $user['firstname'];
                $a_current_student[] = $user['official_code'];
                $a_students['STUD'.$user['user_id']] = $a_current_student;
            }
        }
        return $a_students;
    }

    /**
     * @param array $evals
     * @param array $links
     * @return array
     */
    public static function get_all_users($evals = array(), $links = array())
    {
        $coursecodes = array();
        $users = array();

        // By default add all user in course
        $coursecodes[api_get_course_id()] = '1';
        $users = GradebookUtils::get_users_in_course(api_get_course_id());

        foreach ($evals as $eval) {
            $coursecode = $eval->get_course_code();
            // evaluation in course
            if (isset($coursecode) && !empty($coursecode)) {
                if (!array_key_exists($coursecode, $coursecodes)) {
                    $coursecodes[$coursecode] = '1';
                    $users = array_merge($users, GradebookUtils::get_users_in_course($coursecode));
                }
            } else {
                // course independent evaluation
                $tbl_user = Database :: get_main_table(TABLE_MAIN_USER);
                $tbl_res = Database :: get_main_table(TABLE_MAIN_GRADEBOOK_RESULT);

                $sql = 'SELECT user.user_id, lastname, firstname, user.official_code
                        FROM '.$tbl_res.' as res, '.$tbl_user.' as user
                        WHERE
                            res.evaluation_id = '.intval($eval->get_id()).' AND
                            res.user_id = user.user_id
                        ';
                $sql .= ' ORDER BY lastname, firstname';
                if (api_is_western_name_order()) {
                    $sql .= ' ORDER BY firstname, lastname';
                }

                $result = Database::query($sql);
                $users = array_merge($users, GradebookUtils::get_user_array_from_sql_result($result));
            }
        }

        foreach ($links as $link) {
            // links are always in a course
            $coursecode = $link->get_course_code();
            if (!array_key_exists($coursecode,$coursecodes)) {
                $coursecodes[$coursecode] = '1';
                $users = array_merge($users, GradebookUtils::get_users_in_course($coursecode));
            }
        }

        return $users;
    }

    /**
     * Search students matching a given last name and/or first name
     * @author Bert Steppé
     */
    public static function find_students($mask= '')
    {
        // students shouldn't be here // don't search if mask empty
        if (!api_is_allowed_to_edit() || empty ($mask)) {
            return null;
        }
        $mask = Database::escape_string($mask);

        $tbl_user = Database :: get_main_table(TABLE_MAIN_USER);
        $tbl_cru = Database :: get_main_table(TABLE_MAIN_COURSE_USER);
        $sql = 'SELECT DISTINCT user.user_id, user.lastname, user.firstname, user.email, user.official_code
                FROM ' . $tbl_user . ' user';
        if (!api_is_platform_admin()) {
            $sql .= ', ' . $tbl_cru . ' cru';
        }

        $sql .= ' WHERE user.status = ' . STUDENT;
        $sql .= ' AND (user.lastname LIKE '."'%" . $mask . "%'";
        $sql .= ' OR user.firstname LIKE '."'%" . $mask . "%')";

        if (!api_is_platform_admin()) {
            $sql .= ' AND user.user_id = cru.user_id AND
                      cru.relation_type <> '.COURSE_RELATION_TYPE_RRHH.' AND
                      cru.c_id in (
                            SELECT c_id FROM '.$tbl_cru . '
                            WHERE
                                user_id = ' . api_get_user_id() . ' AND
                                status = ' . COURSEMANAGER . '
                        )
                    ';
        }

        $sql .= ' ORDER BY lastname, firstname';
        if (api_is_western_name_order()) {
            $sql .= ' ORDER BY firstname, lastname';
        }

        $result = Database::query($sql);
        $users = Database::store_result($result);

        return $users;
    }

    /**
     * @param int $linkId
     * @param float $weight
     */
    public static function updateLinkWeight($linkId, $name, $weight)
    {
        $linkId = intval($linkId);
        $weight = floatval($weight);
        $course_id = api_get_course_int_id();

        AbstractLink::add_link_log($linkId, $name);
        $table_link = Database::get_main_table(TABLE_MAIN_GRADEBOOK_LINK);

        $table_evaluation = Database::get_main_table(TABLE_MAIN_GRADEBOOK_EVALUATION);
        $tbl_forum_thread = Database:: get_course_table(TABLE_FORUM_THREAD);
        $tbl_work = Database:: get_course_table(TABLE_STUDENT_PUBLICATION);
        $tbl_attendance = Database:: get_course_table(TABLE_ATTENDANCE);

        $sql = 'UPDATE '.$table_link.' SET weight = '."'".Database::escape_string($weight)."'".'
                WHERE id = '.$linkId;

        Database::query($sql);

        // Update weight for attendance
        $sql = 'SELECT ref_id FROM '.$table_link.'
                WHERE id = '.$linkId.' AND type='.LINK_ATTENDANCE;

        $rs_attendance  = Database::query($sql);
        if (Database::num_rows($rs_attendance) > 0) {
            $row_attendance = Database::fetch_array($rs_attendance);
            $sql = 'UPDATE '.$tbl_attendance.' SET attendance_weight ='.$weight.'
                    WHERE c_id = '.$course_id.' AND  id = '.intval($row_attendance['ref_id']);
            Database::query($sql);
        }
        // Update weight into forum thread
        $sql = 'UPDATE '.$tbl_forum_thread.' SET thread_weight='.$weight.'
                WHERE
                    c_id = '.$course_id.' AND
                    thread_id = (
                        SELECT ref_id FROM '.$table_link.'
                        WHERE id='.$linkId.' AND type='.LINK_FORUM_THREAD.'
                    )
                ';
        Database::query($sql);
        //Update weight into student publication(work)
        $sql = 'UPDATE '.$tbl_work.' SET weight='.$weight.'
                WHERE
                    c_id = '.$course_id.' AND id = (
                    SELECT ref_id FROM '.$table_link.'
                    WHERE id='.$linkId.' AND type = '.LINK_STUDENTPUBLICATION.'
                ) ';
        Database::query($sql);
    }

    /**
     * @param int $id
     * @param float $weight
     */
    public static function updateEvaluationWeight($id, $weight)
    {
        $table_evaluation = Database::get_main_table(TABLE_MAIN_GRADEBOOK_EVALUATION);
        $id = intval($id);
        $evaluation = new Evaluation();
        $evaluation->add_evaluation_log($id);
        $sql = 'UPDATE '.$table_evaluation.'
               SET weight = '."'".Database::escape_string($weight)."'".'
               WHERE id = '.$id;
        Database::query($sql);
    }

    /**
     *
     * Get the achieved certificates for a user in courses
     * @param int $userId The user id
     * @param bool $includeNonPublicCertificates Whether include the non-plublic certificates
     * @return array
     */
    public static function getUserCertificatesInCourses($userId, $includeNonPublicCertificates = true)
    {
        $userId = intval($userId);
        $courseList = [];

        $courses = CourseManager::get_courses_list_by_user_id($userId);

        foreach ($courses as $course) {
            if (!$includeNonPublicCertificates) {
                $allowPublicCertificates = api_get_course_setting('allow_public_certificates', $course['code']);

                if (empty($allowPublicCertificates)) {
                    continue;
                }
            }

            $courseGradebookCategory = Category::load(null, null, $course['code']);

            if (empty($courseGradebookCategory)) {
                continue;
            }

            $courseGradebookId = $courseGradebookCategory[0]->get_id();

            $certificateInfo = GradebookUtils::get_certificate_by_user_id($courseGradebookId, $userId);

            if (empty($certificateInfo)) {
                continue;
            }

            $courseInfo = api_get_course_info_by_id($course['real_id']);

            $courseList[] = [
                'course' => $courseInfo['title'],
                'score' => $certificateInfo['score_certificate'],
                'date' => api_format_date($certificateInfo['created_at'], DATE_FORMAT_SHORT),
                'link' => api_get_path(WEB_PATH) . "certificates/index.php?id={$certificateInfo['id']}"
            ];
        }

        return $courseList;
    }

    /**
     * Get the achieved certificates for a user in course sessions
     * @param int $userId The user id
     * @param bool $includeNonPublicCertificates Whether include the non-plublic certificates
     * @return array
     */
    public static function getUserCertificatesInSessions($userId, $includeNonPublicCertificates = true)
    {
        $userId = intval($userId);
        $sessionList = [];

        $sessions = SessionManager::get_sessions_by_user($userId, true, true);

        foreach ($sessions as $session) {
            if (empty($session['courses'])) {
                continue;
            }
            $sessionCourses = SessionManager::get_course_list_by_session_id($session['session_id']);

            foreach ($sessionCourses as $course) {
                if (!$includeNonPublicCertificates) {
                    $allowPublicCertificates = api_get_course_setting('allow_public_certificates', $course['code']);

                    if (empty($allowPublicCertificates)) {
                        continue;
                    }
                }

                $courseGradebookCategory = Category::load(
                    null,
                    null,
                    $course['code'],
                    null,
                    null,
                    $session['session_id']
                );

                if (empty($courseGradebookCategory)) {
                    continue;
                }

                $courseGradebookId = $courseGradebookCategory[0]->get_id();

                $certificateInfo = GradebookUtils::get_certificate_by_user_id(
                    $courseGradebookId,
                    $userId
                );

                if (empty($certificateInfo)) {
                    continue;
                }

                $sessionList[] = [
                    'session' => $session['session_name'],
                    'course' => $course['title'],
                    'score' => $certificateInfo['score_certificate'],
                    'date' => api_format_date($certificateInfo['created_at'], DATE_FORMAT_SHORT),
                    'link' => api_get_path(WEB_PATH) . "certificates/index.php?id={$certificateInfo['id']}"
                ];
            }
        }

        return $sessionList;
    }

    /**
     * @param int $userId
     * @param array $cats
     * @param bool $saveToFile
     * @param bool $saveToHtmlFile
     * @param array $studentList
     * @param PDF $pdf
     *
     * @return string
     */
    public static function generateTable(
        $userId,
        $cats,
        $saveToFile = false,
        $saveToHtmlFile = false,
        $studentList = array(),
        $pdf = null
    ) {
        $courseInfo = api_get_course_info();
        $userInfo = api_get_user_info($userId);

        $cat = $cats[0];

        $allcat = $cats[0]->get_subcategories(
            $userId,
            api_get_course_id(),
            api_get_session_id()
        );
        $alleval = $cats[0]->get_evaluations($userId);
        $alllink = $cats[0]->get_links($userId);

        $gradebooktable = new GradebookTable(
            $cat,
            $allcat,
            $alleval,
            $alllink,
            null, // params
            true, // $exportToPdf
            false, // showteacher
            $userId,
            $studentList
        );

        $gradebooktable->userId = $userId;

        if (api_is_allowed_to_edit()) {
            $gradebooktable->td_attributes = [
                4 => 'class=centered'
            ];
        } else {
            $gradebooktable->td_attributes = [
                3 => 'class=centered',
                4 => 'class=centered',
                5 => 'class=centered',
                6 => 'class=centered',
                7 => 'class=centered'
            ];
        }

        $table = $gradebooktable->return_table();
        $graph = $gradebooktable->getGraph();

        $sessionName = api_get_session_name(api_get_session_id());
        $sessionName = !empty($sessionName) ? " - $sessionName" : '';

        $params = array(
            'pdf_title' => sprintf(get_lang('GradeFromX'), $courseInfo['name']),
            'session_info' => '',
            'course_info' => '',
            'pdf_date' => '',
            'course_code' => api_get_course_id(),
            'add_signatures' => false,
            'student_info' => $userInfo,
            'show_grade_generated_date' => true,
            'show_real_course_teachers' => false,
            'show_teacher_as_myself' => false,
            'orientation' => 'P'
        );

        if (empty($pdf)) {
            $pdf = new PDF('A4', $params['orientation'], $params);
        }

        $pdf->params['student_info'] = $userInfo;

        $file = api_get_path(SYS_ARCHIVE_PATH).uniqid().'.html';

        $content =
            $table.
            $graph.
            '<br />'.get_lang('Feedback').'<br />
            <textarea rows="5" cols="100" ></textarea>';

        $address = api_get_setting('institution_address');
        $phone = api_get_setting('administratorTelephone');
        $address = str_replace('\n', '<br />', $address);

        $pdf->custom_header = array('html' => "<h5 align='right'>$address <br />$phone</h5>");

        $result = $pdf->html_to_pdf_with_template(
            $content,
            $saveToFile,
            $saveToHtmlFile
        );

        if ($saveToHtmlFile) {
            file_put_contents($file, $result);
            return $file;
        }

        return $file;
    }

}
