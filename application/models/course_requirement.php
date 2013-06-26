<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_requirement extends DataMapper {

	var $table = 'course_requirements';
	
	var $has_one = array("course");

	var $validation = array(
	    'description' => array(
	        'label' => 'Descripción',
	        'rules' => array('required', 'trim')
	    ),
	    'course_id' => array(
	        'label' => 'Curso',
	        'rules' => array('required','trim')
	    ),
	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course_requirement.php */
?>