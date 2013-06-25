<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Course extends DataMapper {

	var $table = 'courses';
	
	var $has_many = array("couse_goals");

	var $created_field = 'added';
    var $updated_field = 'edited';

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file course.php */
/* Location: ./application/models/course.php */
?>