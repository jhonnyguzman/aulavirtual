<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_preference extends DataMapper {

	var $table = 'user_preferences';
	
	var $has_one = array("user");

	var $validation = array(
	    'description' => array(
	        'label' => 'Descripción',
	        'rules' => array('required', 'trim')
	    ),
	    'user_id' => array(
	        'label' => 'User',
	        'rules' => array('required','trim')
	    ),
	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course_goal.php */
?>