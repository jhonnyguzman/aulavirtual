<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends DataMapper {

	var $table = 'users';
	
	var $has_one = array("role","language","user_thumbnail");

	var $created_field = 'added';
    var $updated_field = 'edited';

    var $validation = array(
	    'username' => array(
	        'label' => 'Username',
	        'rules' => array('required', 'trim', 'unique', 'min_length' => 3, 'max_length' => 20)
	    ),
	    'password' => array(
	        'label' => 'Password',
	        'rules' => array('required', 'encrypt')
	    ),
	    'confirm_password' => array( // accessed via $this->confirm_password
	        'label' => 'Confirm Password',
	        'rules' => array('encrypt', 'matches' => 'password')
	    ),
	    'email' => array(
	        'label' => 'Email Address',
	        'rules' => array('required', 'trim', 'unique', 'valid_email')
	    ),
	    'role_id' => array(
	        'label' => 'Role',
	        'rules' => array('required', 'trim')
	    ),
	    'user_status_code' => array(
	        'label' => 'User Status Code',
	        'rules' => array('required', 'trim')
	    ),
	    'activationcode' => array(
	        'label' => 'Activation Code',
	        'rules' => array('required', 'trim')
	    ),
	    array( // accessed via $this->confirm_email
	        'field' => 'confirm_email',
	        'label' => 'Confirm Email Address',
	        'rules' => array('matches' => 'email')
	    )

	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

    // Validation prepping function to encrypt passwords
	function _encrypt($field) // optional second parameter is not used
	{
	    // Don't encrypt an empty string
	    if (!empty($this->{$field}))
	    {
	        // Generate a random salt if empty
	        if (empty($this->salt))
	        {
	            $this->salt = md5(uniqid(rand(), true));
	        }

	       // $this->{$field} = sha1($this->salt . $this->{$field});
	       $this->{$field} = md5($this->{$field});
	    }
	}

}

/* End of file user.php */
/* Location: ./application/models/user.php */
?>