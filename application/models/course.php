<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course extends DataMapper {

	var $table = 'courses';
	
	var $has_many = array("course_goal","course_audience","course_requirement","chapter", "course_user","course_faq", "course_testimony");
	var $has_one  = array("course_thumbnail", "user");

	var $validation = array(
	    'title' => array(
	        'label' => 'Título',
	        'rules' => array('required', 'trim')
	    ),
	    'subtitle' => array(
	        'label' => 'Subtítulo',
	        'rules' => array('trim')
	    ),
		'price' => array(
	        'label' => 'Price',
	        'rules' => array('trim', 'max_length' => 4)
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course.php */
?>