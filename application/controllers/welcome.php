<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->lang->load('cizacl',$this->config->item('language'));
		$this->load->model('cizacl_mdl');
	}

	public function index()
	{
		echo "hola index";
	}

	public function test()
	{
		echo "hola test";
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */