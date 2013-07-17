<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_user extends DataMapper {

	var $table = 'course_users';
	
	var $has_one = array("course");

	var $validation = array(	   
	    'course_id' => array(
	        'label' => 'Curso',
	        'rules' => array('required','trim')
	    ),
  		'user_id' => array(
	        'label' => 'Usuario',
	        'rules' => array('required','trim')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course_audience.php */
?>