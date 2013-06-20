<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Role extends DataMapper {

	var $table = 'roles';
    
    var $has_many = array("user");

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }
}

/* End of file country.php */
/* Location: ./application/models/user.php */
?>