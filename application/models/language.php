<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Language extends DataMapper {

	var $table = 'languages';
	
	var $has_many = array("user");

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

}

/* End of file user.php */
/* Location: ./application/models/language.php */
?>