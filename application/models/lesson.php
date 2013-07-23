<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lesson extends DataMapper {

	var $table = 'lessons';
	
	var $has_many = array("content_text");
	var $has_one  = array("chapter",'content_video_url','content_video');

	var $validation = array(
	    'name' => array(
	        'label' => 'Nombre',
	        'rules' => array('required', 'trim')
	    ),
	    'chapter_id' => array(
	        'label' => 'Capitulo',
	        'rules' => array('required')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/lesson.php */
?>