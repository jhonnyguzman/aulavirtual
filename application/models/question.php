<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Question extends DataMapper {

	var $table = 'questions';
	
	//var $has_many = array("content_text");
	var $has_one  = array("quiz");

	var $validation = array(
	    'description' => array(
	        'label' => 'Descripción',
	        'rules' => array('required', 'trim')
	    ),
	    'quiz_id' => array(
	        'label' => 'Autoevaluación',
	        'rules' => array('required')
	    ),
	    'type' => array(
	        'label' => 'Tipo',
	        'rules' => array('required', 'trim')
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/quiestion.php */
?>