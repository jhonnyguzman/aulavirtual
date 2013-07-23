<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Content_video extends DataMapper {

	var $table = 'content_videos';
	
	//var $has_many = array("course_goal","course_audience","course_requirement");
	var $has_one  = array("lesson");

	var $validation = array(
	    'lesson_id' => array(
	        'label' => 'Tema',
	        'rules' => array('required','unique')
	    ),
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

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/content_video.php */
?>