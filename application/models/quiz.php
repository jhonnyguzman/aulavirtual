<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Quiz extends DataMapper {

	var $table = 'quizzes';
	
	var $has_many = array("question");
	var $has_one  = array("chapter");

	var $validation = array(
	    'title' => array(
	        'label' => 'Titulo',
	        'rules' => array('required', 'trim')
	    ),
	    'description' => array(
	        'label' => 'Descripción',
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