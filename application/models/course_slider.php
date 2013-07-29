<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_slider extends DataMapper {

	var $table = 'course_sliders';
	
	var $has_one = array("course");

    var $validation = array(
	    'file_name' => array(
	        'label' => 'File Name',
	        'rules' => array('required','trim')
	    ),
	    'file_type' => array(
	        'label' => 'File Type',
	        'rules' => array('required','trim')
	    ),
	    'file_size' => array( // accessed via $this->confirm_password
	        'label' => 'File Size',
	        'rules' => array('required','trim')
	    ),
	    'course_id' => array( // accessed via $this->confirm_password
	        'label' => 'Course',
	        'rules' => array('required')
	    ),
	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

}

/* End of file course_thumbnail.php */
/* Location: ./application/models/course_thumbnail.php */
?>