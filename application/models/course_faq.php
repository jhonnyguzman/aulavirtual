<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_faq extends DataMapper {

	var $table = 'course_faqs';
	
	var $has_one = array("course");

    var $validation = array(
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

/* End of file course_thumbnail.php */
/* Location: ./application/models/course_thumbnail.php */
?>