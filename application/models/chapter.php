<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Chapter extends DataMapper {

	var $table = 'chapters';
	
	var $has_many = array("lesson",'quiz');
	var $has_one  = array("course");

	var $validation = array(
	    'name' => array(
	        'label' => 'Nombre',
	        'rules' => array('required', 'trim')
	    ),
	    'course_id' => array(
	        'label' => 'Course',
	        'rules' => array('required')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/chapter.php */
?>