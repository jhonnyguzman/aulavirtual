<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends DataMapper {

	var $table = 'users';
	
	var $has_one = array("role","user_thumbnail");

	var $created_field = 'added';
    var $updated_field = 'edited';

    var $validation = array(
	    'email' => array(
	        'label' => 'Email Address',
	        'rules' => array('required','trim', 'valid_email')
	    ),
	    'password' => array(
	        'label' => 'Password',
	        'rules' => array('required','encrypt')
	    ),
	);

    function __construct($id = NULL)
    {
        parent::__construct($id);
    }

    // Validation prepping function to encrypt passwords
	function _encrypt($field) // optional second parameter is not used
	{
	    // Don't encrypt an empty string
	    /*if (!empty($this->{$field}))
	    {
	        // Generate a random salt if empty
	        if (empty($this->salt))
	        {
	            $this->salt = md5(uniqid(rand(), true));
	        }

	       // $this->{$field} = sha1($this->salt . $this->{$field});
	       //$this->{$field} = md5($this->{$field});
	    }*/

	    $this->{$field} = md5($this->{$field});
	}

}

/* End of file user.php */
/* Location: ./application/models/user.php */
?>