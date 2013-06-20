<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends DataMapper {

	var $table = 'users';
	
	var $has_one = array("role");

	var $created_field = 'added';
    var $updated_field = 'edited';

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file country.php */
/* Location: ./application/models/user.php */
?>