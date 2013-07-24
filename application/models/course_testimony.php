<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_testimony extends DataMapper {

	var $table = 'course_testimonies';
	
	var $has_one = array("course", "user");

 /*
	var $validation = array(
	    'testimony' => array(
	        'label' => 'Testimonio',
	        'rules' => array('required')
	    ),
	    'course_id' => array(
	        'label' => 'Curso',
	        'rules' => array('required','trim')
	    ),
	);
*/
    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course_audience.php */
?>