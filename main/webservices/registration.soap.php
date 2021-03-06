<?php
/* For licensing terms, see /license.txt */

use Chamilo\CoreBundle\Entity\ExtraField as EntityExtraField;
use Chamilo\UserBundle\Entity\User;

/**
 * @package chamilo.webservices
 */
require_once '../inc/global.inc.php';
$libpath = api_get_path(LIBRARY_PATH);

$debug = true;

define('WS_ERROR_SECRET_KEY', 1);
define('WS_ERROR_NOT_FOUND_RESULT', 2);
define('WS_ERROR_INVALID_INPUT', 3);
define('WS_ERROR_SETTING', 4);

/**
 * @param string $code
 * @return null|soap_fault
 */
function returnError($code)
{
    $fault = null;
    switch ($code) {
        case WS_ERROR_SECRET_KEY:
            $fault = new soap_fault('Server', '', 'Secret key is not correct or params are not correctly set');
            break;
        case WS_ERROR_NOT_FOUND_RESULT:
            $fault = new soap_fault('Server', '', 'No result was found for this query');
            break;
        case WS_ERROR_INVALID_INPUT:
            $fault = new soap_fault('Server', '', 'The input variables are invalid o are not correctly set');
            break;
        case WS_ERROR_SETTING:
            $fault = new soap_fault('Server', '', 'Please check the configuration for this webservice');
            break;
    }
    return $fault;
}

/**
 * @param array $params
 * @return bool
 */
function WSHelperVerifyKey($params)
{
    global $_configuration, $debug;
    if (is_array($params)) {
        $secret_key = $params['secret_key'];
    } else {
        $secret_key = $params;
    }
    //error_log(print_r($params,1));
    $check_ip = false;
    $ip_matches = false;
    $ip = trim($_SERVER['REMOTE_ADDR']);
    // if we are behind a reverse proxy, assume it will send the
    // HTTP_X_FORWARDED_FOR header and use this IP instead
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        list($ip1) = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        $ip = trim($ip1);
    }
    if ($debug)
        error_log("ip: $ip");
    // Check if a file that limits access from webservices exists and contains
    // the restraining check
    if (is_file('webservice-auth-ip.conf.php')) {
        include 'webservice-auth-ip.conf.php';
        if ($debug)
            error_log("webservice-auth-ip.conf.php file included");
        if (!empty($ws_auth_ip)) {
            $check_ip = true;
            $ip_matches = api_check_ip_in_range($ip, $ws_auth_ip);
            if ($debug)
                error_log("ip_matches: $ip_matches");
        }
    }

    if ($debug) {
        error_log("checkip " . intval($check_ip));
    }

    if ($check_ip) {
        $security_key = $_configuration['security_key'];
    } else {
        $security_key = $ip.$_configuration['security_key'];
        //error_log($secret_key.'-'.$security_key);
    }

    $result = api_is_valid_secret_key($secret_key, $security_key);

    if ($debug)
        error_log('WSHelperVerifyKey result: '.intval($result));
    return $result;
}

// Create the server instance
$server = new soap_server();

/** @var HookWSRegistration $hook */
$hook = HookWSRegistration::create();
if (!empty($hook)) {
    $hook->setEventData(array('server' => $server));
    $res = $hook->notifyWSRegistration(HOOK_EVENT_TYPE_PRE);
    if (!empty($res['server'])) {
        $server = $res['server'];
    }
}

$server->soap_defencoding = 'UTF-8';

// Initialize WSDL support
$server->configureWSDL('WSRegistration', 'urn:WSRegistration');

/* Register WSCreateUsers function */
// Register the data structures used by the service

// Prepare input params
$server->wsdl->addComplexType(
    'extras',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'field_name'  => array('name' => 'field_name', 'type' => 'xsd:string'),
        'field_value' => array('name' => 'field_value', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'extrasList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref'=>'SOAP-ENC:arrayType','wsdl:arrayType' => 'tns:extras[]')),
    'tns:extras'
);

$server->wsdl->addComplexType(
    'usersParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'loginname' => array('name' => 'loginname', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'language' => array('name' => 'language', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'usersParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref'=>'SOAP-ENC:arrayType','wsdl:arrayType' => 'tns:usersParams[]')),
    'tns:usersParams'
);

$server->wsdl->addComplexType(
    'createUsers',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'users' => array('name' => 'users', 'type' => 'tns:usersParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_createUsers',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array(
            'name' => 'original_user_id_value',
            'type' => 'xsd:string',
        ),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_createUsers',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref'=>'SOAP-ENC:arrayType','wsdl:arrayType' => 'tns:result_createUsers[]')),'tns:result_createUsers'
);

// Register the method to expose
$server->register('WSCreateUsers',                 // method name
    array('createUsers' => 'tns:createUsers'),     // input parameters
    array('return' => 'tns:results_createUsers'),  // output parameters
    'urn:WSRegistration',                          // namespace
    'urn:WSRegistration#WSCreateUsers',            // soapaction
    'rpc',                                         // style
    'encoded',                                     // use
    'This service adds a user'                     // documentation
);


// Define the method WSCreateUsers
function WSCreateUsers($params) {

    global $_user;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $users_params = $params['users'];
    $results = array();
    $orig_user_id_value = array();

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();

    foreach ($users_params as $user_param) {

        $firstName = $user_param['firstname'];
        $lastName = $user_param['lastname'];
        $status = $user_param['status'];
        $email = $user_param['email'];
        $loginName = $user_param['loginname'];
        $password = $user_param['password'];
        $official_code = '';
        $language = '';
        $phone = '';
        $picture_uri = '';
        $auth_source = PLATFORM_AUTH_SOURCE;
        $expiration_date = '';
        $active = 1;
        $hr_dept_id = 0;
        $extra = null;
        $original_user_id_name = $user_param['original_user_id_name'];
        $original_user_id_value = $user_param['original_user_id_value'];
        $orig_user_id_value[] = $user_param['original_user_id_value'];
        $extra_list = $user_param['extra'];
        if (!empty($user_param['language'])) {
            $language = $user_param['language'];
        }
        if (!empty($user_param['phone'])) {
            $phone = $user_param['phone'];
        }
        if (!empty($user_param['expiration_date'])) {
            $expiration_date = $user_param['expiration_date'];
        }

        // Check if exits x_user_id into user_field_values table.
        $user_id = UserManager::get_user_id_from_original_id(
            $original_user_id_value,
            $original_user_id_name
        );
        if ($user_id > 0) {
            /** @var User $user */
            $user = $userRepository->find($user_id);

            if ($user && $user->isActive() == false) {
                if (!is_null($password)) {
                    $user->setPlainPassword($password);
                }
                if (!is_null($auth_source)) {
                    $user->setAuthSource($auth_source);
                }

                if (!empty($user_param['expiration_date'])) {
                    $expiration_date = new DateTime($user_param['expiration_date']);
                }

                $user->setLastname($lastName)
                    ->setFirstname($firstName)
                    ->setUsername($loginName)
                    ->setEmail($email)
                    ->setStatus($status)
                    ->setOfficialCode($official_code)
                    ->setPhone($phone)
                    ->setExpirationDate($expiration_date)
                    ->setHrDeptId($hr_dept_id)
                    ->setActive(true);
                $userManager->updateUser($user, true);
                $results[] = $user_id;
                continue;
                //return $r_check_user[0];
            } else {
                $results[] = 0;
                continue;
                //return 0;
                // user id already exits.
            }
        }

        // Default language.
        if (empty($language)) {
            $language = api_get_setting('platformLanguage');
        }

        if (!empty($_user['user_id'])) {
            $creator_id = $_user['user_id'];
        } else {
            $creator_id = '';
        }

        // First check wether the login already exists.
        if (!UserManager::is_username_available($loginName)) {
            if (api_set_failure('login-pass already taken')) {
                $results[] = 0;
                continue;
            }
        }

        $userId = UserManager::create_user(
            $firstName,
            $lastName,
            $status,
            $email,
            $loginName,
            $password,
            $official_code,
            $language,
            $phone,
            $picture_uri,
            $auth_source,
            $expiration_date,
            $active,
            $hr_dept_id
        );

        if ($userId) {
            if (api_is_multiple_url_enabled()) {
                if (api_get_current_access_url_id() != -1) {
                    UrlManager::add_user_to_url($userId, api_get_current_access_url_id());
                } else {
                    UrlManager::add_user_to_url($userId, 1);
                }
            } else {
                // We add by default the access_url_user table with access_url_id = 1
                UrlManager::add_user_to_url($userId, 1);
            }

            // Save new field label into user_field table.
            UserManager::create_extra_field(
                $original_user_id_name,
                1,
                $original_user_id_name,
                ''
            );
            // Save the external system's id into user_field_value table.
            UserManager::update_extra_field_value(
                $userId,
                $original_user_id_name,
                $original_user_id_value
            );

            if (is_array($extra_list) && count($extra_list) > 0) {
                foreach ($extra_list as $extra) {
                    $extra_field_name = $extra['field_name'];
                    $extra_field_value = $extra['field_value'];
                    // Save new field label into user_field table.
                    UserManager::create_extra_field(
                        $extra_field_name,
                        1,
                        $extra_field_name,
                        ''
                    );
                    // Save the external system's id into user_field_value table.
                    UserManager::update_extra_field_value(
                        $userId,
                        $extra_field_name,
                        $extra_field_value
                    );
                }
            }
        } else {
            $results[] = 0;
            continue;
        }

        $results[] =  $userId;

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_value' => $orig_user_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSCreateUser function */
// Register the data structures used by the service


$server->wsdl->addComplexType(
    'createUser',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'loginname' => array('name' => 'loginname', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'language' => array('name' => 'language', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'active' => array('name' => 'extra', 'type' => 'xsd:string')
    )
);


// Register the method to expose
$server->register('WSCreateUser',                // method name
    array('createUser' => 'tns:createUser'),     // input parameters
    array('return' => 'xsd:string'),             // output parameters
    'urn:WSRegistration',                        // namespace
    'urn:WSRegistration#WSCreateUser',           // soapaction
    'rpc',                                       // style
    'encoded',                                   // use
    'This service adds a user'                   // documentation
);


// Define the method WSCreateUser
function WSCreateUser($params) {
    global $_user, $_configuration, $debug;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $firstName = $params['firstname'];
    $lastName = $params['lastname'];
    $status = $params['status'];
    $email = $params['email'];
    $loginName = $params['loginname'];
    $password = $params['password'];
    $official_code = '';
    $language = '';
    $phone = '';
    $picture_uri = '';
    $auth_source = PLATFORM_AUTH_SOURCE;
    $expiration_date = null;
    $expirationDateStatement = '';
    $active = !isset($params['active']) || !intval($params['active']) ? 0 : 1;
    $hr_dept_id = 0;
    $extra = null;
    $original_user_id_name = $params['original_user_id_name'];
    $original_user_id_value = $params['original_user_id_value'];
    $extra_list = $params['extra'];
    if (!empty($params['language'])) {
        $language = $params['language'];
    }
    if (!empty($params['phone'])) {
        $phone = $params['phone'];
    }
    if (!empty($params['expiration_date'])) {
        $expiration_date = $params['expiration_date'];
        //$expirationDateStatement = " expiration_date = '".Database::escape_string($expiration_date)."', ";
    }

    // check if exits x_user_id into user_field_values table
    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();

    if ($user_id > 0) {

        /** @var User $user */
        $user = $userRepository->find($user_id);

        if ($user && $user->isActive() == false) {
            if (!is_null($password)) {
                $user->setPlainPassword($password);
            }
            if (!is_null($auth_source)) {
                $user->setAuthSource($auth_source);
            }

            if (!empty($params['expiration_date'])) {
                $expiration_date = new DateTime($params['expiration_date']);
            }

            $user->setLastname($lastName)
                ->setFirstname($firstName)
                ->setUsername($loginName)
                ->setEmail($email)
                ->setStatus($status)
                ->setOfficialCode($official_code)
                ->setPhone($phone)
                ->setExpirationDate($expiration_date)
                ->setHrDeptId($hr_dept_id)
                ->setActive(true);
            $userManager->updateUser($user, true);

            return $user_id;
        } else {
            return 0;
        }
    }

    // Default language
    if (empty($language)) {
        $language = api_get_setting('platformLanguage');
    }

    if (!empty($_user['user_id'])) {
        $creator_id = $_user['user_id'];
    } else {
        $creator_id = '';
    }

    // First check wether the login already exists
    if (!UserManager::is_username_available($loginName)) {
        if ($debug) error_log("Username $loginName is not available");
        return 0;
    }

    if (isset($original_user_id_name) && isset($original_user_id_value)) {
        $_SESSION['ws_' . $original_user_id_name] = $original_user_id_value;
    }

    /** @var User $user */
    $userId = UserManager::create_user(
        $firstName,
        $lastName,
        $status,
        $email,
        $loginName,
        $password,
        $official_code,
        $language,
        $phone,
        $picture_uri,
        $auth_source,
        $expiration_date,
        $active,
        $hr_dept_id
    );

    if ($userId) {
        if (api_is_multiple_url_enabled()) {
            if (api_get_current_access_url_id() != -1) {
                UrlManager::add_user_to_url($userId, api_get_current_access_url_id());
            } else {
                UrlManager::add_user_to_url($userId, 1);
            }
        } else {
            // We add by default the access_url_user table with access_url_id = 1
            UrlManager::add_user_to_url($userId, 1);
        }

        // Save new fieldlabel into user_field table.
        UserManager::create_extra_field(
            $original_user_id_name,
            1,
            $original_user_id_name,
            ''
        );
        // Save the external system's id into user_field_value table.
        UserManager::update_extra_field_value(
            $userId,
            $original_user_id_name,
            $original_user_id_value
        );

        if (isset($original_user_id_name) && isset($original_user_id_value)) {
            unset($_SESSION['ws_' . $original_user_id_name]);
        }

        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                $extra_field_name = $extra['field_name'];
                $extra_field_value = $extra['field_value'];
                // Save new field label into user_field table.
                UserManager::create_extra_field(
                    $extra_field_name,
                    1,
                    $extra_field_name,
                    ''
                );
                // Save the external system's id into user_field_value table.
                UserManager::update_extra_field_value(
                    $userId,
                    $extra_field_name,
                    $extra_field_value
                );
            }
        }
    } else {
        return 0;
    }

    return  $userId;
}

/* Register WSCreateUsersPasswordCrypted function */
// Register the data structures used by the service

// Prepare input params.

// Input params for editing users
$server->wsdl->addComplexType(
    'createUsersPassEncryptParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'firstname'             => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname'              => array('name' => 'lastname', 'type' => 'xsd:string'),
        'status'                => array('name' => 'status', 'type' => 'xsd:string'),
        'email'                 => array('name' => 'email', 'type' => 'xsd:string'),
        'loginname'             => array('name' => 'loginname', 'type' => 'xsd:string'),
        'password'              => array('name' => 'password', 'type' => 'xsd:string'),
        'encrypt_method'        => array('name' => 'encrypt_method', 'type' => 'xsd:string'),
        'language'              => array('name' => 'language', 'type' => 'xsd:string'),
        'phone'                 => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date'       => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'official_code'         => array('name' => 'official_code',    'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_user_id_value'=> array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'extra'                 => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);


$server->wsdl->addComplexType(
    'createUsersPassEncryptParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:createUsersPassEncryptParams[]')),
    'tns:createUsersPassEncryptParams'
);


// Register the data structures used by the service
$server->wsdl->addComplexType(
    'createUsersPasswordCrypted',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'users'         => array('name' => 'users',      'type' => 'tns:createUsersPassEncryptParamsList'),
        'secret_key'    => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_createUsersPassEncrypt',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_createUsersPassEncrypt',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_createUsersPassEncrypt[]')),
    'tns:result_createUsersPassEncrypt'
);

// Register the method to expose
$server->register('WSCreateUsersPasswordCrypted',                            // method name
    array('createUsersPasswordCrypted' => 'tns:createUsersPasswordCrypted'), // input parameters
    array('return' => 'tns:results_createUsersPassEncrypt'),                 // output parameters
    'urn:WSRegistration',                                                    // namespace
    'urn:WSRegistration#WSCreateUsersPasswordCrypted',                       // soapaction
    'rpc',                                                                   // style
    'encoded',                                                               // use
    'This service adds users to the system'                                  // documentation
);

// Define the method WSCreateUsersPasswordCrypted
function WSCreateUsersPasswordCrypted($params)
{
    global $_user, $_configuration;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    // database table definition
    $table_user = Database::get_main_table(TABLE_MAIN_USER);
    $t_uf = Database::get_main_table(TABLE_EXTRA_FIELD);
    $t_ufv = Database::get_main_table(TABLE_EXTRA_FIELD_VALUES);

    $users_params = $params['users'];
    $results = array();
    $orig_user_id_value = array();

    foreach ($users_params as $user_param) {

        $password = $user_param['password'];
        $encrypt_method = $user_param['encrypt_method'];
        $firstName = $user_param['firstname'];
        $lastName = $user_param['lastname'];
        $status = $user_param['status'];
        $email = $user_param['email'];
        $loginName = $user_param['loginname'];
        $official_code = $user_param['official_code'];
        $language = '';
        $phone = '';
        $picture_uri = '';
        $auth_source = PLATFORM_AUTH_SOURCE;
        $expiration_date = '';
        $active = 1;
        $hr_dept_id = 0;
        $extra = null;
        $original_user_id_name = $user_param['original_user_id_name'];
        $original_user_id_value = $user_param['original_user_id_value'];
        $orig_user_id_value[] = $user_param['original_user_id_value'];
        $extra_list = $user_param['extra'];
        $salt = '';

        if (!empty($_configuration['password_encryption'])) {
            if ($_configuration['password_encryption'] === $encrypt_method ) {
                if ($encrypt_method == 'md5' && !preg_match('/^[A-Fa-f0-9]{32}$/', $password)) {
                    $msg = "Encryption $encrypt_method is invalid";
                    $results[] = $msg;
                    continue;
                } else if ($encrypt_method == 'sha1' && !preg_match('/^[A-Fa-f0-9]{40}$/', $password)) {
                    $msg = "Encryption $encrypt_method is invalid";
                    $results[] = $msg;
                    continue;
                }
            } else {
                $msg = "This encryption $encrypt_method is not configured";
                $results[] = $msg;
                continue;
            }
        } else {
            $msg = 'The chamilo setting $_configuration["password_encryption"] is not configured';
            $results[] = $msg;
            continue;
        }

        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                if($extra['field_name'] == 'salt') {
                    $salt = $extra['field_value'];
                    break;
                }
            }
        }

        if (!empty($user_param['language'])) {
            $language = $user_param['language'];
        }
        if (!empty($user_param['phone'])) {
            $phone = $user_param['phone'];
        }
        if (!empty($user_param['expiration_date'])) {
            $expiration_date = $user_param['expiration_date'];
        }

        $extraFieldType = EntityExtraField::USER_FIELD_TYPE;

        // Check whether x_user_id exists into user_field_values table.
        $sql = "SELECT value as field_value,item_id as user_id
                FROM $t_uf uf, $t_ufv ufv
                WHERE
                    uf.extra_field_type = $extraFieldType
                    ufv.field_id=uf.id AND
                    variable='$original_user_id_name' AND
                    value ='$original_user_id_value'";
        $res = Database::query($sql);
        $row = Database::fetch_row($res);
        $count_row = Database::num_rows($res);
        if ($count_row > 0) {
            // Check if user is not active.
            $sql = "SELECT user_id FROM $table_user WHERE user_id ='".$row[1]."' AND active= '0'";
            $resu = Database::query($sql);
            $r_check_user = Database::fetch_row($resu);
            $count_check_user = Database::num_rows($resu);
            if ($count_check_user > 0) {
                $sql = "UPDATE $table_user SET
                        lastname='".Database::escape_string($lastName)."',
                        firstname='".Database::escape_string($firstName)."',
                        username='".Database::escape_string($loginName)."',";

                if (!is_null($auth_source)) {
                    $sql .= " auth_source='".Database::escape_string($auth_source)."',";
                }
                $sql .= "
                        password='".Database::escape_string($password)."',
                        email='".Database::escape_string($email)."',
                        status='".Database::escape_string($status)."',
                        official_code='".Database::escape_string($official_code)."',
                        phone='".Database::escape_string($phone)."',
                        expiration_date='".Database::escape_string($expiration_date)."',
                        active='1',
                        hr_dept_id=".intval($hr_dept_id);

                $sql .=  " WHERE user_id='".$r_check_user[0]."'";
                Database::query($sql);

                if (is_array($extra_list) && count($extra_list) > 0) {
                    foreach ($extra_list as $extra) {
                        $extra_field_name = $extra['field_name'];
                        $extra_field_value = $extra['field_value'];
                        // Save the external system's id into user_field_value table.
                        $res = UserManager::update_extra_field_value(
                            $r_check_user[0],
                            $extra_field_name,
                            $extra_field_value
                        );
                    }
                }

                $results[] = $r_check_user[0];
                continue;
            } else {
                $results[] = 0;
                continue; // User id already exits.
            }
        }

        // Default language.
        if (empty($language)) {
            $language = api_get_setting('platformLanguage');
        }

        if (!empty($_user['user_id'])) {
            $creator_id = $_user['user_id'];
        } else {
            $creator_id = '';
        }
        // First check wether the login already exists
        if (!UserManager::is_username_available($loginName)) {
            if (api_set_failure('login-pass already taken')) {
                $results[] = 0;
                continue;
            }
        }

        $sql = "INSERT INTO $table_user SET
                    lastname = '".Database::escape_string(trim($lastName))."',
                    firstname = '".Database::escape_string(trim($firstName))."',
                    username = '".Database::escape_string(trim($loginName))."',
                    status = '".Database::escape_string($status)."',
                    password = '".Database::escape_string($password)."',
                    email = '".Database::escape_string($email)."',
                    official_code    = '".Database::escape_string($official_code)."',
                    picture_uri     = '".Database::escape_string($picture_uri)."',
                    creator_id      = '".Database::escape_string($creator_id)."',
                    auth_source = '".Database::escape_string($auth_source)."',
                    phone = '".Database::escape_string($phone)."',
                    language = '".Database::escape_string($language)."',
                    registration_date = now(),
                    expiration_date = '".Database::escape_string($expiration_date)."',
                    hr_dept_id = '".Database::escape_string($hr_dept_id)."',
                    active = '".Database::escape_string($active)."'";
        $result = Database::query($sql);
        if ($result) {
            //echo "id returned";
            $return = Database::insert_id();

            $sql = "UPDATE $table_user SET user_id = id WHERE id = $return";
            Database::query($sql);

            if (api_is_multiple_url_enabled()) {
                if (api_get_current_access_url_id() != -1) {
                    UrlManager::add_user_to_url($return, api_get_current_access_url_id());
                } else {
                    UrlManager::add_user_to_url($return, 1);
                }
            } else {
                // We add by default the access_url_user table with access_url_id = 1
                UrlManager::add_user_to_url($return, 1);
            }
            // Save new fieldlabel into user_field table.
            $field_id = UserManager::create_extra_field(
                $original_user_id_name,
                1,
                $original_user_id_name,
                ''
            );
            // Save the remote system's id into user_field_value table.
            UserManager::update_extra_field_value(
                $return,
                $original_user_id_name,
                $original_user_id_value
            );

            if (is_array($extra_list) && count($extra_list) > 0) {
                foreach ($extra_list as $extra) {
                    $extra_field_name = $extra['field_name'];
                    $extra_field_value = $extra['field_value'];
                    // Save new fieldlabel into user_field table.
                    $field_id = UserManager::create_extra_field(
                        $extra_field_name,
                        1,
                        $extra_field_name,
                        ''
                    );
                    // Save the external system's id into user_field_value table.
                    UserManager::update_extra_field_value(
                        $return,
                        $extra_field_name,
                        $extra_field_value
                    );
                }
            }
        } else {
            $results[] = 0;
            continue;
        }
        $results[] = $return;

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_value' => $orig_user_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}
// Subscribe / Unsubscribe Teacher to Session Course
//
// Prepare Input params for Subscribe Teacher to SC
$server->wsdl->addComplexType(
    'TeacherToSessionCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'user_id' => array('name' => 'course',     'type' => 'xsd:string'), // Chamilo user Id
        'session_id' => array('name' => 'user_id',    'type' => 'xsd:string'), // Current Session course ID
        'course_id' =>array('name' => 'courseId',      'type' => 'xsd:string'), // Course Real Id
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),

        // optional
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string')
    )
);

function parseCourseSessionUserParams($params)
{
    global $debug;

    $userId = isset($params['user_id']) ? $params['user_id'] : 0; // Chamilo user Id
    $sessionId = isset($params['session_id']) ? $params['session_id'] : 0; // Current Session course ID
    $courseId = isset($params['course_id']) ? $params['course_id'] : 0; // Course Real Id

    if (empty($userId) && empty($sessionId) && empty($courseId)) {
        // try original values

        if ($debug) error_log('try original values');

        $userIdName = isset($params['original_user_id_name']) ? $params['original_user_id_name'] : 0;
        $userIdValue = isset($params['original_user_id_value']) ? $params['original_user_id_value'] : 0;
        $courseIdName = isset($params['original_course_id_name']) ? $params['original_course_id_name'] : 0;
        $courseIdValue = isset($params['original_course_id_value']) ? $params['original_course_id_value'] : 0;
        $sessionIdName = isset($params['original_session_id_name']) ? $params['original_session_id_name'] : 0;
        $sessionIdValue = isset($params['original_session_id_value']) ? $params['original_session_id_value'] : 0;

        // Check if exits x_user_id into user_field_values table.
        $userId = UserManager::get_user_id_from_original_id(
            $userIdValue,
            $userIdName
        );

        // Check whether exits $x_course_code into user_field_values table.
        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $courseIdValue,
            $courseIdName
        );

        $courseId = 0;
        if ($courseInfo) {
            $courseId = $courseInfo['real_id'];
        }

        $sessionId = SessionManager::getSessionIdFromOriginalId(
            $sessionIdValue,
            $sessionIdName
        );
    }

    if ($debug) error_log('$userId found: '. $userId);
    if ($debug) error_log('$courseId found: '. $courseId);
    if ($debug) error_log('$sessionId found: '. $sessionId);

    return [
        'user_id' => $userId,
        'course_id' => $courseId,
        'session_id' => $sessionId,
    ];
}

$server->register(
    'WSSubscribeTeacherToSessionCourse',
    array('SubscribeTeacherToSessionCourse' => 'tns:TeacherToSessionCourse'),
    array('return' => 'xsd:string'),
    'urn:WSRegistration',
    'urn:WSRegistration#WSSubscribeTeacherToSessionCourse',
    'rpc',
    'encoded',
    'This webservice subscribe a teacher to a session course'
);

/**
 * Subscribe teacher to a session course
 *
 * @param array $params - WSFunction parameters (include VerifyKey)
 * @return bool|null|soap_fault A simple boolean (true if teacher successful subscribed, false otherwise)
 */
function WSSubscribeTeacherToSessionCourse($params)
{
    global $debug;

    if ($debug) error_log('WSSubscribeTeacherToSessionCourse');

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    if ($debug) error_log('Params '. print_r($params, 1));

    $params = parseCourseSessionUserParams($params);

    $userId = $params['user_id'];
    $courseId = $params['course_id'];
    $sessionId = $params['session_id'];
    SessionManager::set_coach_to_course_session($userId, $sessionId, $courseId);
    $coaches = SessionManager::getCoachesByCourseSession($sessionId, $courseId);

    $result = 0;

    if (!empty($coaches)) {
        if ($debug) error_log('Coaches:  '. print_r($coaches, 1));
        if (in_array($userId, $coaches)) {
            $result = 1;
        }
    }

    if ($debug) error_log('Result:  '. $result);

    return $result;
}

$server->register(
    'WSUnsubscribeTeacherFromSessionCourse',
    array('UnsubscribeTeacherFromSessionCourse' => 'tns:TeacherToSessionCourse'),
    array('return' => 'xsd:string'),
    'urn:WSRegistration',
    'urn:WSRegistration#WSUnsubscribeTeacherFromSessionCourse',
    'rpc',
    'encoded',
    'This webservice unsubscribe a teacher from a session course'
);

/**
 * Subscribe teacher to a session course
 *
 *  @param array $params - WSFunction parameters (include VerifyKey)
 *  @return bool|null|soap_fault A simple boolean (true if teacher successful unsubscribed, false otherwise)
 */
function WSUnsubscribeTeacherFromSessionCourse($params)
{
    global $debug;

    if ($debug) error_log('WSSubscribeTeacherToSessionCourse');

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    if ($debug) error_log('Params '. print_r($params, 1));

    $params = parseCourseSessionUserParams($params);

    $userId = $params['user_id'];
    $courseId = $params['course_id'];
    $sessionId = $params['session_id'];

    SessionManager::removeUsersFromCourseSession([$userId], $sessionId, $courseId);
    $coaches = SessionManager::getCoachesByCourseSession($sessionId, $courseId);

    $result = 0;

    if (!empty($coaches)) {
        if ($debug) error_log('Coaches:  ' . print_r($coaches, 1));
        if (!in_array($userId, $coaches)) {
            $result = 1;
        }
    } else {
        $result = 1;
    }

    if ($debug) error_log('Final Result: '. $result);

    return $result;
}

/* Register WSCreateUserPasswordCrypted function */
// Register the data structures used by the service

//prepare input params

// Input params for editing users
$server->wsdl->addComplexType(
    'createUserPasswordCrypted',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'firstname'                 => array('name' => 'firstname',                 'type' => 'xsd:string'),
        'lastname'                  => array('name' => 'lastname',                  'type' => 'xsd:string'),
        'status'                    => array('name' => 'status',                    'type' => 'xsd:string'),
        'email'                     => array('name' => 'email',                     'type' => 'xsd:string'),
        'loginname'                 => array('name' => 'loginname',                 'type' => 'xsd:string'),
        'password'                  => array('name' => 'password',                  'type' => 'xsd:string'), //encripted password using the encrypt_method
        'encrypt_method'            => array('name' => 'encrypt_method',            'type' => 'xsd:string'),
        'language'                  => array('name' => 'language',                  'type' => 'xsd:string'),
        'phone'                     => array('name' => 'phone',                     'type' => 'xsd:string'),
        'expiration_date'           => array('name' => 'expiration_date',           'type' => 'xsd:string'),
        'official_code'             => array('name' => 'official_code',             'type' => 'xsd:string'),
        'original_user_id_name'     => array('name' => 'original_user_id_name',     'type' => 'xsd:string'),
        'original_user_id_value'    => array('name' => 'original_user_id_value',    'type' => 'xsd:string'),
        'extra'                     => array('name' => 'extra',                     'type' => 'tns:extrasList'),
        'secret_key'                => array('name' => 'secret_key',                'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSCreateUserPasswordCrypted',                            // method name
    array('createUserPasswordCrypted' => 'tns:createUserPasswordCrypted'),  // input parameters
    array('return' => 'xsd:string'),                                        // output parameters
    'urn:WSRegistration',                                                   // namespace
    'urn:WSRegistration#WSCreateUserPasswordCrypted',                       // soapaction
    'rpc',                                                                  // style
    'encoded',                                                              // use
    'This service adds users'                                               // documentation
);

// Define the method WSCreateUserPasswordCrypted
function WSCreateUserPasswordCrypted($params)
{
    global $_user, $_configuration, $debug;
    $debug = 1;
    if ($debug) error_log('WSCreateUserPasswordCrypted');
    if ($debug) error_log(print_r($params,1));

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    // Database table definition.
    $table_user = Database::get_main_table(TABLE_MAIN_USER);

    $orig_user_id_value = array();

    $password = $params['password'];
    $encrypt_method = $params['encrypt_method'];
    $firstName = $params['firstname'];
    $lastName = $params['lastname'];
    $status = $params['status'];
    $email = $params['email'];
    $loginName = $params['loginname'];
    $official_code = isset($params['official_code']) ? $params['official_code'] : '';
    $language = '';
    $phone = isset($params['phone']) ? $params['phone'] : '';
    $picture_uri = '';
    $auth_source = PLATFORM_AUTH_SOURCE;
    $expiration_date = '';
    $active = 1;
    $hr_dept_id = 0;
    $extra = null;
    $original_user_id_name = $params['original_user_id_name'];
    $original_user_id_value = $params['original_user_id_value'];
    $orig_user_id_value[] = $params['original_user_id_value'];
    $extra_list = isset($params['extra']) ? $params['extra'] : '';

    if (!empty($_configuration['password_encryption'])) {
        if ($_configuration['password_encryption'] === $encrypt_method ) {
            if ($encrypt_method == 'md5' && !preg_match('/^[A-Fa-f0-9]{32}$/', $password)) {
                $msg = "Encryption $encrypt_method is invalid";
                if ($debug) error_log($msg);
                return $msg;

            } else if ($encrypt_method == 'sha1' && !preg_match('/^[A-Fa-f0-9]{40}$/', $password)) {
                $msg = "Encryption $encrypt_method is invalid";
                if ($debug) error_log($msg);
                return $msg;
            }
        } else {
            $msg = "This encryption $encrypt_method is not configured";
            if ($debug) error_log($msg);
            return $msg;
        }
    } else {
        $msg = 'The chamilo setting $_configuration["password_encryption"] is not configured';
        if ($debug) error_log($msg);
        return $msg;
    }

    if (!empty($params['language'])) {
        $language = $params['language'];
    }
    if (!empty($params['phone'])) {
        $phone = $params['phone'];
    }
    if (!empty($params['expiration_date'])) {
        $expiration_date = $params['expiration_date'];
    }

    // Check whether x_user_id exists into user_field_values table.
    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    if ($debug) error_log('Ready to create user');

    if ($user_id > 0) {
        if ($debug) error_log('User found with id: '.$user_id);

        // Check whether user is not active
        //@todo why this condition exists??
        $sql = "SELECT user_id FROM $table_user
                WHERE user_id ='".$user_id."' AND active= '0' ";
        $resu = Database::query($sql);
        $r_check_user = Database::fetch_row($resu);
        $count_check_user = Database::num_rows($resu);
        if ($count_check_user > 0) {

            if ($debug) error_log('User id: '.$user_id.' exists and is NOT active. Updating user and setting setting active = 1');

            $sql = "UPDATE $table_user SET
                    lastname='".Database::escape_string($lastName)."',
                    firstname='".Database::escape_string($firstName)."',
                    username='".Database::escape_string($loginName)."',";

            if (!is_null($auth_source)) {
                $sql .= " auth_source='".Database::escape_string($auth_source)."',";
            }
            $sql .=    "
                    password='".Database::escape_string($password)."',
                    email='".Database::escape_string($email)."',
                    status='".Database::escape_string($status)."',
                    official_code='".Database::escape_string($official_code)."',
                    phone='".Database::escape_string($phone)."',
                    expiration_date='".Database::escape_string($expiration_date)."',
                    active='1',
                    hr_dept_id=".intval($hr_dept_id);
            $sql .=    " WHERE user_id='".$r_check_user[0]."'";
            if ($debug) error_log($sql);
            Database::query($sql);

            if (is_array($extra_list) && count($extra_list) > 0) {
                foreach ($extra_list as $extra) {
                    $extra_field_name = $extra['field_name'];
                    $extra_field_value = $extra['field_value'];
                    // Save the external system's id into user_field_value table.
                    UserManager::update_extra_field_value(
                        $r_check_user[0],
                        $extra_field_name,
                        $extra_field_value
                    );
                }
            }
            return $r_check_user[0];
        } else {
            if ($debug) error_log('User exists but is active. Cant be updated');
            return 0;
        }
    } else {
        if ($debug) error_log("User not found with original_id = $original_user_id_value and original_name = $original_user_id_name");
    }

    // Default language.
    if (empty($language)) {
        $language = api_get_setting('platformLanguage');
    }

    if (!empty($_user['user_id'])) {
        $creator_id = $_user['user_id'];
    } else {
        $creator_id = '';
    }

    // First check wether the login already exists
    if (!UserManager::is_username_available($loginName)) {
        if ($debug) error_log("Username $loginName is not available");
        return 0;
    }

    $sql = "INSERT INTO $table_user SET
            lastname            = '".Database::escape_string(trim($lastName))."',
            firstname           = '".Database::escape_string(trim($firstName))."',
            username            = '".Database::escape_string(trim($loginName))."',
            username_canonical  = '".Database::escape_string(api_strtolower(trim($loginName)))."',
            status              = '".Database::escape_string($status)."',
            password            = '".Database::escape_string($password)."',
            email               = '".Database::escape_string($email)."',
            official_code       = '".Database::escape_string($official_code)."',
            picture_uri         = '".Database::escape_string($picture_uri)."',
            creator_id          = '".Database::escape_string($creator_id)."',
            auth_source         = '".Database::escape_string($auth_source)."',
            phone               = '".Database::escape_string($phone)."',
            language            = '".Database::escape_string($language)."',
            registration_date   = '".api_get_utc_datetime()."',
            expiration_date     = '".Database::escape_string($expiration_date)."',
            hr_dept_id          = '".Database::escape_string($hr_dept_id)."',
            active              = '".Database::escape_string($active)."'";
    if ($debug) error_log($sql);

    Database::query($sql);
    $return = Database::insert_id();

    if ($return) {

        $sql = "UPDATE $table_user SET user_id = id WHERE id = $return";
        Database::query($sql);

        $url_id = api_get_current_access_url_id();
        UrlManager::add_user_to_url($return, $url_id);
        if ($debug) error_log("Adding user_id = $return to URL id $url_id ");

        // Create extra field for the original_user_id_name
        UserManager::create_extra_field(
            $original_user_id_name,
            1,
            $original_user_id_name,
            ''
        );
        // Save the remote system's id into user_field_value table.
        UserManager::update_extra_field_value(
            $return,
            $original_user_id_name,
            $original_user_id_value
        );

        // Create extra fields
        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                $extra_field_name   = $extra['field_name'];
                $extra_field_value  = $extra['field_value'];
                // save new fieldlabel into user_field table
                UserManager::create_extra_field(
                    $extra_field_name,
                    1,
                    $extra_field_name,
                    ''
                );
                // save the external system's id into user_field_value table'
                UserManager::update_extra_field_value(
                    $return,
                    $extra_field_name,
                    $extra_field_value
                );
            }
        }
    } else {
        if ($debug) error_log('Error while inserting a user');
        return 0;
    }

    return $return;
}

/* Register WSEditUsers function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUsersParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'editUsersParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:editUsersParams[]')),
    'tns:editUsersParams'
);

$server->wsdl->addComplexType(
    'editUsers',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'users' => array('name' => 'users', 'type' => 'tns:editUsersParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

/* Register WSEditUserCredentials function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUserCredentials',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSEditUserCredentials',                      // method name
    array('editUserCredentials' => 'tns:editUserCredentials'),  // input parameters
    array('return' => 'xsd:string'),                            // output parameters
    'urn:WSRegistration',                                       // namespace
    'urn:WSRegistration#WSEditUserCredentials',                 // soapaction
    'rpc',                                                      // style
    'encoded',                                                  // use
    'This service edits the username and password of a user'    // documentation
);

// Define the method WSEditUser
function WSEditUserCredentials($params)
{
    global $_configuration;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();


    $table_user = Database :: get_main_table(TABLE_MAIN_USER);

    $original_user_id_value = $params['original_user_id_value'];
    $original_user_id_name = $params['original_user_id_name'];
    $username = $params['username'];
    $password = null;

    if (!empty($params['password'])) {
        $password = $params['password'];
    }

    // Get user id from the other system ID
    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    if ($user_id == 0) {
        return 0;
    } else {
        $sql = "SELECT user_id FROM $table_user
                WHERE user_id ='$user_id' AND active= '0'";
        $resu = Database::query($sql);
        $r_check_user = Database::fetch_row($resu);
        if (!empty($r_check_user[0])) {
            return 0;
        }
    }

    // Check whether username already exits.
    $sql = "SELECT username FROM $table_user
            WHERE username = '$username' AND user_id <> '$user_id'";
    $res_un = Database::query($sql);
    $r_username = Database::fetch_row($res_un);

    if (!empty($r_username[0])) {
        return 0;
    }

    /** @var User $user */
    $user = $userRepository->find($user_id);
    if ($user) {

        $user->setUsername($username);

        if (!is_null($password)) {
            $user->setPlainPassword($password);
        }

        $userManager->updateUser($user, true);

        return true;
    }

    return false;
}

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_editUsers',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_editUsers',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_editUsers[]')),
    'tns:result_editUsers'
);

// Register the method to expose
$server->register('WSEditUsers',                // method name
    array('editUsers' => 'tns:editUsers'),      // input parameters
    array('return' => 'tns:results_editUsers'), // output parameters
    'urn:WSRegistration',                       // namespace
    'urn:WSRegistration#WSEditUsers',           // soapaction
    'rpc',                                      // style
    'encoded',                                  // use
    'This service edits a user from wiener'     // documentation
);

// Define the method WSEditUsers
function WSEditUsers($params)
{
    global $_configuration;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();


    $table_user = Database :: get_main_table(TABLE_MAIN_USER);

    $users_params = $params['users'];
    $results = array();
    $orig_user_id_value = array();

    foreach ($users_params as $user_param) {

        $original_user_id_value = $user_param['original_user_id_value'];
        $original_user_id_name = $user_param['original_user_id_name'];
        $orig_user_id_value[] = $original_user_id_value;
        $firstname = $user_param['firstname'];
        $lastname = $user_param['lastname'];
        $username = $user_param['username'];
        $password = null;
        $auth_source = null;
        $email = $user_param['email'];
        $status = $user_param['status'];
        $official_code = '';
        $phone = $user_param['phone'];
        $picture_uri = '';
        $expiration_date = $user_param['expiration_date'];
        $active = 1;
        $creator_id = null;
        $hr_dept_id = 0;
        $extra = null;
        $extra_list = $user_param['extra'];

        if (!empty($user_param['password'])) {
            $password = $user_param['password'];
        }

        // Get user id from id wiener

        $user_id = UserManager::get_user_id_from_original_id(
            $original_user_id_value,
            $original_user_id_name
        );

        if ($user_id == 0) {
            $results[] = 0; // Original_user_id_value doesn't exist.
            continue;
        } else {
            $sql = "SELECT user_id FROM $table_user
                    WHERE user_id ='$user_id' AND active= '0'";
            $resu = Database::query($sql);
            $r_check_user = Database::fetch_row($resu);
            if (!empty($r_check_user[0])) {
                $results[] = 0; // user_id is not active.
                continue;
            }
        }

        // Check whether username already exits.
        $sql = "SELECT username FROM $table_user
                WHERE username = '$username' AND user_id <> '$user_id'";
        $res_un = Database::query($sql);
        $r_username = Database::fetch_row($res_un);

        if (!empty($r_username[0])) {
            $results[] = 0; // username already exits.
            continue;
        }
        // Edit lastname and firstname only if not empty

        /** @var User $user */
        $user = $userRepository->find($user_id);

        if (!empty($lastname)) {
            $user->setLastname($lastname);
            //$sql .= " lastname='".Database::escape_string($lastname)."', ";
        }
        if (!empty($firstname)) {
            $user->setFirstname($firstname);
            //$sql .= " firstname='".Database::escape_string($firstname)."', ";
        }
        $user->setUsername($username);
        //$sql .= " username='".Database::escape_string($username)."',";
        if (!is_null($password)) {
            //$password = $_configuration['password_encryption'] ? api_get_encrypted_password($password) : $password;
            //$sql .= " password='".Database::escape_string($password)."',";
            $user->setPlainPassword($password);
        }
        if (!is_null($auth_source)) {
            $user->setAuthSource($auth_source);
        }

        // Exception for admins in case no status is provided in WS call...
        $t_admin = Database::get_main_table(TABLE_MAIN_ADMIN);
        $sqladmin = "SELECT user_id FROM $t_admin WHERE user_id = ".intval($user_id);
        $resadmin = Database::query($sqladmin);
        $is_admin = Database::num_rows($resadmin);

        if (empty($status)) {
            $status = 5;
        }

        if ($is_admin) {
            $status = 1;
        }

        if (!empty($expiration_date)) {
            $expiration_date = new DateTime($expiration_date);
        }

        $user
            ->setEmail($email)
            ->setStatus($status)
            ->setOfficialCode($official_code)
            ->setPhone($phone)
            ->setExpirationDate($expiration_date)
            ->setHrDeptId($hr_dept_id)
            ->setActive(true);

        if (!is_null($creator_id)) {
            $user->setCreatorId($creator_id);
            //$sql .= ", creator_id='".Database::escape_string($creator_id)."'";
        }

        $userManager->updateUser($user, true);

        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                $extra_field_name = $extra['field_name'];
                $extra_field_value = $extra['field_value'];
                // Save the external system's id into user_field_value table.
                UserManager::update_extra_field_value(
                    $user_id,
                    $extra_field_name,
                    $extra_field_value
                );
            }
        }

        $results[] = $user->getId();
        continue;
    }

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_value' => $orig_user_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSEditUser function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUser',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSEditUser',              // method name
    array('editUser' => 'tns:editUser'),     // input parameters
    array('return' => 'xsd:string'),         // output parameters
    'urn:WSRegistration',                    // namespace
    'urn:WSRegistration#WSEditUser',         // soapaction
    'rpc',                                   // style
    'encoded',                               // use
    'This service edits a user from wiener'  // documentation
);

// Define the method WSEditUser
function WSEditUser($params)
{

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();

    $table_user = Database :: get_main_table(TABLE_MAIN_USER);

    $original_user_id_value = $params['original_user_id_value'];
    $original_user_id_name = $params['original_user_id_name'];
    $firstname = $params['firstname'];
    $lastname = $params['lastname'];
    $username = $params['username'];
    $password = null;
    $auth_source = null;
    $email = $params['email'];
    $status = $params['status'];
    $official_code = '';
    $phone = $params['phone'];
    $picture_uri = '';
    $expiration_date = $params['expiration_date'];
    $active = 1;
    $creator_id = null;
    $hr_dept_id = 0;
    $extra = null;
    $extra_list = $params['extra'];

    if (!empty($params['password'])) {
        $password = $params['password'];
    }

    // Get user id from id wiener

    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    if ($user_id == 0) {
        return 0;
    } else {
        $sql = "SELECT user_id FROM $table_user
                WHERE user_id ='$user_id' AND active= '0'";
        $resu = Database::query($sql);
        $r_check_user = Database::fetch_row($resu);
        if (!empty($r_check_user[0])) {
            return 0;
        }
    }

    // Check whether username already exits.
    $sql = "SELECT username FROM $table_user
            WHERE username = '$username' AND user_id <> '$user_id'";
    $res_un = Database::query($sql);
    $r_username = Database::fetch_row($res_un);

    if (!empty($r_username[0])) {
        return 0;
    }




    /** @var User $user */
    $user = $userRepository->find($user_id);

    if (!empty($lastname)) {
        $user->setLastname($lastname);
        //$sql .= " lastname='".Database::escape_string($lastname)."', ";
    }
    if (!empty($firstname)) {
        $user->setFirstname($firstname);
        //$sql .= " firstname='".Database::escape_string($firstname)."', ";
    }
    $user->setUsername($username);
    //$sql .= " username='".Database::escape_string($username)."',";
    if (!is_null($password)) {
        //$password = $_configuration['password_encryption'] ? api_get_encrypted_password($password) : $password;
        //$sql .= " password='".Database::escape_string($password)."',";
        $user->setPlainPassword($password);
    }
    if (!is_null($auth_source)) {
        $user->setAuthSource($auth_source);
    }

    // Exception for admins in case no status is provided in WS call...
    $t_admin = Database::get_main_table(TABLE_MAIN_ADMIN);
    $sqladmin = "SELECT user_id FROM $t_admin WHERE user_id = ".intval($user_id);
    $resadmin = Database::query($sqladmin);
    $is_admin = Database::num_rows($resadmin);

    if (empty($status)) {
        $status = 5;
    }

    if ($is_admin) {
        $status = 1;
    }

    if (!empty($expiration_date)) {
        $expiration_date = new DateTime($expiration_date);
    }

    $user
        ->setEmail($email)
        ->setStatus($status)
        ->setOfficialCode($official_code)
        ->setPhone($phone)
        ->setPictureUri($picture_uri)
        ->setExpirationDate($expiration_date)
        ->setHrDeptId($hr_dept_id)
        ->setActive(true);

    if (!is_null($creator_id)) {
        $user->setCreatorId($creator_id);
        //$sql .= ", creator_id='".Database::escape_string($creator_id)."'";
    }

    $userManager->updateUser($user, true);

    if (is_array($extra_list) && count($extra_list) > 0) {
        foreach ($extra_list as $extra) {
            $extra_field_name = $extra['field_name'];
            $extra_field_value = $extra['field_value'];
            // Save the external system's id into user_field_value table.
            UserManager::update_extra_field_value(
                $user_id,
                $extra_field_name,
                $extra_field_value
            );
        }
    }

    return  $user_id;
}

/* Register WSEditUserWithPicture function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUserWithPicture',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'picture_url' => array('name' => 'picture_url', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSEditUserWithPicture',              // method name
    array('editUserWithPicture' => 'tns:editUserWithPicture'),     // input parameters
    array('return' => 'xsd:string'),                    // output parameters
    'urn:WSRegistration',                               // namespace
    'urn:WSRegistration#WSEditUserWithPicture',         // soapaction
    'rpc',                                              // style
    'encoded',                                          // use
    'This service edits a user from wiener'             // documentation
);

// Define the method WSEditUserWithPicture
function WSEditUserWithPicture($params)
{
    global $_configuration;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $userManager = UserManager::getManager();
    $userRepository = UserManager::getRepository();

    $table_user = Database :: get_main_table(TABLE_MAIN_USER);

    $original_user_id_value = $params['original_user_id_value'];
    $original_user_id_name = $params['original_user_id_name'];
    $firstname = $params['firstname'];
    $lastname = $params['lastname'];
    $username = $params['username'];
    $password = null;
    $auth_source = null;
    $email = $params['email'];
    $expiration_date = null;
    $expirationDateStatement = '';
    $status = $params['status'];
    $phone = $params['phone'];
    $picture_url = $params['picture_url'];
    $pictureUri = '';

    $active = 1;
    $creator_id = null;
    $hr_dept_id = 0;
    $extra = null;
    $extra_list = $params['extra'];
    if (!empty($params['expiration_date'])) {
        $expiration_date = $params['expiration_date'];
    }

    if (!empty($params['password'])) {
        $password = $params['password'];
    }

    // Get user id from external id
    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    // Get picture and generate uri.
    $filename = basename($picture_url);
    $tempdir = sys_get_temp_dir();
    $tempDir = api_get_path(SYS_ARCHIVE_PATH);
    // Make sure the file download was OK by checking the HTTP headers for OK
    if (strpos(get_headers($picture_url)[0], "OK")) {
        file_put_contents($tempDir . $filename, file_get_contents($picture_url));
        $pictureUri = UserManager::update_user_picture($user_id, $filename, $tempDir . $filename);
    }

    if ($user_id == 0) {
        return 0;
    } else {
        $sql = "SELECT id FROM $table_user WHERE id =$user_id AND active= 0";
        $resu = Database::query($sql);
        $r_check_user = Database::fetch_row($resu);
        if (!empty($r_check_user[0])) {
            return 0;
        }
    }

    // Check whether username already exits.
    $sql = "SELECT username FROM $table_user WHERE username = '$username' AND id <> $user_id";
    $res_un = Database::query($sql);
    $r_username = Database::fetch_row($res_un);

    if (!empty($r_username[0])) {
        return 0;
    }


    /** @var User $user */
    $user = $userRepository->find($user_id);

    if (!empty($lastname)) {
        $user->setLastname($lastname);
        //$sql .= " lastname='".Database::escape_string($lastname)."', ";
    }
    if (!empty($firstname)) {
        $user->setFirstname($firstname);
        //$sql .= " firstname='".Database::escape_string($firstname)."', ";
    }
    $user->setUsername($username);
    //$sql .= " username='".Database::escape_string($username)."',";
    if (!is_null($password)) {
        //$password = $_configuration['password_encryption'] ? api_get_encrypted_password($password) : $password;
        //$sql .= " password='".Database::escape_string($password)."',";
        $user->setPlainPassword($password);
    }
    if (!is_null($auth_source)) {
        $user->setAuthSource($auth_source);
    }

    // Exception for admins in case no status is provided in WS call...
    $t_admin = Database::get_main_table(TABLE_MAIN_ADMIN);
    $sqladmin = "SELECT user_id FROM $t_admin WHERE user_id = ".intval($user_id);
    $resadmin = Database::query($sqladmin);
    $is_admin = Database::num_rows($resadmin);

    if (empty($status)) {
        $status = $user->getStatus();
    }

    if ($is_admin) {
        $status = 1;
    }

    if (!empty($expiration_date)) {
        $expiration_date = new DateTime($expiration_date);
    }

    $user
        ->setEmail($email)
        ->setStatus($status)
        ->setPhone($phone)
        ->setExpirationDate($expiration_date)
        ->setHrDeptId($hr_dept_id)
        ->setActive(true)
        ->setPictureUri($pictureUri);;

    if (!is_null($creator_id)) {
        $user->setCreatorId($creator_id);
        //$sql .= ", creator_id='".Database::escape_string($creator_id)."'";
    }

    $userManager->updateUser($user, true);

    if (is_array($extra_list) && count($extra_list) > 0) {
        foreach ($extra_list as $extra) {
            $extra_field_name = $extra['field_name'];
            $extra_field_value = $extra['field_value'];
            // Save the external system's id into user_field_value table.
            UserManager::update_extra_field_value(
                $user_id,
                $extra_field_name,
                $extra_field_value
            );
        }
    }

    return $user_id;
}

/* Register WSEditUsersPasswordCrypted function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUsersPasswordCryptedParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'encrypt_method' => array('name' => 'encrypt_method', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'editUsersPasswordCryptedParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:editUsersPasswordCryptedParams[]')),
    'tns:editUsersPasswordCryptedParams'
);

$server->wsdl->addComplexType(
    'editUsersPasswordCrypted',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'users' => array('name' => 'users', 'type' => 'tns:editUsersPasswordCryptedParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_editUsersPasswordCrypted',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_editUsersPasswordCrypted',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_editUsersPasswordCrypted[]')),
    'tns:result_editUsersPasswordCrypted'
);

// Register the method to expose
$server->register('WSEditUsersPasswordCrypted',                           // method name
    array('editUsersPasswordCrypted' => 'tns:editUsersPasswordCrypted'),  // input parameters
    array('return' => 'tns:results_editUsersPasswordCrypted'),            // output parameters
    'urn:WSRegistration',                                                 // namespace
    'urn:WSRegistration#WSEditUsersPasswordCrypted',                      // soapaction
    'rpc',                                                                // style
    'encoded',                                                            // use
    'This service edits a user'                                           // documentation
);

// Define the method WSEditUsersPasswordCrypted
function WSEditUsersPasswordCrypted($params) {
    global $_configuration;

    if(!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    // get user id from id of remote system
    $table_user = Database :: get_main_table(TABLE_MAIN_USER);

    $users_params = $params['users'];
    $results = array();
    $orig_user_id_value = array();

    foreach ($users_params as $user_param) {

        $original_user_id_value = $user_param['original_user_id_value'];
        $original_user_id_name = $user_param['original_user_id_name'];
        $orig_user_id_value[] = $original_user_id_value;
        $firstname = $user_param['firstname'];
        $lastname = $user_param['lastname'];
        $username = $user_param['username'];
        $password = null;
        $auth_source = null;
        $email = $user_param['email'];
        $status = $user_param['status'];
        $official_code = '';
        $phone = $user_param['phone'];
        $picture_uri = '';
        $expiration_date = $user_param['expiration_date'];
        $active = 1;
        $creator_id = null;
        $hr_dept_id = 0;
        $extra = null;
        $extra_list = $user_param['extra'];

        if (!empty($user_param['password']) && !empty($user_param['encrypt_method'])) {

            $password = $user_param['password'];
            $encrypt_method = $user_param['encrypt_method'];
            if ($_configuration['password_encryption'] === $encrypt_method ) {
                if ($encrypt_method == 'md5' && !preg_match('/^[A-Fa-f0-9]{32}$/', $password)) {
                    $msg = "Encryption $encrypt_method is invalid";
                    $results[] = $msg;
                    continue;
                } else if ($encrypt_method == 'sha1' && !preg_match('/^[A-Fa-f0-9]{40}$/', $password)) {
                    $msg = "Encryption $encrypt_method is invalid";
                    $results[] = $msg;
                    continue;
                }
            } else {
                $msg = "This encryption $encrypt_method is not configured";
                $results[] = $msg;
                continue;
            }
        } elseif (!empty($user_param['password']) && empty($user_param['encrypt_method'])){
            $msg = "If password is not empty the encrypt_method param is required ";
            $results[] = $msg;
            continue;
        } elseif (empty($user_param['password']) && !empty($user_param['encrypt_method'])){
            $msg = "If encrypt_method is not empty the password param is required ";
            $results[] = $msg;
            continue;
        }

        $user_id = UserManager::get_user_id_from_original_id(
            $original_user_id_value,
            $original_user_id_name
        );

        if ($user_id == 0) {
            $results[] = 0; // Original_user_id_value doesn't exist.
            continue;
        } else {
            $sql = "SELECT user_id FROM $table_user
                    WHERE user_id ='$user_id' AND active= '0'";
            $resu = Database::query($sql);
            $r_check_user = Database::fetch_row($resu);
            if (!empty($r_check_user[0])) {
                $results[] = 0; // user_id is not active
                continue;
            }
        }

        // Check if username already exits.
        $sql = "SELECT username FROM $table_user
                WHERE username ='$username' AND user_id <> '$user_id'";
        $res_un = Database::query($sql);
        $r_username = Database::fetch_row($res_un);

        if (!empty($r_username[0])) {
            $results[] = 0;
            continue; // username already exits
        }

        $sql = "UPDATE $table_user SET ";
        if (!empty($lastname)) {
            $sql .= " lastname='".Database::escape_string($lastname)."', ";
        }
        if (!empty($firstname)) {
            $sql .= " firstname='".Database::escape_string($firstname)."', ";
        }
        $sql .= " username='".Database::escape_string($username)."',";
        if (!is_null($password)) {
            $sql .= " password='".Database::escape_string($password)."',";
        }
        if (!is_null($auth_source)) {
            $sql .= " auth_source='".Database::escape_string($auth_source)."',";
        }

        // Exception for admins in case no status is provided in WS call...
        $t_admin = Database::get_main_table(TABLE_MAIN_ADMIN);
        $sqladmin = "SELECT user_id FROM $t_admin WHERE user_id = ".intval($user_id);
        $resadmin = Database::query($sqladmin);
        $is_admin = Database::num_rows($resadmin);

        if (empty($status)) {
            $status = 5;
        }

        if ($is_admin) {
            $status = 1;
        }

        $sql .= "
                email='".Database::escape_string($email)."',
                status='".Database::escape_string($status)."',
                official_code='".Database::escape_string($official_code)."',
                phone='".Database::escape_string($phone)."',
                picture_uri='".Database::escape_string($picture_uri)."',
                expiration_date='".Database::escape_string($expiration_date)."',
                active='".Database::escape_string($active)."',
                hr_dept_id=".intval($hr_dept_id);

        if (!is_null($creator_id)) {
            $sql .= ", creator_id='".Database::escape_string($creator_id)."'";
        }
        $sql .= " WHERE user_id='$user_id'";
        $return = @Database::query($sql);

        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                $extra_field_name = $extra['field_name'];
                $extra_field_value = $extra['field_value'];
                // Save the external system's id into user_field_value table.
                $res = UserManager::update_extra_field_value(
                    $user_id,
                    $extra_field_name,
                    $extra_field_value
                );
            }
        }

        $results[] = $return;
        continue;
    } //end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_value' => $orig_user_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSEditUserPasswordCrypted function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editUserPasswordCrypted',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'firstname' => array('name' => 'firstname', 'type' => 'xsd:string'),
        'lastname' => array('name' => 'lastname', 'type' => 'xsd:string'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'password' => array('name' => 'password', 'type' => 'xsd:string'),
        'encrypt_method' => array('name' => 'encrypt_method', 'type' => 'xsd:string'),
        'email' => array('name' => 'email', 'type' => 'xsd:string'),
        'status' => array('name' => 'status', 'type' => 'xsd:string'),
        'phone' => array('name' => 'phone', 'type' => 'xsd:string'),
        'expiration_date' => array('name' => 'expiration_date', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSEditUserPasswordCrypted',                         // method name
    array('editUserPasswordCrypted' => 'tns:editUserPasswordCrypted'), // input parameters
    array('return' => 'xsd:string'),                                   // output parameters
    'urn:WSRegistration',                                              // namespace
    'urn:WSRegistration#WSEditUserPasswordCrypted',                    // soapaction
    'rpc',                                                             // style
    'encoded',                                                         // use
    'This service edits a user'                                        // documentation
);

// Define the method WSEditUserPasswordCrypted
function WSEditUserPasswordCrypted($params)
{
    global $_configuration, $debug;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    if ($debug) {
        error_log('WSEditUserPasswordCrypted');
    }

    $table_user = Database::get_main_table(TABLE_MAIN_USER);

    $original_user_id_value = $params['original_user_id_value'];
    $original_user_id_name = $params['original_user_id_name'];

    $firstname = isset($params['firstname']) ? $params['firstname'] : '';
    $lastname = isset($params['lastname']) ? $params['lastname'] : '';
    $username = isset($params['username']) ? $params['username'] : '';
    $password = null;
    $auth_source = null;
    $email = isset($params['email']) ? $params['email'] : '';
    $status = isset($params['status']) ? $params['status'] : '';
    $official_code = '';
    $phone = isset($params['phone']) ? $params['phone'] : '';
    $picture_uri = '';
    $expiration_date = isset($params['expiration_date']) ? $params['expiration_date'] : '';
    $active = 1;
    $creator_id = null;
    $hr_dept_id = 0;
    $extra = null;
    $extra_list = isset($params['extra']) ? $params['extra'] : '';
    $params['password'] = isset($params['password']) ? $params['password'] : '';
    $params['encrypt_method'] = isset($params['encrypt_method']) ? $params['encrypt_method'] : '';

    if (!empty($params['password']) && !empty($params['encrypt_method'])) {
        $password = $params['password'];
        $encrypt_method = $params['encrypt_method'];
        if ($_configuration['password_encryption'] === $encrypt_method ) {
            if ($encrypt_method == 'md5' && !preg_match('/^[A-Fa-f0-9]{32}$/', $password)) {
                $msg = "Encryption $encrypt_method is invalid";
                return $msg;
            } else if ($encrypt_method == 'sha1' && !preg_match('/^[A-Fa-f0-9]{40}$/', $password)) {
                $msg = "Encryption $encrypt_method is invalid";
                return $msg;
            }
        } else {
            $msg = "This encryption $encrypt_method is not configured";
            return $msg;
        }
    } elseif (!empty($params['password']) && empty($params['encrypt_method'])) {
        $msg = "If password is not empty the encrypt_method param is required ";

        return $msg;
    } elseif (empty($params['password']) && !empty($params['encrypt_method'])) {
        $msg = "If encrypt_method is not empty the password param is required ";

        return $msg;
    }

    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    if ($debug) {
        error_log("user: $user_id");
    }

    if ($user_id == 0) {
        return 0;
    } else {
        $sql = "SELECT user_id FROM $table_user
                WHERE user_id ='$user_id' AND active= '0'";
        $resu = Database::query($sql);
        $r_check_user = Database::fetch_row($resu);
        if (!empty($r_check_user[0])) {
            return 0;
        }
    }

    // Check whether username already exits.
    $sql = "SELECT username FROM $table_user
            WHERE username ='$username' AND user_id <> '$user_id'";
    $res_un = Database::query($sql);
    $r_username = Database::fetch_row($res_un);

    if (!empty($r_username[0])) {
        return 0;
    }
    // Edit lastname and firstname only if not empty
    $sql = "UPDATE $table_user SET ";
    if (!empty($lastname)) {
        $sql .= " lastname='".Database::escape_string($lastname)."', ";
    }
    if (!empty($firstname)) {
        $sql .= " firstname='".Database::escape_string($firstname)."', ";
    }
    $sql .= " username='".Database::escape_string($username)."',";

    if (!empty($password)) {
        $sql .= " password='".Database::escape_string($password)."',";
    }

    if (!empty($auth_source)) {
        $sql .= " auth_source='".Database::escape_string($auth_source)."',";
    }

    // Exception for admins in case no status is provided in WS call...
    $t_admin = Database::get_main_table(TABLE_MAIN_ADMIN);
    $sqladmin = "SELECT user_id FROM $t_admin WHERE user_id = ".intval($user_id);
    $resadmin = Database::query($sqladmin);
    $is_admin = Database::num_rows($resadmin);

    if (empty($status)) {
        $status = 5;
    }

    if ($is_admin) {
        $status = 1;
    }

    $sql .= "
            email='".Database::escape_string($email)."',
            status='".Database::escape_string($status)."',
            official_code='".Database::escape_string($official_code)."',
            phone='".Database::escape_string($phone)."',
            picture_uri='".Database::escape_string($picture_uri)."',
            expiration_date='".Database::escape_string($expiration_date)."',
            active='".Database::escape_string($active)."',
            hr_dept_id=".intval($hr_dept_id);

    if (!is_null($creator_id)) {
        $sql .= ", creator_id='".Database::escape_string($creator_id)."'";
    }

    $sql .= " WHERE user_id='$user_id'";
    $return = @Database::query($sql);

    if ($debug) {
        error_log("SQL: $sql");
    }

    if (is_array($extra_list) && count($extra_list) > 0) {
        foreach ($extra_list as $extra) {
            $extra_field_name = $extra['field_name'];
            $extra_field_value = $extra['field_value'];
            // save the external system's id into user_field_value table'
            UserManager::update_extra_field_value(
                $user_id,
                $extra_field_name,
                $extra_field_value
            );
        }
    }

    if ($return) {
        return 1;
    }

    return 0;
}

/** WSDeleteUsers **/
$server->wsdl->addComplexType(
    'user_id',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'user_ids_array',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref'=>'SOAP-ENC:arrayType','wsdl:arrayType' => 'tns:user_id[]')),'tns:user_id'
);

$server->wsdl->addComplexType(
    'user_ids',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'ids' => array('name' => 'user_ids', 'type' => 'tns:user_ids_array'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

function WSHelperActionOnUsers($params, $type) {
    if(!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $original_user_ids = $params['ids'];
    foreach($original_user_ids as $original_user_id) {
        $user_id = UserManager::get_user_id_from_original_id(
            $original_user_id['original_user_id_value'],
            $original_user_id['original_user_id_name']
        );
        if($user_id > 0) {
            if($type == "delete") {
                UserManager::delete_user($user_id);
            } else if($type == "disable") {
                UserManager::disable($user_id);
            } else if($type == "enable") {
                UserManager::enable($user_id);
            }
        }
    }
}

$server->register('WSDeleteUsers',                         // method name
    array('user_ids' => 'tns:user_ids'),                   // input parameters
    array(),                                               // output parameters
    'urn:WSRegistration',                                  // namespace
    'urn:WSRegistration#WSDeleteUsers',                    // soapaction
    'rpc',                                                 // style
    'encoded',                                             // use
    'Deletes users provided as parameters from the system' // documentation
);

function WSDeleteUsers($params) {
    WSHelperActionOnUsers($params, "delete");
}

/** WSDisableUsers **/
$server->register('WSDisableUsers',                         // method name
    array('user_ids' => 'tns:user_ids'),                    // input parameters
    array(),                                                // output parameters
    'urn:WSRegistration',                                   // namespace
    'urn:WSRegistration#WSDisableUsers',                    // soapaction
    'rpc',                                                  // style
    'encoded',                                              // use
    'Disables users provided as parameters from the system' // documentation
);

function WSDisableUsers($params) {
    WSHelperActionOnUsers($params, "disable");
}

/** WSEnableUsers **/
$server->register('WSEnableUsers',            // method name
    array('user_ids' => 'tns:user_ids'),      // input parameters
    array(),                                  // output parameters
    'urn:WSRegistration',                     // namespace
    'urn:WSRegistration#WSEnableUsers',       // soapaction
    'rpc',                                    // style
    'encoded',                                // use
    'Enables users provided as parameters'    // documentation
);

function WSEnableUsers($params) {
    WSHelperActionOnUsers($params, "enable");
}


/* Register WSCreateCourse function */
// Register the data structures used by the service

$server->wsdl->addComplexType(
    'course_id',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'createCourseParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'title' => array('name' => 'title', 'type' => 'xsd:string'),
        'category_code' => array('name' => 'category_code', 'type' => 'xsd:string'),
        'wanted_code' => array('name' => 'wanted_code', 'type' => 'xsd:string'),
        'tutor_name' => array('name' => 'tutor_name', 'type' => 'xsd:string'),
        'course_language' => array('name' => 'course_language', 'type' => 'xsd:string'),
        'disk_quota' => array('name' => 'disk_quota', 'type' => 'xsd:string'), // disk_quota in MB
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'createCourseParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref'=>'SOAP-ENC:arrayType','wsdl:arrayType' => 'tns:createCourseParams[]')),'tns:createCourseParams'
);

// Register the data structures used by the service
$server->wsdl->addComplexType(
    'createCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'courses' => array('name' => 'courses', 'type' => 'tns:createCourseParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_createCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_createCourse',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_createCourse[]')),
    'tns:result_createCourse'
);

// Register the method to expose
$server->register('WSCreateCourse',                // method name
    array('createCourse' => 'tns:createCourse'),   // input parameters
    array('return' => 'tns:results_createCourse'), // output parameters
    'urn:WSRegistration',                          // namespace
    'urn:WSRegistration#WSCreateCourse',           // soapaction
    'rpc',                                         // style
    'encoded',                                     // use
    'This service adds a course'                   // documentation
);

// Define the method WSCreateCourse
function WSCreateCourse($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $table_course = Database :: get_main_table(TABLE_MAIN_COURSE);

    $courses_params = $params['courses'];
    $results = array();
    $orig_course_id_value = array();

    foreach ($courses_params as $course_param) {
        $title = $course_param['title'];
        $category_code = isset($course_param['category_code']) ? $course_param['category_code'] : '';
        $wanted_code = $course_param['wanted_code'];
        $tutor_name = isset($course_param['tutor_name']) ? $course_param['tutor_name'] : '';
        $diskQuota = isset($course_param['disk_quota']) ? $course_param['disk_quota'] : '100';
        // Convert to MB
        $diskQuota = $diskQuota * 1024 * 1024;

        $course_language = 'english'; // TODO: A hard-coded value.
        $original_course_id_name = $course_param['original_course_id_name'];
        $original_course_id_value = $course_param['original_course_id_value'];
        $orig_course_id_value[] = $course_param['original_course_id_value'];
        $visibility = null;

        if (isset($course_param['visibility'])) {
            if ($course_param['visibility'] &&
                $course_param['visibility'] >= 0 &&
                $course_param['visibility'] <= 3
            ) {
                $visibility = $course_param['visibility'];
            }
        }
        $extra_list = isset($course_param['extra']) ? $course_param['extra'] : '';


        // Check whether exits $x_course_code into user_field_values table.
        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $course_param['original_course_id_value'],
            $course_param['original_course_id_name']
        );

        if (!empty($courseInfo)) {
            if ($courseInfo['visibility'] != 0) {
                $sql = "UPDATE $table_course SET
                            course_language='".Database::escape_string($course_language)."',
                            title='".Database::escape_string($title)."',
                            category_code='".Database::escape_string($category_code)."',
                            tutor_name='".Database::escape_string($tutor_name)."',
                            visual_code='".Database::escape_string($wanted_code)."'";
                if($visibility !== null) {
                    $sql .= ", visibility = '$visibility' ";
                }
                $sql .= " WHERE id='".$courseInfo['real_id']."'";
                Database::query($sql);
                if (is_array($extra_list) && count($extra_list) > 0) {
                    foreach ($extra_list as $extra) {
                        $extra_field_name = $extra['field_name'];
                        $extra_field_value = $extra['field_value'];
                        // Save the external system's id into course_field_value table.
                        CourseManager::update_course_extra_field_value(
                            $courseInfo['code'],
                            $extra_field_name,
                            $extra_field_value
                        );
                    }
                }
                $results[] = $courseInfo['code'];
                continue;
            } else {
                $results[] = 0;
                continue; // Original course id already exits.
            }
        }

        if (!empty($course_param['course_language'])) {
            $course_language = $course_param['course_language'];
        }

        // Set default values
        if (isset($_user['language']) && $_user['language'] != '') {
            $values['course_language'] = $_user['language'];
        } else {
            $values['course_language'] = api_get_setting('platformLanguage');
        }

        if (isset($_user['firstName'])) {
            $values['tutor_name'] = api_get_person_name(
                $_user['firstName'],
                $_user['lastName'],
                null,
                null,
                $values['course_language']
            );
        }

        $params = array();
        $params['title'] = $title;
        $params['wanted_code'] = $wanted_code;
        $params['category_code'] = $category_code;
        $params['course_category']    = $category_code;
        $params['tutor_name'] = $tutor_name;
        $params['course_language'] = $course_language;
        $params['user_id'] = api_get_user_id();
        $params['visibility'] = $visibility;
        $params['disk_quota'] = $diskQuota;

        $course_info = CourseManager::create_course($params);

        if (!empty($course_info)) {
            $course_code = $course_info['code'];

            // Save new field label into course_field table
            CourseManager::create_course_extra_field(
                $original_course_id_name,
                1,
                $original_course_id_name,
                ''
            );

            // Save the external system's id into user_field_value table.
            CourseManager::update_course_extra_field_value(
                $course_code,
                $original_course_id_name,
                $original_course_id_value
            );

            if (is_array($extra_list) && count($extra_list) > 0) {
                foreach ($extra_list as $extra) {
                    $extra_field_name  = $extra['field_name'];
                    $extra_field_value = $extra['field_value'];
                    // Save new fieldlabel into course_field table.
                    CourseManager::create_course_extra_field(
                        $extra_field_name,
                        1,
                        $extra_field_name,
                        ''
                    );
                    // Save the external system's id into course_field_value table.
                    CourseManager::update_course_extra_field_value(
                        $course_code,
                        $extra_field_name,
                        $extra_field_value
                    );
                }
            }
            $results[] = $course_code;
        } else {
            $results[] = 0;
        }
    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSCreateCourseByTitle function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'createCourseByTitleParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'title' => array('name' => 'title', 'type' => 'xsd:string'),
        'tutor_name' => array('name' => 'tutor_name', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'createCourseByTitleParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:createCourseByTitleParams[]')),
    'tns:createCourseByTitleParams'
);

// Register the data structures used by the service
$server->wsdl->addComplexType(
    'createCourseByTitle',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'courses' => array('name' => 'courses', 'type' => 'tns:createCourseByTitleParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_createCourseByTitle',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_createCourseByTitle',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_createCourseByTitle[]')),
    'tns:result_createCourseByTitle'
);


// Register the method to expose
$server->register('WSCreateCourseByTitle',                     // method name
    array('createCourseByTitle' => 'tns:createCourseByTitle'), // input parameters
    array('return' => 'tns:results_createCourseByTitle'),      // output parameters
    'urn:WSRegistration',                                      // namespace
    'urn:WSRegistration#WSCreateCourseByTitle',                // soapaction
    'rpc',                                                     // style
    'encoded',                                                 // use
    'This service adds a course by title'                      // documentation
);

// Define the method WSCreateCourseByTitle
function WSCreateCourseByTitle($params)
{
    global $firstExpirationDelay, $_configuration;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $table_course = Database::get_main_table(TABLE_MAIN_COURSE);

    $courses_params = $params['courses'];
    $results = array();
    $orig_course_id_value = array();

    foreach ($courses_params as $course_param) {

        $title = $course_param['title'];
        $category_code = 'LANG'; // TODO: A hard-coded value.
        $wanted_code = '';
        $tutor_firstname = api_get_setting('administratorName');
        $tutor_lastname = api_get_setting('administratorSurname');
        $course_language = 'spanish'; // TODO: Incorrect default value, it should 'english'.
        if (!empty($course_param['course_language'])) {
            $course_language = $course_param['course_language'];
        }
        $tutor_name = api_get_person_name($tutor_firstname, $tutor_lastname, null, null, $course_language);
        if (!empty($course_param['tutor_name'])) {
            $tutor_name = $course_param['tutor_name'];
        }
        $original_course_id_name = $course_param['original_course_id_name'];
        $original_course_id_value = $course_param['original_course_id_value'];
        $orig_course_id_value[] = $course_param['original_course_id_value'];
        $extra_list = $course_param['extra'];

        // Ensure the database prefix + database name do not get over 40 characters
        $maxlength = 40;

        if (empty($wanted_code)) {
            $wanted_code = CourseManager::generate_course_code(substr($title, 0, $maxlength));
        }

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        if (!empty($courseInfo)) {
            if ($courseInfo['visibility'] != 0) {
                $sql = "UPDATE $table_course SET
                            course_language='".Database::escape_string($course_language)."',
                            title='".Database::escape_string($title)."',
                            category_code='".Database::escape_string($category_code)."',
                            tutor_name='".Database::escape_string($tutor_name)."',
                            visual_code='".Database::escape_string($wanted_code)."',
                            visibility = '3'
                        WHERE id ='".$courseInfo['real_id']."'";
                Database::query($sql);
                $results[] = $courseInfo['real_id'];
                continue;
            } else {
                $results[] = 0;
                continue;
            }
        }

        // Set default values.
        if (isset($_user['language']) && $_user['language'] != '') {
            $values['course_language'] = $_user['language'];
        } else {
            $values['course_language'] = api_get_setting('platformLanguage');
        }

        $values['tutor_name'] = api_get_person_name($_user['firstName'], $_user['lastName'], null, null, $values['course_language']);

        $keys = AddCourse::define_course_keys($wanted_code, '', $_configuration['db_prefix']);

        $sql_check = sprintf('SELECT * FROM '.$table_course.' WHERE visual_code = "%s"', Database :: escape_string($wanted_code));
        $result_check = Database::query($sql_check); // I don't know why this api function doesn't work...
        if (Database::num_rows($result_check) < 1) {

            $params = array();
            $params['title'] = $title;
            $params['wanted_code'] = $wanted_code;
            $params['category_code'] = $category_code;
            $params['tutor_name'] = $tutor_name;
            $params['course_language'] = $course_language;
            $params['user_id'] = api_get_user_id();
            //$params['visibility'] = $visibility;

            $course_info = CourseManager::create_course($params);

            if (!empty($course_info)) {
                $course_code = $course_info['code'];

                // Save new fieldlabel into course_field table.
                CourseManager::create_course_extra_field(
                    $original_course_id_name,
                    1,
                    $original_course_id_name,
                    ''
                );

                // Save the external system's id into user_field_value table.
                CourseManager::update_course_extra_field_value(
                    $course_code,
                    $original_course_id_name,
                    $original_course_id_value
                );

                if (is_array($extra_list) && count($extra_list) > 0) {
                    foreach ($extra_list as $extra) {
                        $extra_field_name = $extra['field_name'];
                        $extra_field_value = $extra['field_value'];
                        // Save new fieldlabel into course_field table.
                        CourseManager::create_course_extra_field(
                            $extra_field_name,
                            1,
                            $extra_field_name,
                            ''
                        );
                        // Save the external system's id into course_field_value table.
                        CourseManager::update_course_extra_field_value(
                            $course_code,
                            $extra_field_name,
                            $extra_field_value
                        );
                    }
                }
            }
            $results[] = $course_code;
            continue;

        } else {
            $results[] = 0;
            continue;
        }

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSEditCourse function */
// Register the data structures used by the service

$server->wsdl->addComplexType(
    'editCourseParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'tutor_id' => array('name' => 'tutor_id', 'type' => 'xsd:string'),
        'title' => array('name' => 'title', 'type' => 'xsd:string'),
        'category_code' => array('name' => 'category_code', 'type' => 'xsd:string'),
        'department_name' => array('name' => 'department_name', 'type' => 'xsd:string'),
        'department_url' => array('name' => 'department_url', 'type' => 'xsd:string'),
        'course_language' => array('name' => 'course_language', 'type' => 'xsd:string'),
        'visibility' => array('name' => 'visibility', 'type' => 'xsd:string'),
        'subscribe' => array('name' => 'subscribe', 'type' => 'xsd:string'),
        'unsubscribe' => array('name' => 'unsubscribe', 'type' => 'xsd:string'),
        'visual_code' => array('name' => 'visual_code', 'type' => 'xsd:string'),
        'disk_quota' => array('name' => 'disk_quota', 'type' => 'xsd:string'), // disk_quota in MB
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'editCourseParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:editCourseParams[]')),
    'tns:editCourseParams'
);

$server->wsdl->addComplexType(
    'editCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'courses' => array('name' => 'courses', 'type' => 'tns:editCourseParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_editCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_editCourse',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_editCourse[]')),
    'tns:result_editCourse'
);

// Register the method to expose
$server->register('WSEditCourse',                // method name
    array('editCourse' => 'tns:editCourse'),     // input parameters
    array('return' => 'tns:results_editCourse'), // output parameters
    'urn:WSRegistration',                        // namespace
    'urn:WSRegistration#WSEditCourse',           // soapaction
    'rpc',                                       // style
    'encoded',                                   // use
    'This service edits a course'                // documentation
);

// Define the method WSEditCourse
function WSEditCourse($params){

    global $_configuration;
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $course_table = Database::get_main_table(TABLE_MAIN_COURSE);

    $courses_params = $params['courses'];
    $results = array();
    $orig_course_id_value = array();

    foreach ($courses_params as $course_param) {

        $tutor_id = isset($course_param['tutor_id']) ? $course_param['tutor_id'] : '';
        $title = $course_param['title'];
        $category_code = isset($course_param['category_code']) ? $course_param['category_code'] : '';
        $department_name = isset($course_param['department_name']) ? $course_param['department_name'] : '';
        $department_url = isset($course_param['department_url']) ? $course_param['department_url'] : '';
        $course_language = $course_param['course_language'];
        $visibility = $course_param['visibility'];
        $subscribe = $course_param['subscribe'];
        $unsubscribe = $course_param['unsubscribe'];
        $visual_code = $course_param['visual_code'];
        $diskQuota = isset($course_param['disk_quota']) ? $course_param['disk_quota'] : '100';
        // Convert to MB
        $diskQuota = $diskQuota * 1024 * 1024;

        $original_course_id_name = $course_param['original_course_id_name'];
        $original_course_id_value = $course_param['original_course_id_value'];
        $orig_course_id_value[] = $original_course_id_value;
        $extra_list = isset($course_param['extra']) ? $course_param['extra'] : null;

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        if (empty($courseInfo)) {
            $results[] = 0; // Original_course_id_value doesn't exist.
            continue;
        }

        $course_code = $courseInfo['code'];
        $courseId = $courseInfo['real_id'];

        $table_user = Database :: get_main_table(TABLE_MAIN_USER);
        $sql = "SELECT concat(lastname,'',firstname) as tutor_name
                FROM $table_user WHERE status='1' AND user_id = '$tutor_id'
                ORDER BY lastname,firstname";
        $res = Database::query($sql);
        $tutor_name = Database::fetch_row($res);

        $dbnamelength = strlen($_configuration['db_prefix']);
        $maxlength = 40 - $dbnamelength;

        if (empty($visual_code)) {
            $visual_code = CourseManager::generate_course_code(substr($title, 0, $maxlength));
        }
        $tutor_name = $tutor_name[0];
        $sql = "UPDATE $course_table SET
                    course_language='".Database::escape_string($course_language)."',
                    title='".Database::escape_string($title)."',
                    category_code='".Database::escape_string($category_code)."',
                    tutor_name='".Database::escape_string($tutor_name)."',
                    visual_code='".Database::escape_string($visual_code)."',
                    department_name='".Database::escape_string($department_name)."',
                    department_url='".Database::escape_string($department_url)."',
                    visibility = '".Database::escape_string($visibility)."',
                    subscribe = '".Database::escape_string($subscribe)."',
                    disk_quota='".Database::escape_string($diskQuota)."',
                    unsubscribe='".Database::escape_string($unsubscribe)."'
                WHERE id ='".Database::escape_string($courseId)."'";
        $res = Database::query($sql);

        if (is_array($extra_list) && count($extra_list) > 0) {
            foreach ($extra_list as $extra) {
                $extra_field_name = $extra['field_name'];
                $extra_field_value = $extra['field_value'];
                // Save the external system's id into course_field_value table.
                $res = CourseManager::update_course_extra_field_value(
                    $course_code,
                    $extra_field_name,
                    $extra_field_value
                );
            }
        }

        if ($res) {
            $results[] = 1;
            continue;
        } else {
            $results[] = 0;
            continue;
        }

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSCourseDescription function */
// Register the data structures used by the service

$server->wsdl->addComplexType(
    'courseDescription',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'fields_course_desc',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course_desc_id' => array('name' => 'course_desc_id', 'type' => 'xsd:string'),
        'course_desc_default_title' => array('name' => 'course_desc_default_title', 'type' => 'xsd:string'),
        'course_desc_title' => array('name' => 'course_desc_title', 'type' => 'xsd:string'),
        'course_desc_content' => array('name' => 'course_desc_content', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'fields_course_desc_list',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:fields_course_desc[]')),
    'tns:fields_course_desc'
);


// Register the method to expose
$server->register('WSCourseDescription',                    // method name
    array('courseDescription' => 'tns:courseDescription'),  // input parameters
    array('return' => 'tns:fields_course_desc_list'),       // output parameters
    'urn:WSRegistration',                                   // namespace
    'urn:WSRegistration#WSCourseDescription',               // soapaction
    'rpc',                                                  // style
    'encoded',                                              // use
    'This service edits a course description'               // documentation
);

// Define the method WSCourseDescription
function WSCourseDescription($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $array_course_desc_id = array();
    $array_course_desc_title = array();
    $array_course_desc_content = array();

    $original_course_id_name = $params['original_course_id_name'];
    $original_course_id_value = $params['original_course_id_value'];

    $courseInfo = CourseManager::getCourseInfoFromOriginalId(
        $original_course_id_value,
        $original_course_id_name
    );

    if (empty($courseInfo) || (isset($courseInfo) && $courseInfo['visibility'] == 0)) {
        return 0; // Original_course_id_value doesn't exist.
    }

    $t_course_desc = Database::get_course_table(TABLE_COURSE_DESCRIPTION);
    $sql = "SELECT * FROM $t_course_desc WHERE c_id = {$courseInfo['real_id']} ";
    $result = Database::query($sql);

    $default_titles = array(
        get_lang('GeneralDescription'),
        get_lang('Objectives'),
        get_lang('Topics'),
        get_lang('Methodology'),
        get_lang('CourseMaterial'),
        get_lang('HumanAndTechnicalResources'),
        get_lang('Assessment'),
        get_lang('AddCategory')
    );

    // TODO: Hard-coded Spanish texts.
    //$default_titles = array('Descripcion general', 'Objetivos', 'Contenidos', 'Metodologia', 'Materiales', 'Recursos humanos y tecnicos', 'Evaluacion', 'Apartado');

    for ($x = 1; $x < 9; $x++) {
        $array_course_desc_id[$x] = $x;
        $array_course_desc_default_title[$x] = $default_titles[$x - 1];
        $array_course_desc_title[$x] = '';
        $array_course_desc_content[$x] = '';
    }

    while ($row = Database::fetch_array($result)) {
        $ind = (int)$row['id'];
        $array_course_desc_title[$ind] = $row['title'];
        $array_course_desc_content[$ind] = $row['content'];
    }

    $count_results = count($default_titles);
    $output = array();
    for($i = 1; $i <= $count_results; $i++) {
        $output[] = array(
            'course_desc_id' => $array_course_desc_id[$i],
            'course_desc_default_title' => $array_course_desc_default_title[$i],
            'course_desc_title' => $array_course_desc_title[$i],
            'course_desc_content' => $array_course_desc_content[$i]
        );
    }

    return $output;
}

/* Register WSEditCourseDescription function */
// Register the data structures used by the service

$server->wsdl->addComplexType(
    'editCourseDescriptionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course_desc_id' => array('name' => 'course_desc_id', 'type' => 'xsd:string'),
        'course_desc_title' => array('name' => 'course_desc_title', 'type' => 'xsd:string'),
        'course_desc_content' => array('name' => 'course_desc_content', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'editCourseDescriptionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:editCourseDescriptionParams[]')),
    'tns:editCourseDescriptionParams'
);

$server->wsdl->addComplexType(
    'editCourseDescription',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course_desc' => array('name' => 'course_desc', 'type' => 'tns:editCourseDescriptionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);


// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_editCourseDescription',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_editCourseDescription',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_editCourseDescription[]')),
    'tns:result_editCourseDescription'
);


// Register the method to expose
$server->register('WSEditCourseDescription',                       // method name
    array('editCourseDescription' => 'tns:editCourseDescription'), // input parameters
    array('return' => 'tns:results_editCourseDescription'),        // output parameters
    'urn:WSRegistration',                                          // namespace
    'urn:WSRegistration#WSEditCourseDescription',                  // soapaction
    'rpc',                                                         // style
    'encoded',                                                     // use
    'This service edits a course description'                      // documentation
);

// Define the method WSEditCourseDescription
function WSEditCourseDescription($params) {

    global $_course;

    if (!WSHelperVerifyKey($params)) {
        return -1;
    }

    $course_table = Database::get_main_table(TABLE_MAIN_COURSE);

    $courses_params = $params['course_desc'];
    $results = array();
    $orig_course_id_value = array();

    foreach ($courses_params as $course_param) {

        $original_course_id_name = $course_param['original_course_id_name'];
        $original_course_id_value = $course_param['original_course_id_value'];
        $course_desc_id = $course_param['course_desc_id'];
        $course_desc_title = $course_param['course_desc_title'];
        $course_desc_content = $course_param['course_desc_content'];
        $orig_course_id_value[] = $original_course_id_value;

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        if (empty($courseInfo) || (isset($courseInfo) && $courseInfo['visibility'] == 0)) {
            $results[] = 0;
            continue; // Original_course_id_value doesn't exist.
        }

        $t_course_desc = Database::get_course_table(TABLE_COURSE_DESCRIPTION);

        $course_desc_id = Database::escape_string($course_desc_id);
        $course_desc_title = Database::escape_string($course_desc_title);
        $course_desc_content = Database::escape_string($course_desc_content);

        $course_desc_id = (int)$course_desc_id;
        if ($course_desc_id > 8 && $course_desc_id < 1) {
            $results[] = 0; // course_desc_id invalid.
            continue;
        }

        // Check whether data already exits into course_description table.
        $sql_check_id = "SELECT * FROM $t_course_desc
                        WHERE c_id = {$courseInfo['real_id']} AND id ='$course_desc_id'";
        $res_check_id = Database::query($sql_check_id);

        if (Database::num_rows($res_check_id) > 0) {
            $sql = "UPDATE $t_course_desc SET
                    title = '$course_desc_title',
                    content = '$course_desc_content'
                    WHERE
                        c_id = {$courseInfo['real_id']} AND
                        id = '".$course_desc_id."'";
            Database::query($sql);
        } else {
            $sql = "INSERT IGNORE INTO $t_course_desc SET
                    c_id = {$courseInfo['real_id']},
                    id = '".$course_desc_id."',
                    title = '$course_desc_title',
                    content = '$course_desc_content'";
            Database::query($sql);
        }

        $results[] = 1;

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSDeleteCourse function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'deleteCourseParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'deleteCourseParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:deleteCourseParams[]')),
    'tns:deleteCourseParams'
);

// Register the data structures used by the service.
$server->wsdl->addComplexType(
    'deleteCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'courses' => array('name' => 'courses', 'type' => 'tns:deleteCourseParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array.
$server->wsdl->addComplexType(
    'result_deleteCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_deleteCourse',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_deleteCourse[]')),
    'tns:result_deleteCourse'
);

$server->register('WSDeleteCourse',                // method name
    array('deleteCourse' => 'tns:deleteCourse'),   // input parameters
    array('return' => 'tns:results_deleteCourse'), // output parameters
    'urn:WSRegistration',                          // namespace
    'urn:WSRegistration#WSDeleteCourse',           // soapaction
    'rpc',                                         // style
    'encoded',                                     // use
    'This service deletes a course '               // documentation
);


// Define the method WSDeleteCourse
function WSDeleteCourse($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $table_course = Database :: get_main_table(TABLE_MAIN_COURSE);
    $courses_params = $params['courses'];
    $results = array();
    $orig_course_id_value = array();

    foreach ($courses_params as $course_param) {

        $original_course_id_value = $course_param['original_course_id_value'];
        $original_course_id_name = $course_param['original_course_id_name'];
        $orig_course_id_value[] = $original_course_id_value;

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        if (empty($courseInfo) || (isset($courseInfo) && $courseInfo['visibility'] == 0)) {
            $results[] = 0;
            continue; // Original_course_id_value doesn't exist.
        }

        $courseId = $courseInfo['real_id'];
        $sql = "UPDATE $table_course SET visibility = '0' WHERE id = '$courseId'";
        $return = Database::query($sql);
        $results[] = $return;
    }

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSCreateSession function */
// Register data structures used by the service.
$server->wsdl->addComplexType(
    'createSessionParam',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'name' => array('name' => 'name', 'type' => 'xsd:string'),
        'year_start' => array('name' => 'year_start', 'type' => 'xsd:string'),
        'month_start' => array('name' => 'month_start', 'type' => 'xsd:string'),
        'day_start' => array('name' => 'day_start', 'type' => 'xsd:string'),
        'year_end' => array('name' => 'year_end', 'type' => 'xsd:string'),
        'month_end' => array('name' => 'month_end', 'type' => 'xsd:string'),
        'day_end' => array('name' => 'day_end', 'type' => 'xsd:string'),
        'nb_days_access_before' => array('name' => 'nb_days_access_before', 'type' => 'xsd:string'),
        'nb_days_access_after' => array('name' => 'nb_days_access_after', 'type' => 'xsd:string'),
        'nolimit' => array('name' => 'nolimit', 'type' => 'xsd:string'),
        'user_id' => array('name' => 'user_id', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'createSessionParamList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:createSessionParam[]')),
    'tns:createSessionParamList'
);

// Register the data structures used by the service
$server->wsdl->addComplexType(
    'createSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'sessions' => array('name' => 'sessions', 'type' => 'tns:createSessionParamList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_createSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_createSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_createSession[]')),
    'tns:result_createSession'
);

// Register the method to expose
$server->register('WSCreateSession',                // method name
    array('createSession' => 'tns:createSession'),  // input parameters
    array('return' => 'tns:results_createSession'), // output parameters
    'urn:WSRegistration',                           // namespace
    'urn:WSRegistration#WSCreateSession',           // soapaction
    'rpc',                                          // style
    'encoded',                                      // use
    'This service edits a session'                  // documentation
);


// define the method WSCreateSession
function WSCreateSession($params)
{
    global $debug;
    $sessionAdminId = 1;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $tbl_session = Database::get_main_table(TABLE_MAIN_SESSION);
    error_log(print_r($params, 1));

    $sessions_params = $params['sessions'];
    $results = array();
    $orig_session_id_value = array();

    foreach ($sessions_params as $session_param) {

        $name = trim($session_param['name']);
        $year_start = intval($session_param['year_start']);
        $month_start = intval($session_param['month_start']);
        $day_start = intval($session_param['day_start']);
        $year_end = intval($session_param['year_end']);
        $month_end = intval($session_param['month_end']);
        $day_end = intval($session_param['day_end']);
        $nb_days_access_before = intval($session_param['nb_days_access_before']);
        $nb_days_access_after = intval($session_param['nb_days_access_after']);
        $id_coach = $session_param['user_id'];
        $nolimit = $session_param['nolimit'];
        $original_session_id_name = $session_param['original_session_id_name'];
        $original_session_id_value = $session_param['original_session_id_value'];
        $orig_session_id_value[] = $session_param['original_session_id_value'];
        $extra_list = isset($session_param['extra']) ? $session_param['extra'] : '';

        $sessionId = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (!empty($sessionId)) {
            if ($debug) {
                error_log("session with external session id '$original_session_id_value' with '$name' exists");
            }
            $results[] = 0;
            continue;
        }

        if (empty($nolimit)) {
            $date_start = "$year_start-".(($month_start < 10)?"0$month_start":$month_start)."-".(($day_start < 10)?"0$day_start":$day_start) . ' 00:00:00';
            $date_end = "$year_end-".(($month_end < 10)?"0$month_end":$month_end)."-".(($day_end < 10)?"0$day_end":$day_end) . ' 23:59:59';
        } else {
            $date_start = "";
            $date_end = "";
        }

        if (empty($name)) {
            if ($debug) {
                error_log("session has no name");
            }
            $results[] = 0;
            continue;
        } elseif (empty($nolimit) && (!$month_start || !$day_start || !$year_start || !checkdate($month_start, $day_start, $year_start))) {
            if ($debug) {
                error_log("There's an error with the start date: $month_start - $day_start - $year_start");
            }
            $results[] = 0;
            continue;
        } elseif (empty($nolimit) && (!$month_end || !$day_end || !$year_end || !checkdate($month_end,  $day_end, $year_end))) {
            $results[] = 0;
            if ($debug) {
                error_log("There's an error with the end date: $month_end - $day_end - $year_end");
            }
            continue;
        } elseif (empty($nolimit) && $date_start >= $date_end) {
            $results[] = 0;
            if ($debug) {
                error_log("There's an error with the start and end date");
            }
            continue;
        } else {
            $rs = Database::query("SELECT 1 FROM $tbl_session WHERE name='".addslashes($name)."'");
            if (Database::num_rows($rs)) {
                if ($debug) {
                    error_log("Session with name '$name' already exists");
                }
                $results[] = 0;
                continue;
            } else {
                $coachStartDate = '';
                if ($date_start) {
                    $startDate = new DateTime($date_start);
                    $diffStart = new DateInterval("P".$nb_days_access_before."D");
                    $coachStartDate = $startDate->sub($diffStart);
                    $coachStartDate = $coachStartDate->format('Y-m-d H:i:s');
                }
                $coachEndDate = '';
                if ($date_end) {
                    $endDate = new DateTime($date_end);
                    $diffEnd = new DateInterval("P".$nb_days_access_after."D");
                    $coachEndDate = $endDate->add($diffEnd);
                    $coachEndDate = $coachEndDate->format('Y-m-d H:i:s');
                }
                $id_session = SessionManager::create_session(
                    $name,
                    $date_start,
                    $date_end,
                    $date_start,
                    $date_end,
                    $coachStartDate,
                    $coachEndDate,
                    $id_coach,
                    0,
                    1,
                    false,
                    null,
                    null,
                    0,
                    array(),
                    $sessionAdminId
                );

                if ($id_session) {

                    if ($debug) {
                        error_log("Session created '$id_session' ");
                    }
                    // Save new fieldlabel into course_field table.
                    SessionManager::create_session_extra_field(
                        $original_session_id_name,
                        1,
                        $original_session_id_name
                    );

                    // Save the external system's id into user_field_value table.
                    SessionManager::update_session_extra_field_value(
                        $id_session,
                        $original_session_id_name,
                        $original_session_id_value
                    );

                    if (is_array($extra_list) && count($extra_list) > 0) {
                        foreach ($extra_list as $extra) {
                            $extra_field_name = $extra['field_name'];
                            $extra_field_value = $extra['field_value'];
                            // Save new fieldlabel into course_field table.
                            SessionManager::create_session_extra_field(
                                $extra_field_name,
                                1,
                                $extra_field_name
                            );
                            // Save the external system's id into course_field_value table.
                            SessionManager::update_session_extra_field_value(
                                $id_session,
                                $extra_field_name,
                                $extra_field_value
                            );
                        }
                    }
                    $results[] = $id_session;
                } else {
                    if ($debug) {
                        error_log("There was an error when trying to save session with name $name");
                    }
                }
            }
        }
    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/* Register WSEditSession function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'editSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'name' => array('name' => 'name', 'type' => 'xsd:string'),
        'year_start' => array('name' => 'year_start', 'type' => 'xsd:string'),
        'month_start' => array('name' => 'month_start', 'type' => 'xsd:string'),
        'day_start' => array('name' => 'day_start', 'type' => 'xsd:string'),
        'year_end' => array('name' => 'year_end', 'type' => 'xsd:string'),
        'month_end' => array('name' => 'month_end', 'type' => 'xsd:string'),
        'day_end' => array('name' => 'day_end', 'type' => 'xsd:string'),
        'nb_days_access_before' => array('name' => 'nb_days_access_before', 'type' => 'xsd:string'),
        'nb_days_access_after' => array('name' => 'nb_days_access_after', 'type' => 'xsd:string'),
        'nolimit' => array('name' => 'nolimit', 'type' => 'xsd:string'),
        'user_id' => array('name' => 'user_id', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:extrasList')
    )
);

$server->wsdl->addComplexType(
    'editSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:editSessionParams[]')),
    'tns:editSessionParams'
);

$server->wsdl->addComplexType(
    'editSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'sessions' => array('name' => 'sessions', 'type' => 'tns:editSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_editSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_editSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_editSession[]')),
    'tns:result_editSession'
);


// Register the method to expose
$server->register('WSEditSession',                // method name
    array('editSession' => 'tns:editSession'),    // input parameters
    array('return' => 'tns:results_editSession'), // output parameters
    'urn:WSRegistration',                         // namespace
    'urn:WSRegistration#WSEditSession',           // soapaction
    'rpc',                                        // style
    'encoded',                                    // use
    'This service edits a session'                // documentation
);

// define the method WSEditSession
function WSEditSession($params)
{
    global $_user;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $tbl_user = Database::get_main_table(TABLE_MAIN_USER);
    $tbl_session = Database::get_main_table(TABLE_MAIN_SESSION);

    $sessions_params = $params['sessions'];
    $results = array();
    $orig_session_id_value = array();

    foreach ($sessions_params as $session_param) {

        $name = trim($session_param['name']);
        $year_start = intval($session_param['year_start']);
        $month_start = intval($session_param['month_start']);
        $day_start = intval($session_param['day_start']);
        $year_end = intval($session_param['year_end']);
        $month_end = intval($session_param['month_end']);
        $day_end = intval($session_param['day_end']);
        $nb_days_access_before = intval($session_param['nb_days_access_before']);
        $nb_days_access_after = intval($session_param['nb_days_access_after']);
        $original_session_id_value = $session_param['original_session_id_value'];
        $original_session_id_name = $session_param['original_session_id_name'];
        $orig_session_id_value[] = $original_session_id_value;
        $coach_username = $session_param['coach_username'];
        $nolimit = $session_param['nolimit'];
        $id_coach = $session_param['user_id'];
        $extra_list = $session_param['extra'];

        $id = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (empty($id)) {
            $results[] = 0;
            continue;
        }

        if (empty($nolimit)) {
            $date_start="$year_start-".(($month_start < 10)?"0$month_start":$month_start)."-".(($day_start < 10)?"0$day_start":$day_start);
            $date_end="$year_end-".(($month_end < 10)?"0$month_end":$month_end)."-".(($day_end < 10)?"0$day_end":$day_end);
        } else {
            $date_start="";
            $date_end="";
        }
        if (empty($name)) {
            $results[] = 0; //SessionNameIsRequired
            continue;
        } elseif (empty($nolimit) && (!$month_start || !$day_start || !$year_start || !checkdate($month_start, $day_start, $year_start))) {
            $results[] = 0; //InvalidStartDate
            continue;
        } elseif (empty($nolimit) && (!$month_end || !$day_end || !$year_end || !checkdate($month_end, $day_end, $year_end))) {
            $results[] = 0; //InvalidEndDate
            continue;
        } elseif (empty($nolimit) && $date_start >= $date_end) {
            $results[] = 0; //StartDateShouldBeBeforeEndDate
            continue;
        } else {
            $coachStartDate = '';
            if ($date_start) {
                $startDate = new DateTime($date_start);
                $diffStart = new DateInterval("P".$nb_days_access_before."D");
                $coachStartDate = $startDate->sub($diffStart);
                $coachStartDate = $coachStartDate->format('Y-m-d H:i:s');
            }
            $coachEndDate = '';
            if ($date_end) {
                $endDate = new DateTime($date_end);
                $diffEnd = new DateInterval("P".$nb_days_access_after."D");
                $coachEndDate = $endDate->add($diffEnd);
                $coachEndDate = $coachEndDate->format('Y-m-d H:i:s');
            }
            $sessionInfo = api_get_session_info($id);

            SessionManager::edit_session(
                $id,
                $name,
                $date_start,
                $date_end,
                $date_start,
                $date_end,
                $coachStartDate,
                $coachEndDate,
                $id_coach,
                $sessionInfo['session_category_id'],
                $sessionInfo['visibility'],
                $sessionInfo['description'],
                $sessionInfo['show_description'],
                $sessionInfo['duration'],
                null,
                $_user['user_id']
            );

            if (is_array($extra_list) && count($extra_list) > 0) {
                foreach ($extra_list as $extra) {
                    $extra_field_name = $extra['field_name'];
                    $extra_field_value = $extra['field_value'];
                    // Save the external system's id into session_field_value table.
                    SessionManager::update_session_extra_field_value(
                        $id,
                        $extra_field_name,
                        $extra_field_value
                    );
                }
            }

            $results[] = 1;
            continue;
        }

    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}



/* Register WSDeleteSession function */
$server->wsdl->addComplexType(
    'deleteSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'deleteSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:deleteSessionParams[]')),
    'tns:deleteSessionParams'
);

// Register the data structures used by the service
$server->wsdl->addComplexType(
    'deleteSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'sessions' => array('name' => 'sessions', 'type' => 'tns:deleteSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_deleteSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_deleteSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_deleteSession[]')),
    'tns:result_deleteSession'
);

$server->register('WSDeleteSession',                // method name
    array('deleteSession' => 'tns:deleteSession'),  // input parameters
    array('return' => 'tns:results_deleteSession'), // output parameters
    'urn:WSRegistration',                           // namespace
    'urn:WSRegistration#WSDeleteSession',           // soapaction
    'rpc',                                          // style
    'encoded',                                      // use
    'This service deletes a session '               // documentation
);

// define the method WSDeleteSession
function WSDeleteSession($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $tbl_session = Database::get_main_table(TABLE_MAIN_SESSION);
    $tbl_session_rel_course = Database::get_main_table(TABLE_MAIN_SESSION_COURSE);
    $tbl_session_rel_course_rel_user = Database::get_main_table(TABLE_MAIN_SESSION_COURSE_USER);
    $tbl_session_rel_user = Database::get_main_table(TABLE_MAIN_SESSION_USER);
    $tbl_user = Database::get_main_table(TABLE_MAIN_USER);

    $session_params = $params['sessions'];
    $results = array();
    $orig_session_id_value = array();

    foreach ($session_params as $session_param) {

        $original_session_id_value = $session_param['original_session_id_value'];
        $original_session_id_name = $session_param['original_session_id_name'];
        $orig_session_id_value[] = $original_session_id_name;

        $idChecked = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (empty($idChecked)) {
            $results[] = 0;
            continue;
        }

        $session_ids[] = $idChecked;

        $sql = "DELETE FROM $tbl_session WHERE id = '$idChecked'";
        Database::query($sql);
        $sql = "DELETE FROM $tbl_session_rel_course WHERE session_id = '$idChecked'";
        Database::query($sql);
        $sql = "DELETE FROM $tbl_session_rel_course_rel_user WHERE session_id = '$idChecked'";
        Database::query($sql);
        $sql = "DELETE FROM $tbl_session_rel_user WHERE session_id = '$idChecked'";
        Database::query($sql);
        $results[] = 1;
        continue;
    }

    $extraFieldValue = new ExtraFieldValue('session');

    //delete from table_session_field_value from a given session_id
    foreach ($session_ids as $session_id) {
        $extraFieldValue->deleteValuesByItem($session_id);
    }

    // Preparing output.
    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}



/** WSSubscribeUserToCourse **/
// Register the data structures used by the service

$server->wsdl->addComplexType(
    'user_course_status',
    'complexType',
    'struct',
    'all',
    '',
    array (
        'course_id' => array('name' => 'course_id', 'type' => 'tns:course_id'),
        'user_id'   => array('name' => 'user_id',   'type' => 'tns:user_id'),
        'status'    => array('name' => 'status',    'type' => 'xsd:int')
    )
);

$server->wsdl->addComplexType(
    'subscribeUserToCourse_arg',
    'complexType',
    'struct',
    'all',
    '',
    array (
        'userscourses'  => array('name' => 'userscourses',  'type' => 'tns:user_course_status_array'), //removed []
        'secret_key'    => array('name' => 'secret_key',    'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'user_course_status_array',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(
        array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:user_course_status[]')
    ),
    'tns:user_course_status'
);


$server->wsdl->addComplexType(
    'subscribeUserToCourse_return',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value'    => array('name' => 'original_user_id_value',    'type' => 'xsd:string'),
        'original_course_id_value'  => array('name' => 'original_course_id_value',  'type' => 'xsd:string'),
        'result'                    => array('name' => 'result',                    'type' => 'xsd:int')
    )
);

$server->wsdl->addComplexType(
    'subscribeUserToCourse_return_global',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:subscribeUserToCourse_return[]')),
    'tns:subscribeUserToCourse_return'
);

// Register the method to expose
$server->register('WSSubscribeUserToCourse',                            // method name
    array('subscribeUserToCourse' => 'tns:subscribeUserToCourse_arg'),  // input parameters
    array('return' => 'tns:subscribeUserToCourse_return_global'),
    'urn:WSRegistration',                                               // namespace
    'urn:WSRegistration#WSSubscribeUserToCourse',                       // soapaction
    'rpc',                                                              // style
    'encoded',                                                          // use
    'This service subscribes a user to a course'                        // documentation
);

// define the method WSSubscribeUserToCourse
function WSSubscribeUserToCourse($params) {
    global $debug;
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    if ($debug) error_log('WSSubscribeUserToCourse params: '.print_r($params,1));

    $results = array();
    $userscourses = $params['userscourses'];
    foreach ($userscourses as $usercourse) {
        $original_course_id = $usercourse['course_id'];
        $original_user_id   = $usercourse['user_id'];
        $status = STUDENT;
        if ($usercourse['status']) {
            $status = $usercourse['status'];
        }

        $resultValue = 0;

        // Get user id
        $user_id = UserManager::get_user_id_from_original_id(
            $original_user_id['original_user_id_value'],
            $original_user_id['original_user_id_name']
        );
        if ($debug) error_log('WSSubscribeUserToCourse user_id: '.$user_id);

        if ($user_id == 0) {
            // If user was not found, there was a problem
            $resultValue = 0;
        } else {
            // User was found
            $courseInfo = CourseManager::getCourseInfoFromOriginalId(
                $original_course_id['original_course_id_value'],
                $original_course_id['original_course_id_name']
            );

            $courseCode = $courseInfo['code'];

            if (empty($courseCode)) {
                // Course was not found
                $resultValue = 0;
            } else {
                if ($debug) error_log('WSSubscribeUserToCourse courseCode: '.$courseCode);
                $result = CourseManager::add_user_to_course($user_id, $courseCode, $status, false);
                if ($result) {
                    $resultValue = 1;
                    if ($debug) error_log('WSSubscribeUserToCourse subscribed');
                } else {
                    if ($debug) error_log('WSSubscribeUserToCourse NOT subscribed: ');
                }
            }
        }

        $results[] = array(
            'original_user_id_value' => $original_user_id['original_user_id_value'],
            'original_course_id_value' => $original_course_id['original_course_id_value'],
            'result' => $resultValue
        );
    }

    return $results;
}


/** WSSubscribeUserToCourse **/
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'subscribeUserToCourseSimple_arg',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course'       => array('name' => 'course',     'type' => 'xsd:string'), //Course string code
        'user_id'      => array('name' => 'user_id',    'type' => 'xsd:string'), //Chamilo user_id
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);


// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'Result',
    'complexType',
    'struct',
    'all',
    '',
    array('message' => array('name' => 'message',    'type' => 'xsd:string'))
);


// Register the method to expose
$server->register('WSSubscribeUserToCourseSimple',                                 // method name
    array('subscribeUserToCourseSimple' => 'tns:subscribeUserToCourseSimple_arg'), // input parameters
    array('return' => 'xsd:string'),                                               // output parameters
    'urn:WSRegistration',                                                          // namespace
    'urn:WSRegistration#WSSubscribeUserToCourseSimple',                            // soapaction
    'rpc',                                                                         // style
    'encoded',                                                                     // use
    'This service subscribes a user to a course in a simple way'                   // documentation
);

// define the method WSSubscribeUserToCourse
function WSSubscribeUserToCourseSimple($params) {
    global $debug;

    if ($debug) error_log('WSSubscribeUserToCourseSimple');
    if ($debug) error_log('Params '. print_r($params, 1));
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $result = array();
    $course_code  = $params['course']; //Course code
    $user_id      = $params['user_id']; //chamilo user id
    $status       = STUDENT;

    // Get user id
    $user_data = api_get_user_info($user_id);

    if (empty($user_data)) {
        // If user was not found, there was a problem
        $result = "User $user_id does not exist";
        if ($debug) error_log($result);
        return $result;
    }
    if (!empty($course_code)) {
        $course_data = CourseManager::get_course_information($course_code);
        if (empty($course_data)) {
            // Course was not found
            $result = "Course $course_code does not exist in the platform ";
            if ($debug) error_log($result);
        } else {
            if ($debug) error_log('Try to register: user_id= '.$user_id.' to course: '.$course_data['code']);
            if (!CourseManager::add_user_to_course($user_id, $course_data['code'], $status)) {
                $result = 'User was not registered possible reasons: User already registered to the course, Course visibility doesnt allow user subscriptions ';
                if ($debug) error_log($result);
            } else {
                if ($debug) error_log('User registered to the course: '.$course_data['code']);
                $result = 1;
            }
        }
    }
    return $result;
}


/*   GetUser    */

$server->wsdl->addComplexType(
    'GetUserArg',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value'      => array('name' => 'original_user_id_value',    'type' => 'xsd:string'),
        'original_user_id_name'       => array('name' => 'original_user_id_name',     'type' => 'xsd:string'),
        'secret_key'                  => array('name' => 'secret_key',                'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'User',
    'complexType',
    'struct',
    'all',
    '',
    array (
        'user_id'      => array('name' => 'user_id',    'type' => 'xsd:string'),
        'firstname'    => array('name' => 'firstname',  'type' => 'xsd:string'),
        'lastname'     => array('name' => 'lastname',   'type' => 'xsd:string'),
    )
);

// Register the method to expose
$server->register('WSGetUser',                   // method name
    array('GetUser' => 'tns:GetUserArg'),        // input parameters
    array('return' => 'tns:User'),               // output parameters
    'urn:WSRegistration',                        // namespace
    'urn:WSRegistration#WSGetUser',              // soapaction
    'rpc',                                       // style
    'encoded',                                   // use
    'This service get user information by id'    // documentation
);

// define the method WSGetUser
function WSGetUser($params) {
    global $debug;
    if ($debug) error_log('WSGetUser');
    if ($debug) error_log('$params: '.print_r($params, 1));

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $result = array();

    // Get user id
    $user_id = UserManager::get_user_id_from_original_id(
        $params['original_user_id_value'],
        $params['original_user_id_name']
    );
    $user_data = api_get_user_info($user_id);

    if (empty($user_data)) {
        // If user was not found, there was a problem
        $result['user_id']    = '';
        $result['firstname']  = '';
        $result['lastname']   = '';
    } else {
        $result['user_id']    = $user_data['user_id'];
        $result['firstname']  = $user_data['firstname'];
        $result['lastname']   = $user_data['lastname'];
    }
    return $result;
}

$server->wsdl->addComplexType(
    'GetUserArgUsername',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'username'      => array('name' => 'username', 'type' => 'xsd:string'),
        'secret_key'    => array('name' => 'secret_key','type' => 'xsd:string')
    )
);
// Register the method to expose
$server->register('WSGetUserFromUsername',                     // method name
    array('GetUserFromUsername' => 'tns:GetUserArgUsername'),  // input params
    array('return' => 'tns:User'),                             // output parameters
    'urn:WSRegistration',                                      // namespace
    'urn:WSRegistration#WSGetUserFromUsername',                // soapaction
    'rpc',                                                     // style
    'encoded',                                                 // use
    'This service get user information by username'            // documentation
);

// define the method WSGetUserFromUsername
function WSGetUserFromUsername($params) {
    global $debug;
    if ($debug) error_log('WSGetUserFromUsername');
    if ($debug) error_log('$params: '.print_r($params, 1));

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $result = array();

    // Get user id
    $user_data = api_get_user_info($params['username']);

    if (empty($user_data)) {
        // If user was not found, there was a problem
        $result['user_id']    = '';
        $result['firstname']  = '';
        $result['lastname']   = '';
    } else {
        $result['user_id']    = $user_data['user_id'];
        $result['firstname']  = $user_data['firstname'];
        $result['lastname']   = $user_data['lastname'];
    }
    return $result;
}

/* Register WSUnsubscribeUserFromCourse function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'unsuscribeUserFromCourseParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values'   => array('name' => 'original_user_id_values',   'type' => 'tns:originalUsersList'),
        'original_user_id_name'     => array('name' => 'original_user_id_name',     'type' => 'xsd:string'),
        'original_course_id_value'  => array('name' => 'original_course_id_value',  'type' => 'xsd:string'),
        'original_course_id_name'   => array('name' => 'original_course_id_name',   'type' => 'xsd:string'),
    )
);

$server->wsdl->addComplexType(
    'unsuscribeUserFromCourseParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:unsuscribeUserFromCourseParams[]')),
    'tns:unsuscribeUserFromCourseParams'
);

$server->wsdl->addComplexType(
    'unsuscribeUserFromCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'userscourses' => array('name' => 'userscourses', 'type' => 'tns:unsuscribeUserFromCourseParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_unsuscribeUserFromCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values' => array('name' => 'original_user_id_values', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_unsuscribeUserFromCourse',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_unsuscribeUserFromCourse[]')),
    'tns:result_unsuscribeUserFromCourse'
);

// Register the method to expose
$server->register('WSUnsubscribeUserFromCourse',                         // method name
    array('unsuscribeUserFromCourse' => 'tns:unsuscribeUserFromCourse'), // input parameters
    array('return' => 'tns:results_unsuscribeUserFromCourse'),           // output parameters
    'urn:WSRegistration',                                                // namespace
    'urn:WSRegistration#WSUnsubscribeUserFromCourse',                    // soapaction
    'rpc',                                                               // style
    'encoded',                                                           // use
    'This service unsubscribes a user from a course'                     // documentation
);

// define the method WSUnsubscribeUserFromCourse
function WSUnsubscribeUserFromCourse($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $user_table = Database::get_main_table(TABLE_MAIN_USER);
    $table_course     = Database :: get_main_table(TABLE_MAIN_COURSE);
    $table_course_user = Database :: get_main_table(TABLE_MAIN_COURSE_USER);

    $userscourses_params = $params['userscourses'];
    $results = array();
    $orig_user_id_value = array();
    $orig_course_id_value = array();
    foreach ($userscourses_params as $usercourse_param) {

        $original_user_id_values     = $usercourse_param['original_user_id_values'];
        $original_user_id_name         = $usercourse_param['original_user_id_name'];
        $original_course_id_value     = $usercourse_param['original_course_id_value'];
        $original_course_id_name     = $usercourse_param['original_course_id_name'];
        $orig_course_id_value[] = $original_course_id_value;

        // Get user id from original user id
        $usersList = array();
        foreach ($original_user_id_values as $key => $row_original_user_id) {
            $user_id = UserManager::get_user_id_from_original_id($original_user_id_values[$key], $original_user_id_name[$key]);
            if ($user_id == 0) {
                continue; // user_id doesn't exist.
            } else {
                $sql = "SELECT user_id FROM $user_table WHERE user_id ='".$user_id."' AND active= '0'";
                $resu = Database::query($sql);
                $r_check_user = Database::fetch_row($resu);
                if (!empty($r_check_user[0])) {
                    continue; // user_id is not active.
                }
            }
            $usersList[] = $user_id;
        }

        $orig_user_id_value[] = implode(',',$usersList);

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        if (empty($courseInfo) ||
            (isset($courseInfo) && $courseInfo['visibility'] == 0)
        ) {
            $results[] = 0;
            continue; // Original_course_id_value doesn't exist.
        }

        $courseId = $courseInfo['real_id'];

        if (count($usersList) == 0) {
            $results[] = 0;
            continue;
        }

        foreach ($usersList as $user_id) {
            $sql = "DELETE FROM $table_course_user
                    WHERE user_id = '$user_id' AND c_id = '".$courseId."'";
            $result = Database::query($sql);
            $return = Database::affected_rows($result);
        }
        $results[] = 1;
        continue;
    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_values' => $orig_user_id_value[$i],
            'original_course_id_value' => $orig_course_id_value[$i],
            'result' => $results[$i]
        );
    }

    return $output;
}

/* Register WSSuscribeUsersToSession function */
$server->wsdl->addComplexType(
    'unSubscribeUserFromCourseSimple',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_course_id_value' => array('name' => 'original_course_id_value', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);


// Register the method to expose
$server->register('WSUnSubscribeUserFromCourseSimple',                         // method name
    array('unSubscribeUserFromCourseSimple' => 'tns:unSubscribeUserFromCourseSimple'), // input parameters
    array('return' => 'tns:result_createUsersPassEncrypt'),           // output parameters
    'urn:WSRegistration',                                                // namespace
    'urn:WSRegistration#WSUnSubscribeUserFromCourseSimple',                    // soapaction
    'rpc',                                                               // style
    'encoded',                                                           // use
    'This service unsubscribe a user from a course'                     // documentation
);
/**
 * @param array $params
 * @return array|null|soap_fault
 */
function WSUnSubscribeUserFromCourseSimple($params)
{
    global $debug;
    error_log('WSUnSubscribeUserFromCourseSimple');
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $original_user_id_value = $params['original_user_id_value'];
    $original_user_id_name = $params['original_user_id_name'];
    $original_course_id_value = $params['original_course_id_value'];
    $original_course_id_name = $params['original_course_id_name'];

    $result = array();
    $result['original_user_id_value'] = $original_user_id_value;
    $result['result'] = 0;

    $user_id = UserManager::get_user_id_from_original_id(
        $original_user_id_value,
        $original_user_id_name
    );

    if ($user_id) {
        if ($debug) {
            error_log("User $original_user_id_value, $original_user_id_name found");
            error_log("Course $original_course_id_value, $original_course_id_name found");
        }

        $courseInfo = CourseManager::getCourseInfoFromOriginalId(
            $original_course_id_value,
            $original_course_id_name
        );

        $courseCode = $courseInfo['code'];

        if (empty($courseCode)) {
            // Course was not found
            if ($debug) {
                error_log("course not found");
            }
        } else {
            if ($debug) {
                error_log("Course $courseCode found");
            }
            CourseManager::unsubscribe_user($user_id, $courseCode, 0);
            $result['result'] = 1;
        }
    } else {
        if ($debug) {
            error_log("User not found");
        }
    }

    return $result;
}

$server->wsdl->addComplexType(
    'subscribeUserToCourseParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values'   => array('name' => 'original_user_id_values',   'type' => 'tns:originalUsersList'),
        'original_user_id_name'     => array('name' => 'original_user_id_name',     'type' => 'xsd:string'),
        'original_course_id_value'  => array('name' => 'original_course_id_value',  'type' => 'xsd:string'),
        'original_course_id_name'   => array('name' => 'original_course_id_value',  'type' => 'xsd:string')
    )
);


// Prepare output params, in this case will return an array.
$server->wsdl->addComplexType(
    'result_subscribeUsersToSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values' => array('name' => 'original_user_id_values', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_subscribeUsersToSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_subscribeUsersToSession[]')),
    'tns:result_subscribeUsersToSession'
);

$server->wsdl->addComplexType(
    'originalUserItem',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_value' => array('name' => 'original_user_id_value', 'type' => 'xsd:string')
    )
);

// Register the data structures used by the service
$server->wsdl->addComplexType(
    'originalUsersList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:originalUserItem[]')),
    'tns:originalUserItem'
);

/* Register WSSuscribeUsersToSession function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'subscribeUsersToSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values' => array('name' => 'original_user_id_values', 'type' => 'tns:originalUsersList'),
        'original_user_id_name' => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'subscribeUsersToSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:subscribeUsersToSessionParams[]')),
    'tns:subscribeUsersToSessionParams'
);

$server->wsdl->addComplexType(
    'subscribeUsersToSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'userssessions' => array('name' => 'userssessions', 'type' => 'tns:subscribeUsersToSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);


// Register the method to expose
$server->register('WSSuscribeUsersToSession',                          // method name
    array('subscribeUsersToSession' => 'tns:subscribeUsersToSession'), // input parameters
    array('return' => 'tns:results_subscribeUsersToSession'),          // output parameters
    'urn:WSRegistration',                                              // namespace
    'urn:WSRegistration#WSSuscribeUsersToSession',                     // soapaction
    'rpc',                                                             // style
    'encoded',                                                         // use
    'This service subscribes a user to a session'                      // documentation
);

// define the method WSSuscribeUsersToSession
function WSSuscribeUsersToSession($params)
{
    global $debug;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $user_table = Database::get_main_table(TABLE_MAIN_USER);
    $userssessions_params = $params['userssessions'];

    if ($debug) {
        error_log('WSSuscribeUsersToSession');
        error_log(print_r($params, 1));

        if (empty($userssessions_params)) {
            error_log('userssessions is empty');
        }
    }

    $results = array();
    $orig_user_id_value = array();
    $orig_session_id_value = array();
    foreach ($userssessions_params as $usersession_params) {
        $original_session_id_value = $usersession_params['original_session_id_value'];
        $original_session_id_name = $usersession_params['original_session_id_name'];
        $original_user_id_name = $usersession_params['original_user_id_name'];
        $original_user_id_values = $usersession_params['original_user_id_values'];
        $orig_session_id_value[] = $original_session_id_value;

        $sessionId = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (empty($sessionId)) {
            $results[] = 0;
            continue;
        }

        foreach ($original_user_id_values as $key => $row_original_user_list) {
            $user_id = UserManager::get_user_id_from_original_id(
                $row_original_user_list['original_user_id_value'],
                $original_user_id_name
            );

            if ($debug) {
                error_log("User to subscribe: $user_id");
            }

            if ($user_id == 0) {
                continue; // user_id doesn't exist.
            } else {
                $sql = "SELECT user_id FROM $user_table
                        WHERE user_id ='".$user_id."' AND active= '0'";
                $resu = Database::query($sql);
                $r_check_user = Database::fetch_row($resu);
                if (!empty($r_check_user[0])) {
                    continue; // user_id is not active.
                }

                SessionManager::suscribe_users_to_session($sessionId, array($user_id), SESSION_VISIBLE_READ_ONLY, false);
                $orig_user_id_value[] = $row_original_user_list['original_user_id_value'];
                $orig_session_id_value[] = $original_session_id_value;
                $results[] = 1;

                if ($debug) error_log("subscribe user:$user_id to session $sessionId");
            }
        }
    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_values' => $orig_user_id_value[$i],
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i]
        );
    }

    return $output;
}

// WSSubscribeUserToSessionSimple

$server->wsdl->addComplexType(
    'subscribeUserToSessionSimple_arg',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'session'    => array('name' => 'session',    'type' => 'xsd:string'), // Session ID
        'user_id'    => array('name' => 'user_id',    'type' => 'xsd:string'), // Chamilo user_id
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);
$server->register('WSSubscribeUserToSessionSimple',                                   // method name
    array('subscribeUserToSessionSimple' => 'tns:subscribeUserToSessionSimple_arg'),  // input parameters
    array('return' => 'xsd:string'),                                                  // output parameters
    'urn:WSRegistration',                                                             // namespace
    'urn:WSRegistration#WSSubscribeUserToSessionSimple',                              // soapaction
    'rpc',                                                                            // style
    'encoded',                                                                        // use
    'This service subscribes a user to a session in a simple way'                     // documentation
);
function WSSubscribeUserToSessionSimple($params) {
    global $debug;

    if ($debug) {
        error_log('WSSubscribeUserToSessionSimple with params=[' . serialize($params). ']');
    }

    // Check security key
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    // Get input parameters
    $session_id = intval($params['session']);  // Session ID
    $user_id    = intval($params['user_id']);  // Chamilo user id

    // Get user id
    $user_data = api_get_user_info($user_id);

    // Prepare answer
    $result = 0;

    if (empty($user_data)) {
        $result = "User {$user_id} does not exist";
        if ($debug) {
            error_log($result);
        }
        return $result;
    }
    if (!empty($session_id) && is_numeric($session_id)) {
        $session_data = api_get_session_info($session_id);
        if (empty($session_data)) {
            $result = "Session {$session_id} does not exist.";
            if ($debug) {
                error_log($result);
            }
        } else {
            SessionManager::suscribe_users_to_session(
                $session_id,
                array($user_id),
                SESSION_VISIBLE_READ_ONLY,
                false
            );
            if ($debug) error_log('User registered to the course: '.$session_id);
            $result = 1;
        }
    }
    return $result;
}

/* Register WSUnsuscribeUsersFromSession function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'unsubscribeUsersFromSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values'   => array('name' => 'original_user_id_values', 'type' => 'tns:originalUsersList'),
        'original_user_id_name'     => array('name' => 'original_user_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'original_session_id_name'  => array('name' => 'original_session_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'unsubscribeUsersFromSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:unsubscribeUsersFromSessionParams[]')),
    'tns:unsubscribeUsersFromSessionParams'
);

$server->wsdl->addComplexType(
    'unsubscribeUsersFromSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'userssessions' => array('name' => 'userssessions', 'type' => 'tns:subscribeUsersToSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_unsubscribeUsersFromSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_values' => array('name' => 'original_user_id_values', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_unsubscribeUsersFromSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_unsubscribeUsersFromSession[]')),
    'tns:result_unsubscribeUsersFromSession'
);

// Register the method to expose
$server->register('WSUnsuscribeUsersFromSession',                              // method name
    array('unsubscribeUsersFromSession' => 'tns:unsubscribeUsersFromSession'), // input parameters
    array('return' => 'tns:results_unsubscribeUsersFromSession'),              // output parameters
    'urn:WSRegistration',                                                      // namespace
    'urn:WSRegistration#WSUnsuscribeUsersFromSession',                         // soapaction
    'rpc',                                                                     // style
    'encoded',                                                                 // use
    'This service unsubscribes a user to a session'                            // documentation
);

// define the method WSUnsuscribeUsersFromSession
function WSUnsuscribeUsersFromSession($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    global $debug;

    if ($debug) {
        error_log('WSUnsuscribeUsersFromSession with params=[' . serialize($params). ']');
    }

    $user_table = Database::get_main_table(TABLE_MAIN_USER);

    $userssessions_params = $params['userssessions'];
    $results = array();
    $orig_user_id_value = array();
    $orig_session_id_value = array();

    foreach ($userssessions_params as $usersession_params) {

        $original_session_id_value = $usersession_params['original_session_id_value'];
        $original_session_id_name = $usersession_params['original_session_id_name'];
        $original_user_id_name = $usersession_params['original_user_id_name'];
        $original_user_id_values = $usersession_params['original_user_id_values'];
        $orig_session_id_value[] = $original_session_id_value;

        $id_session = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (empty($id_session)) {
            $results[] = 0;
            continue;
        }

        foreach ($original_user_id_values as $key => $row_original_user_list) {
            $user_id = UserManager::get_user_id_from_original_id(
                $row_original_user_list['original_user_id_value'],
                $original_user_id_name
            );

            if ($user_id == 0) {
                continue; // user_id doesn't exist.
            } else {
                $sql = "SELECT user_id FROM $user_table
                        WHERE user_id ='".$user_id."' AND active= '0'";
                $resu = Database::query($sql);
                $r_check_user = Database::fetch_row($resu);
                if (!empty($r_check_user[0])) {
                    continue; // user_id is not active.
                }

                SessionManager::unsubscribe_user_from_session(
                    $id_session,
                    $user_id
                );

                $orig_user_id_value[] = $row_original_user_list['original_user_id_value'];
                $orig_session_id_value[] = $original_session_id_value;
                $results[] = 1;

                if ($debug) error_log("Unsubscribe user:$user_id to session:$id_session");
            }
        }
    } // end principal foreach

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_user_id_values' => $orig_user_id_value[$i],
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i]
        );
    }

    return $output;
}

/* Register WSSuscribeCoursesToSession function */
// Register the data structures used by the service

/*$server->wsdl->addComplexType(
'originalCoursesList',
'complexType',
'array',
'',
'SOAP-ENC:Array',
array(),
array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'string[]')),
'xsd:string'
);*/
$server->wsdl->addComplexType(
    'course_code_type',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course_code'   => array('name' => 'course_code',   'type' => 'xsd:string'),
    )
);

$server->wsdl->addComplexType(
    'originalCoursesList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:course_code_type[]')),
    'tns:course_code_type'
);


$server->wsdl->addComplexType(
    'subscribeCoursesToSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:subscribeCoursesToSessionParams[]')),
    'tns:subscribeCoursesToSessionParams'
);


$server->wsdl->addComplexType(
    'subscribeCoursesToSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_values' => array('name' => 'original_course_id_values', 'type' => 'tns:originalCoursesList'),
        'original_course_id_name'   => array('name' => 'original_course_id_name',   'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'original_session_id_name'  => array('name' => 'original_session_id_name',  'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'subscribeCoursesToSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:subscribeCoursesToSessionParams[]')),
    'tns:subscribeCoursesToSessionParams'
);

$server->wsdl->addComplexType(
    'subscribeCoursesToSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'coursessessions' => array('name' => 'coursessessions', 'type' => 'tns:subscribeCoursesToSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_subscribeCoursesToSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_values' => array('name' => 'original_course_id_values', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_subscribeCoursesToSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_subscribeCoursesToSession[]')),
    'tns:result_subscribeCoursesToSession'
);

// Register the method to expose
$server->register('WSSuscribeCoursesToSession',                            // method name
    array('subscribeCoursesToSession' => 'tns:subscribeCoursesToSession'), // input parameters
    array('return' => 'tns:results_subscribeCoursesToSession'),            // output parameters
    'urn:WSRegistration',                                                  // namespace
    'urn:WSRegistration#WSSuscribeCoursesToSession',                       // soapaction
    'rpc',                                                                 // style
    'encoded',                                                             // use
    'This service subscribes a course to a session'                        // documentation
);

// Define the method WSSuscribeCoursesToSession
function WSSuscribeCoursesToSession($params) {
    global $debug;

    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    if ($debug) error_log('WSSuscribeCoursesToSession: '.print_r($params, 1));

    $coursessessions_params = $params['coursessessions'];
    $results = array();
    $orig_course_id_value = array();
    $orig_session_id_value = array();
    foreach ($coursessessions_params as $coursesession_param) {

        $original_session_id_value = $coursesession_param['original_session_id_value'];
        $original_session_id_name = $coursesession_param['original_session_id_name'];
        $original_course_id_name = $coursesession_param['original_course_id_name'];
        $original_course_id_values = $coursesession_param['original_course_id_values'];
        $orig_session_id_value[] = $original_session_id_value;

        $sessionId = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        // Get course list from row_original_course_id_values
        foreach ($original_course_id_values as $row_original_course_list) {
            $courseInfo = CourseManager::getCourseInfoFromOriginalId(
                $row_original_course_list['course_code'],
                $original_course_id_name
            );

            if (empty($courseInfo) ||
                (isset($courseInfo) && $courseInfo['visibility'] == 0)
            ) {
                $results[] = 0;
                continue; // Original_course_id_value doesn't exist.
            } else {
                $courseCode = $courseInfo['code'];
                SessionManager::add_courses_to_session(
                    $sessionId,
                    array($courseInfo['real_id']),
                    false
                );
                if ($debug) error_log("add_courses_to_session: course:$courseCode to session:$sessionId");

                $results[] = 1;
                $orig_course_id_value[] = $original_session_id_value;
                $orig_session_id_value[] = $row_original_course_list['course_code'];
            }
        }
    }

    $count_results = count($results);
    $output = array();
    for ($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_values' => $orig_course_id_value[$i],
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i]
        );
    }

    return $output;
}

/* Register WSUnsuscribeCoursesFromSession function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'unsubscribeCoursesFromSessionParams',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_values' => array('name' => 'original_course_id_values', 'type' => 'tns:originalCoursesList'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'original_session_id_name' => array('name' => 'original_session_id_name', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'unsubscribeCoursesFromSessionParamsList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:unsubscribeCoursesFromSessionParams[]')),
    'tns:unsubscribeCoursesFromSessionParams'
);

$server->wsdl->addComplexType(
    'unsubscribeCoursesFromSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'coursessessions' => array('name' => 'coursessessions', 'type' => 'tns:unsubscribeCoursesFromSessionParamsList'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Prepare output params, in this case will return an array
$server->wsdl->addComplexType(
    'result_unsubscribeCoursesFromSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_course_id_values' => array('name' => 'original_course_id_values', 'type' => 'xsd:string'),
        'original_session_id_value' => array('name' => 'original_session_id_value', 'type' => 'xsd:string'),
        'result' => array('name' => 'result', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'results_unsubscribeCoursesFromSession',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:result_unsubscribeCoursesFromSession[]')),
    'tns:result_unsubscribeCoursesFromSession'
);


// Register the method to expose
$server->register('WSUnsuscribeCoursesFromSession',                                // method name
    array('unsubscribeCoursesFromSession' => 'tns:unsubscribeCoursesFromSession'), // input parameters
    array('return' => 'tns:results_unsubscribeCoursesFromSession'),                // output parameters
    'urn:WSRegistration',                                                          // namespace
    'urn:WSRegistration#WSUnsuscribeCoursesFromSession',                           // soapaction
    'rpc',                                                                         // style
    'encoded',                                                                     // use
    'This service subscribes a course to a session'                                // documentation
);

// define the method WSUnsuscribeCoursesFromSession
function WSUnsuscribeCoursesFromSession($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    // Initialisation
    $tbl_session_rel_course_rel_user = Database::get_main_table(TABLE_MAIN_SESSION_COURSE_USER);
    $tbl_session = Database::get_main_table(TABLE_MAIN_SESSION);
    $tbl_session_rel_course = Database::get_main_table(TABLE_MAIN_SESSION_COURSE);
    $tbl_course = Database::get_main_table(TABLE_MAIN_COURSE);
    $coursessessions_params = $params['coursessessions'];
    $results = array();
    $orig_course_id_value = array();
    $orig_session_id_value = array();

    foreach ($coursessessions_params as $coursesession_param) {

        $original_session_id_value = $coursesession_param['original_session_id_value'];
        $original_session_id_name = $coursesession_param['original_session_id_name'];
        $original_course_id_name = $coursesession_param['original_course_id_name'];
        $original_course_id_values = $coursesession_param['original_course_id_values'];
        $orig_session_id_value[] = $original_session_id_value;

        $id_session = SessionManager::getSessionIdFromOriginalId(
            $original_session_id_value,
            $original_session_id_name
        );

        if (empty($id_session)) {
            $results[] = 0;
            continue;
        }

        // Get courses list from row_original_course_id_values
        $course_list = array();
        $courseIdList = [];
        foreach ($original_course_id_values as $row_original_course_list) {

            $course_code = Database::escape_string($row_original_course_list['course_code']);

            // Check whether exits $x_course_code into user_field_values table.
            $courseInfo = CourseManager::getCourseInfoFromOriginalId(
                $row_original_course_list['course_code'],
                $original_course_id_name
            );

            if (empty($courseInfo) || isset($courseInfo) &&
                $courseInfo['visibility'] == 0
            ) {
                continue; // Course_code doesn't exist'
            }

            $course_list[] = $courseInfo['code'];
            $courseIdList[] = $courseInfo['real_id'];
        }

        if (empty($course_list)) {
            $results[] = 0;
            continue;
        }

        $orig_course_id_value[] = implode(',', $course_list);

        foreach ($courseIdList as $courseId) {
            $courseId = intval($courseId);
            Database::query("DELETE FROM $tbl_session_rel_course
                            WHERE c_id ='$courseId' AND session_id='$id_session'");
            $result = Database::query("DELETE FROM $tbl_session_rel_course_rel_user WHERE c_id='$courseId' AND session_id = '$id_session'");

            Event::addEvent(
                LOG_SESSION_DELETE_COURSE,
                LOG_COURSE_ID,
                $courseId,
                api_get_utc_datetime(),
                api_get_user_id(),
                $courseId,
                $id_session
            );

            $return = Database::affected_rows($result);
        }

        $nbr_courses = 0;
        $sql = "SELECT nbr_courses FROM $tbl_session WHERE id = '$id_session'";
        $res_nbr_courses = Database::query($sql);
        $row_nbr_courses = Database::fetch_row($res_nbr_courses);

        if (Database::num_rows($res_nbr_courses) > 0) {
            $nbr_users = ($row_nbr_courses[0] - $return);
        }

        // Update number of users in the session.
        $update_sql = "UPDATE $tbl_session SET nbr_courses= $nbr_courses WHERE id='$id_session' ";
        Database::query($update_sql);

        $results[] = 1;
        continue;
    }

    $count_results = count($results);
    $output = array();
    for($i = 0; $i < $count_results; $i++) {
        $output[] = array(
            'original_course_id_values' => $orig_course_id_value[$i],
            'original_session_id_value' => $orig_session_id_value[$i],
            'result' => $results[$i],
        );
    }

    return $output;
}

/** WSListCourses **/

$server->wsdl->addComplexType(
    'listCourseInput',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'original_course_id_name' => array('name' => 'original_course_id_name', 'type' => 'xsd:string'),
        'from' => array('name' => 'from', 'type' => 'xsd:int'),
        'to' => array('name' => 'to', 'type' => 'xsd:int')
    )
);

$server->wsdl->addComplexType(
    'course',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'id' => array('name' => 'id', 'type' => 'xsd:int'),
        'code' => array('name' => 'code', 'type' => 'xsd:string'),
        'external_course_id' => array('name' => 'external_course_id', 'type' => 'xsd:string'),
        'title' => array('name' => 'title', 'type' => 'xsd:string'),
        'language' => array('name' => 'language', 'type' => 'xsd:string'),
        'category_name' => array('name' => 'category_name', 'type' => 'xsd:string'),
        'visibility' => array('name' => 'visibility', 'type' => 'xsd:int'),
        'number_students' => array('name' => 'number_students', 'type' => 'xsd:int')
    )
);

$server->wsdl->addComplexType(
    'courses',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:course[]')),
    'tns:course'
);


// Register the method to expose
$server->register('WSListCourses',                                                  // method name
    array('listCourseInput' => 'tns:listCourseInput'), // input parameters
    array('return' => 'tns:courses'),                                               // output parameters
    'urn:WSRegistration',                                                           // namespace
    'urn:WSRegistration#WSListCourses',                                             // soapaction
    'rpc',                                                                          // style
    'encoded',                                                                      // use
    'This service list courses available on the system'                             // documentation
);

// define the method WSListCourses
function WSListCourses($params)
{
    global $debug;
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $course_field_name = isset($params['original_course_id_name']) ? $params['original_course_id_name'] : '';

    $courses_result = array();
    $category_names = array();

    $from = isset($params['from']) ? $params['from'] : null;
    $to = isset($params['to']) ? $params['to'] : null;

    if ($debug) {
        error_log(print_r($params, 1));
        error_log($from);
        error_log($to);
    }

    $courses = CourseManager::get_courses_list($from, $to);

    foreach ($courses as $course) {
        $course_tmp = array();
        $course_tmp['id'] = $course['id'];
        $course_tmp['code'] = $course['code'];
        $course_tmp['title'] = $course['title'];
        $course_tmp['language'] = $course['course_language'];
        $course_tmp['visibility'] = $course['visibility'];
        $course_tmp['category_name'] = '';

        // Determining category name
        if (!empty($course['category_code']) &&
            isset($category_names[$course['category_code']])
        ) {
            $course_tmp['category_name'] = $category_names[$course['category_code']];
        } else {
            $category = CourseManager::get_course_category($course['category_code']);
            if ($category) {
                $category_names[$course['category_code']] = $category['name'];
                $course_tmp['category_name'] = $category['name'];
            }
        }

        // Determining number of students registered in course
        $course_tmp['number_students'] = CourseManager::get_users_count_in_course(
            $course['code']
        );

        // Determining external course id
        $externalCourseId = '';
        if ($course_field_name) {
            $externalCourseId = CourseManager::get_course_extra_field_value(
                $course_field_name,
                $course['code']
            );
        }

        $course_tmp['external_course_id'] = $externalCourseId;
        $courses_result[] = $course_tmp;
    }

    return $courses_result;
}


/* Get user api key */
$server->wsdl->addComplexType(
    'userApiKey',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'original_user_id_name'     => array('name' => 'original_user_id_name',     'type' => 'xsd:string'),
        'original_user_id_value'    => array('name' => 'original_user_id_value',    'type' => 'xsd:string'),
        'chamilo_username'          => array('name' => 'chamilo_username',          'type' => 'xsd:string'),
        'secret_key'                => array('name' => 'secret_key',                'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSUpdateUserApiKey',      // method name
    array('userApiKey' => 'tns:userApiKey'), // input parameters
    array('return' => 'xsd:string'),         // output parameters
    'urn:WSRegistration',                    // namespace
    'urn:WSRegistration#WSListCourses',      // soapaction
    'rpc',                                   // style
    'encoded',                               // use
    'This service return user api key'       // documentation
);


function WSUpdateUserApiKey($params) {
    if(!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $user_id = UserManager::get_user_id_from_original_id($params['original_user_id_value'], $params['original_user_id_name']);
    if (!$user_id) {
        if (!empty($params['chamilo_username'])) {
            $info = api_get_user_info_from_username($params['chamilo_username']);
            $user_id = $info['user_id'];
            // Save new fieldlabel into user_field table.
            UserManager::create_extra_field($params['original_user_id_name'], 1, $params['original_user_id_name'], '');
            // Save the external system's id into user_field_value table.
            UserManager::update_extra_field_value($user_id, $params['original_user_id_name'], $params['original_user_id_value']);
        }
        else {
            return 0;
        }
    }

    $list = UserManager::get_api_keys($user_id);
    $key_id = UserManager::get_api_key_id($user_id, 'dokeos');

    if (isset($list[$key_id])) {
        $apikey = $list[$key_id];
    } else {
        $lastid = UserManager::update_api_key($user_id, 'dokeos');
        if ($lastid) {
            $apikeys = UserManager::get_api_keys($user_id);
            $apikey = $apikeys[$lastid];
        }
    }
    return $apikey;
}

/** WSListSessions **/
$server->wsdl->addComplexType(
    'session_arg',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'from'  => array('name' => 'from',  'type' => 'xsd:int'),
        'to'    => array('name' => 'to',    'type' => 'xsd:int'),
        'date_start'  => array('name' => 'date_start',  'type' => 'xsd:string'),
        'date_end'    => array('name' => 'date_end',    'type' => 'xsd:string'),
        'secret_key'  => array('name' => 'secret_key',  'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'session',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'id' => array ('name' => 'id'  , 'type' => 'xsd:int'),
        'title' => array ('name' => 'title', 'type' => 'xsd:string'),
        'url' => array ('name' => 'url', 'type' => 'xsd:string'),
        'date_start' => array ('name' => 'date_start', 'type' => 'xsd:string'),
        'date_end' => array ('name' => 'date_end', 'type' => 'xsd:string'),
    )
);

$server->wsdl->addComplexType(
    'sessions',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(
        array('ref'=>'SOAP-ENC:arrayType',
            'wsdl:arrayType'=>'tns:session[]')
    ),
    'tns:session'
);

// Register the method to expose
$server->register('WSListSessions',           // method name
    array('input'  => 'tns:session_arg'),     // input parameters
    array('return' => 'tns:sessions'),        // output parameters
    'urn:WSRegistration',                     // namespace
    'urn:WSRegistration#WSListSessions',      // soapaction
    'rpc',                                    // style
    'encoded',                                // use
    'This service returns a list of sessions' // documentation
);


/**
 * Get a list of sessions (id, title, url, date_start, date_end) and
 * return to caller. Date start can be set to ask only for the sessions
 * starting at or after this date. Date end can be set to ask only for the
 * sessions ending before or at this date.
 * Function registered as service. Returns strings in UTF-8.
 * @param array List of parameters (security key, date_start and date_end)
 * @return array Sessions list (id=>[title=>'title',url='http://...',date_start=>'...',date_end=>''])
 */
function WSListSessions($params)
{
    if (!WSHelperVerifyKey($params)) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $sql_params = array();
    // Dates should be provided in YYYY-MM-DD format, UTC
    if (!empty($params['date_start'])) {
        $sql_params['s.access_start_date'] = array('operator' => '>=', 'value' => $params['date_start']);
    }
    if (!empty($params['date_end'])) {
        $sql_params['s.access_end_date'] = array('operator' => '<=', 'value' => $params['date_end']);
    }
    $from = isset($params['from']) ? $params['from'] : null;
    $to = isset($params['to']) ? $params['to'] : null;

    $sessions_list = SessionManager::get_sessions_list($sql_params, null, $from, $to);
    $return_list = array();
    foreach ($sessions_list as $session) {
        $return_list[] = array(
            'id' => $session['id'],
            'title' => $session['name'],
            'url' => api_get_path(WEB_CODE_PATH).'session/index.php?session_id='.$session['id'], // something like http://my.chamilo.net/main/session/index.php?session_id=5
            'date_start' => $session['access_start_date'],
            'date_end' => $session['access_end_date'],
        );
    }

    return $return_list;
}

/* Register WSUserSubscribedInCourse function */
// Register the data structures used by the service

//prepare input params

// Input params for editing users
$server->wsdl->addComplexType(
    'UserSubscribedInCourse',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'course'       => array('name' => 'course',     'type' => 'xsd:string'), //Course string code
        'user_id'      => array('name' => 'user_id',    'type' => 'xsd:string'), //Chamilo user_id
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSUserSubscribedInCourse',                            // method name
    array('UserSubscribedInCourse' => 'tns:UserSubscribedInCourse'),    // input parameters
    array('return' => 'xsd:string'),                                        // output parameters
    'urn:WSRegistration',                                                    // namespace
    'urn:WSRegistration#WSUserSubscribedInCourse',                       // soapaction
    'rpc',                                                                    // style
    'encoded',                                                                // use
    'This service checks if user assigned to course'    // documentation
);

/**
 * Web service to tell if a given user is subscribed to the course
 * @param array $params Array of parameters (course and user_id)
 * @return bool|null|soap_fault A simple boolean (true if user is subscribed, false otherwise)
 */
function WSUserSubscribedInCourse($params)
{
    global $debug;

    if ($debug) error_log('WSUserSubscribedInCourse');
    if ($debug) error_log('Params '. print_r($params, 1));
    if (!WSHelperVerifyKey($params)) {

        return returnError(WS_ERROR_SECRET_KEY);
    }
    $courseCode  = $params['course']; //Course code
    $userId      = $params['user_id']; //chamilo user id

    return (CourseManager::is_user_subscribed_in_course($userId,$courseCode));
}


/* Search session Web Service start */

// Input params for WSSearchSession
$server->wsdl->addComplexType(
    'SearchSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'term' => array('name' => 'term', 'type' => 'xsd:string'),
        'extrafields' => array('name' => 'extrafields', 'type' => 'xsd:string'),
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

//Output params for WSSearchSession
$server->wsdl->addComplexType(
    'searchedSessionExtra',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'variable' => array('name'=>'variable','type'=>'xsd:string'),
        'value' => array('name'=>'value','type'=>'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'searchedSessionExtras',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(
        array('ref' => 'SOAP-ENC:arrayType', 'wsdl:arrayType' => 'tns:searchedSessionExtra[]')
    ),
    'tns:searchedSessionExtra'
);

$server->wsdl->addComplexType(
    'searchedSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'id' => array('name' => 'id', 'type' => 'xsd:int'),
        'id_coach' => array('name' => 'id_coach', 'type' => 'xsd:int'),
        'name' => array('name' => 'name', 'type' => 'xsd:string'),
        'nbr_courses' => array('name' => 'nbr_courses', 'type' => 'xsd:int'),
        'nbr_users' => array('name' => 'nbr_users', 'type' => 'xsd:int'),
        'nbr_classes' => array('name' => 'nbr_classes', 'type' => 'xsd:int'),
        'date_start' => array('name' => 'date_start', 'type' => 'xsd:string'),
        'date_end' => array('name' => 'date_end', 'type' => 'xsd:string'),
        'nb_days_access_before_beginning' => array('name' => 'nb_days_access_before_beginning', 'type' => 'xsd:int'),
        'nb_days_access_after_end' => array('nb_days_access_after_end' => 'duration', 'type' => 'xsd:int'),
        'session_admin_id' => array('session_admin_id' => 'duration', 'type' => 'xsd:int'),
        'visibility' => array('visibility' => 'duration', 'type' => 'xsd:int'),
        'session_category_id' => array('session_category_id' => 'duration', 'type' => 'xsd:int'),
        'promotion_id' => array('promotion_id' => 'duration', 'type' => 'xsd:int'),
        'description' => array('name' => 'description', 'type' => 'xsd:string'),
        'show_description' => array('name' => 'description', 'type' => 'xsd:int'),
        'duration' => array('name' => 'duration', 'type' => 'xsd:string'),
        'extra' => array('name' => 'extra', 'type' => 'tns:searchedSessionExtras'),
    )
);

$server->wsdl->addComplexType(
    'searchedSessionList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(
        array('ref' => 'SOAP-ENC:arrayType',
            'wsdl:arrayType' => 'tns:searchedSession[]')
    ),
    'tns:searchedSession'
);

//Reister WSSearchSession
$server->register(
    'WSSearchSession',
    array('SearchSession' => 'tns:SearchSession'),      // input parameters
    array('return' => 'tns:searchedSessionList'),       // output parameters
    'urn:WSRegistration',                               // namespace
    'urn:WSRegistration#WSSearchSession',               // soapaction
    'rpc',                                              // style
    'encoded',                                          // use
    'This service to get a session list filtered by name, description or short description extra field'    // documentation
);

/**
 * Web service to get a session list filtered by name, description or short description extra field
 * @param array $params Contains the following parameters
 *   string $params['term'] Search term
 *   string $params['extra_fields'] Extrafields to include in request result
 *   string $params['secret_key'] Secret key to check
 * @return array The list
 */
function WSSearchSession($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $fieldsToInclude = array();

    if (!empty($params['extrafields'])) {
        $fieldsToInclude = explode(',', $params['extrafields']);
        foreach ($fieldsToInclude as &$field) {
            if (empty($field)) {
                continue;
            }

            $field = trim($field);
        }
    }

    return SessionManager::searchSession($params['term'], $fieldsToInclude);
}

/* Search session Web Service end */

/* Fetch session Web Service start */

// Input params for WSFetchSession
$server->wsdl->addComplexType(
    'FetchSession',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'id' => array('name' => 'id', 'type' => 'xsd:int'),
        'extrafields' => array('name' => 'extrafields', 'type' => 'xsd:string'),
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string')
    )
);

//Reister WSFetchSession
$server->register(
    'WSFetchSession',
    array('SearchSession' => 'tns:FetchSession'),                    // input parameters
    array('return' => 'tns:searchedSessionList'),       // output parameters
    'urn:WSRegistration',                               // namespace
    'urn:WSRegistration#WSFetchSession',                // soapaction
    'rpc',                                              // style
    'encoded',                                          // use
    'This service get a session by its id. Optionally can get its extra fields values'    // documentation
);

/**
 * Web service to get a session by its id. Optionally can get its extra fields values
 * @param array $params Contains the following parameters:
 *   int $params['id'] The session id
 *   string $params['extrafields'] Extrafields to include in request result
 *   string $params['secret_key'] Secret key to check
 * @return array The session data
 */
function WSFetchSession($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $fieldsToInclude = explode(',', $params['extrafields']);

    foreach ($fieldsToInclude as &$field) {
        if (empty($field)) {
            continue;
        }

        $field = trim($field);
    }

    $sessionData = SessionManager::fetch($params['id']);

    if ($sessionData === false) {
        return returnError(WS_ERROR_INVALID_INPUT);
    }

    if (!empty($extraFields)) {
        $sessionData['extra'] = SessionManager::getFilteredExtraFields($params['id'], $fieldsToInclude);
    }

    return array($sessionData);
}

/* Fetch session Web Service end */

/* Register WSCertificatesList function */
// Register the data structures used by the service
$server->wsdl->addComplexType(
    'certificateDetails',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'id' => array('name' => 'id', 'type' => 'xsd:int'),
        'username' => array('name' => 'username', 'type' => 'xsd:string'),
        'course_code' => array('name' => 'course_code', 'type' => 'xsd:string'),
        'session_id' => array('name' => 'session_id', 'type' => 'xsd:int'),
        'cat_id' => array('name' => 'cat_id', 'type' => 'xsd:int'),
        'created_at' => array('name' => 'created_at', 'type' => 'xsd:string'),
        'path_certificate' => array('name' => 'path_certificate', 'type' => 'xsd:string')
    )
);

$server->wsdl->addComplexType(
    'certificatesList',
    'complexType',
    'array',
    '',
    'SOAP-ENC:Array',
    array(),
    array(
        array('ref'=>'SOAP-ENC:arrayType',
            'wsdl:arrayType'=>'tns:certificateDetails[]')
    ),
    'tns:certificateDetails'
);
// Register the method to expose
$server->register(
    'WSCertificatesList',                           // method name
    array(
        'startingDate' => 'xsd:string',             // input parameters
        'endingDate' => 'xsd:string'
    ),
    array('return' => 'tns:certificatesList'),      // output parameters
    'urn:WSRegistration',                           // namespace
    'urn:WSRegistration#WSCertificatesList',        // soapaction
    'rpc',                                          // style
    'encoded',                                      // use
    'This service returns a list of certificates'   // documentation
);

function WSCertificatesList($startingDate = '', $endingDate = '')
{
    global $_configuration;
    $certificatesCron = api_get_setting('add_gradebook_certificates_cron_task_enabled');
    if ($certificatesCron === 'true') {
        require_once api_get_path(SYS_CODE_PATH).'cron/add_gradebook_certificates.php';
    }
    $result = array();
    $certificateTable = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CERTIFICATE);
    $userTable = Database::get_main_table(TABLE_MAIN_USER);
    $categoryTable = Database::get_main_table(TABLE_MAIN_GRADEBOOK_CATEGORY);

    $query = "SELECT
                    certificate.id,
                    user.username,
                    category.course_code,
                    category.session_id,
                    certificate.user_id,
                    certificate.cat_id,
                    certificate.created_at,
                    certificate.path_certificate
                FROM $certificateTable AS certificate
                JOIN $userTable AS user
                ON certificate.user_id = user.user_id
                JOIN $categoryTable AS category
                ON certificate.cat_id = category.id";

    if (!empty($startingDate) && !empty($endingDate)) {
        $query .= " WHERE certificate.created_at BETWEEN '$startingDate' AND '$endingDate'";
    } else if (!empty($startingDate)) {
        $query .= " WHERE certificate.created_at >= '$startingDate'";
    } else if (!empty($endingDate)) {
        $query .= " WHERE certificate.created_at <= '$endingDate'";
    }

    $queryResult = Database::query($query);
    while ($row = Database::fetch_array($queryResult)) {
        $userPath = USermanager::getUserPathById($row['user_id'], 'web');
        $row['path_certificate'] = $userPath.'/certificate'.$row['path_certificate'];
        $result[] = $row;
    }

    return $result;
}

/* Create group Web Service start */
// Register the data structures used by the service

// Input params for WSCreateGroup
$server->wsdl->addComplexType(
    'createGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key' => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'name' => array('name' => 'name', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSCreateGroup',              // method name
    array('createGroup' => 'tns:createGroup'),  // input parameters
    array('return' => 'xsd:string'),            // output parameters
    'urn:WSRegistration',                       // namespace
    'urn:WSRegistration#WSCreateGroup',         // soapaction
    'rpc',                                      // style
    'encoded',                                  // use
    'This service adds a group'                 // documentation
);

// Define the method WSCreateGroup
function WSCreateGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();
    $params = [
        'name' => $params['name']
    ];
    return $userGroup->save($params);
    //return GroupPortalManager::add($params['name'], null, null, 1);
}

/* Create group Web Service end */

/* Update group Web Service start */
// Register the data structures used by the service

// Input params for WSUpdateGroup
$server->wsdl->addComplexType(
    'updateGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'id' => array('name' => 'id', 'type' => 'xsd:string'),
        'name' => array('name' => 'name', 'type' => 'xsd:string'),
        'description'   => array('name' => 'description', 'type' => 'xsd:string'),
        'url' => array('name' => 'url', 'type' => 'xsd:string'),
        'visibility' => array('name' => 'visibility', 'type' => 'xsd:string'),
        'picture_uri' => array('name' => 'picture_uri', 'type' => 'xsd:string'),
        'allow_member_group_to_leave' => array('name' => 'allow_member_group_to_leave', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSUpdateGroup',              // method name
    array('updateGroup' => 'tns:updateGroup'),  // input parameters
    array('return' => 'xsd:string'),            // output parameters
    'urn:WSRegistration',                       // namespace
    'urn:WSRegistration#WSUpdateGroup',         // soapaction
    'rpc',                                      // style
    'encoded',                                  // use
    'This service updates a group'              // documentation
);

// Define the method WSUpdateGroup
function WSUpdateGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $params['allow_member_group_to_leave'] = null;

    $userGroup = new UserGroup();
    return $userGroup->update($params);

    /*return GroupPortalManager::update(
        $params['id'],
        $params['name'],
        $params['description'],
        $params['url'],
        $params['visibility'],
        $params['picture_uri'],
        $params['allow_member_group_to_leave']
    );*/
}

/* Update group Web Service end */

/* Delete group Web Service start */
// Register the data structures used by the service

// Input params for WSDeleteGroup
$server->wsdl->addComplexType(
    'deleteGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'id' => array('name' => 'id', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSDeleteGroup',              // method name
    array('deleteGroup' => 'tns:deleteGroup'),  // input parameters
    array('return' => 'xsd:string'),            // output parameters
    'urn:WSRegistration',                       // namespace
    'urn:WSRegistration#WSDeleteGroup',         // soapaction
    'rpc',                                      // style
    'encoded',                                  // use
    'This service deletes a group'              // documentation
);

// Define the method WSDeleteGroup
function WSDeleteGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();

    return $userGroup->delete($params['id']);

    //return GroupPortalManager::delete($params['id']);
}

/* Delete group Web Service end */

/* Bind group to parent Web Service start */
// Register the data structures used by the service

// Input params for GroupBindToParent
$server->wsdl->addComplexType(
    'groupBindToParent',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'id' => array('name' => 'id', 'type' => 'xsd:string'),
        'parent_id' => array('name' => 'parent_id', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('GroupBindToParent',                      // method name
    array('groupBindToParent' => 'tns:groupBindToParent'),  // input parameters
    array('return' => 'xsd:string'),                        // output parameters
    'urn:WSRegistration',                                   // namespace
    'urn:WSRegistration#GroupBindToParent',                 // soapaction
    'rpc',                                                  // style
    'encoded',                                              // use
    'This service binds a group to a parent'                // documentation
);

// Define the method GroupBindToParent
function GroupBindToParent($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();

    return $userGroup->set_parent_group($params['id'], $params['parent_id']);

    //return GroupPortalManager::set_parent_group($params['id'], $params['parent_id']);
}

/* Bind group Web Service end */

/* Unbind group from parent Web Service start */
// Register the data structures used by the service

// Input params for GroupUnbindFromParent
$server->wsdl->addComplexType(
    'groupUnbindFromParent',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'id' => array('name' => 'id', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('GroupUnbindFromParent',                          // method name
    array('groupUnbindFromParent' => 'tns:groupUnbindFromParent'),  // input parameters
    array('return' => 'xsd:string'),                                // output parameters
    'urn:WSRegistration',                                           // namespace
    'urn:WSRegistration#GroupUnbindFromParent',                     // soapaction
    'rpc',                                                          // style
    'encoded',                                                      // use
    'This service unbinds a group from its parent'                  // documentation
);

// Define the method GroupUnbindFromParent
function GroupUnbindFromParent($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();
    return $userGroup->set_parent_group($params['id'], 0);
}

/* Unbind group Web Service end */

/* Add user to group Web Service start */
// Register the data structures used by the service

// Input params for WSAddUserToGroup
$server->wsdl->addComplexType(
    'addUserToGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'user_id' => array('name' => 'user_id', 'type' => 'xsd:string'),
        'group_id' => array('name' => 'group_id', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSAddUserToGroup',                   // method name
    array('addUserToGroup' => 'tns:addUserToGroup'),    // input parameters
    array('return' => 'xsd:string'),                    // output parameters
    'urn:WSRegistration',                               // namespace
    'urn:WSRegistration#WSAddUserToGroup',              // soapaction
    'rpc',                                              // style
    'encoded',                                          // use
    'This service adds a user to a group'               // documentation
);

// Define the method WSAddUserToGroup
function WSAddUserToGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }

    $userGroup = new UserGroup();

    return $userGroup->add_user_to_group($params['user_id'], $params['group_id']);
}

/* Add user to group Web Service end */

/* Update user role in group Web Service start */
// Register the data structures used by the service

// Input params for WSUpdateUserRoleInGroup
$server->wsdl->addComplexType(
    'updateUserRoleInGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'user_id' => array('name' => 'user_id', 'type' => 'xsd:string'),
        'group_id' => array('name' => 'group_id', 'type' => 'xsd:string'),
        'relation_type' => array('name' => 'relation_type', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSUpdateUserRoleInGroup',                        // method name
    array('updateUserRoleInGroup' => 'tns:updateUserRoleInGroup'),  // input parameters
    array('return' => 'xsd:string'),                                // output parameters
    'urn:WSRegistration',                                           // namespace
    'urn:WSRegistration#WSUpdateUserRoleInGroup',                   // soapaction
    'rpc',                                                          // style
    'encoded',                                                      // use
    'This service updates a user role in group'                     // documentation
);

// Define the method WSUpdateUserRoleInGroup
function WSUpdateUserRoleInGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();

    return $userGroup->update_user_role(
        $params['user_id'],
        $params['group_id'],
        $params['relation_type']
    );
}

/* Update user role Web Service end */

/* Delete user from group Web Service start */
// Register the data structures used by the service

// Input params for WSDeleteUserFromGroup
$server->wsdl->addComplexType(
    'deleteUserFromGroup',
    'complexType',
    'struct',
    'all',
    '',
    array(
        'secret_key'   => array('name' => 'secret_key', 'type' => 'xsd:string'),
        'user_id' => array('name' => 'user_id', 'type' => 'xsd:string'),
        'group_id' => array('name' => 'group_id', 'type' => 'xsd:string')
    )
);

// Register the method to expose
$server->register('WSDeleteUserFromGroup',                      // method name
    array('deleteUserFromGroup' => 'tns:deleteUserFromGroup'),  // input parameters
    array('return' => 'xsd:string'),                            // output parameters
    'urn:WSRegistration',                                       // namespace
    'urn:WSRegistration#WSDeleteUserFromGroup',                 // soapaction
    'rpc',                                                      // style
    'encoded',                                                  // use
    'This service deletes a user from a group'                  // documentation
);

// Define the method WSDeleteUserFromGroup
function WSDeleteUserFromGroup($params)
{
    if (!WSHelperVerifyKey($params['secret_key'])) {
        return returnError(WS_ERROR_SECRET_KEY);
    }
    $userGroup = new UserGroup();

    return $userGroup->delete_user_rel_group(
        $params['user_id'],
        $params['group_id']
    );
}


/* Delete user from group Web Service end */

// Add more webservices through hooks from plugins
if (!empty($hook)) {
    $hook->setEventData(array('server' => $server));
    $res = $hook->notifyWSRegistration(HOOK_EVENT_TYPE_POST);
    if (!empty($res['server'])) {
        $server = $res['server'];
    }
}

// Use the request to (try to) invoke the service
$GLOBALS['HTTP_RAW_POST_DATA'] = file_get_contents('php://input');
$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : '';

// If you send your data in utf8 then this value must be false.
$decodeUTF8 = api_get_setting('registration.soap.php.decode_utf8');
if ($decodeUTF8 === 'true') {
    $server->decode_utf8 = true;
} else {
    $server->decode_utf8 = false;
}
$server->service($HTTP_RAW_POST_DATA);
