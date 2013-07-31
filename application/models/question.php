<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Question extends DataMapper {

	var $table = 'questions';
	var $extensions = array('array');
	var $types = array("TF" => "Verdadero/Falso", "MULTI" => 'Opciones Múltiples');
	
	//var $has_many = array("content_text");
	var $has_one  = array("quiz");

	var $validation = array(
	    'description' => array(
	        'label' => 'Descripción',
	        'rules' => array('required', 'trim'),
	        'get_rules' => array('formatDescription')
	    ),
	    'quiz_id' => array(
	        'label' => 'Autoevaluación',
	        'rules' => array('required')
	    ),
	    'type' => array(
	        'label' => 'Tipo',
	        'rules' => array('required', 'trim'),
	        'get_rules' => array('formatType')
	    ),
	    'type_description' => array(
	    	'field' => 'type_description',
	        'label' => 'Tipo',
	      	'rules' => array('trim')  
	    ),

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

    // Validation prepping function to encrypt passwords
	function _formatType($field) 
	{
	  $this->type_description = html_entity_decode($this->types[$this->{$field}]);
	}
	function _formatDescription($field) 
	{
	  $this->{$field} = html_entity_decode($this->{$field});
	}
}

/* End of file course.php */
/* Location: ./application/models/quiestion.php */
?>