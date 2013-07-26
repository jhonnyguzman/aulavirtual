<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Money extends DataMapper {

	var $table = 'moneys';
	
	var $has_many = array("course");

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

}

/* End of file user.php */
/* Location: ./application/models/language.php */
?>