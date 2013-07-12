<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course_category extends DataMapper {

	var $table = 'course_categories';
	
	var $has_many = array("user");

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file user.php */
/* Location: ./application/models/profile.php */
?>