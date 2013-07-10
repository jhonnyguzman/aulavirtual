<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_thumbnail extends DataMapper {

	var $table = 'user_thumbnails';
	
	var $has_one = array("user");

    var $validation = array(
	    'file_name' => array(
	        'label' => 'File Name',
	        'rules' => array('required')
	    ),
	    'file_type' => array(
	        'label' => 'File Type',
	        'rules' => array('required')
	    ),
	    'file_size' => array( // accessed via $this->confirm_password
	        'label' => 'File Size',
	        'rules' => array('required')
	    ),
	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

}

/* End of file user.php */
/* Location: ./application/models/user_thumbnail.php */
?>