<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Content_video_url extends DataMapper {

	var $table = 'content_videos';
	
	//var $has_many = array("course_goal","course_audience","course_requirement");
	var $has_one  = array("lesson");

	var $validation = array(
	    'lesson_id' => array(
	        'label' => 'Tema',
	        'rules' => array('required','unique')
	    ),
	    'url' => array(
	        'label' => 'URL',
	        'rules' => array('required','trim','valid_url','xss_clean')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/content_video_url.php */
?>