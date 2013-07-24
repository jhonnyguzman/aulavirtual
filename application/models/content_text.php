<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Content_text extends DataMapper {

	var $table = 'content_texts';
	
	//var $has_many = array("course_goal","course_audience","course_requirement");
	var $has_one  = array("lesson");

	var $validation = array(
	    'lesson_id' => array(
	        'label' => 'Tema',
	        'rules' => array('required','unique')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/content_text.php */
?>