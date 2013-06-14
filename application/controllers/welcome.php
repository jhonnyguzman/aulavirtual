<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->lang->load('cizacl',$this->config->item('language'));
		//$this->load->model('cizacl_mdl');
	}


	public function test()
	{
		echo "role_id: ".$this->session->userdata("role_id")."<br>";
		//var_dump($this->cizacl->check_isAllowed("secretaria", 'welcome'));

		var_dump($this->cizacl->check_hasRole($this->session->userdata("role_id")));
		var_dump($this->cizacl->check_has('welcome'));
		var_dump($this->cizacl->check_has('test'));

		if($this->cizacl->check_isAllowed($this->session->userdata("role_id"), 'welcome')){
			echo "tiene permisos";
		}else{
			echo "No tiene permisos";
		}
	}

	public function test2(){
		if($this->cizacl->check_isAllowed("secretaria", 'welcome','test2')){
			echo "tiene permisos";
		}else{
			echo "No tiene permisos";
		}	
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */