<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * CIzACL
 * 
 * @copyright	Copyright (c) Schizzoweb Web Agency
 * @website		http://www.schizzoweb.com
 * @version		1.2
* @revision	2013-06-20
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/

class Signup extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->config->load('email_settings');		
	}

	public function index()
	{
		$this->load->view('signup/index');	
	}


	public function register()
	{
		$u = new User();
		$post = $this->input->post(NULL,TRUE);
		$u->username = $post['username'];
		$u->password = $post['password'];
		$u->confirm_password = $post['confirm_password'];
		$u->name = $post['name'];
		$u->surname = $post['surname'];
		$u->email = $post['email'];
		$u->role_id = 1;
		$u->user_status_code = 4; // waiting confirmation registration
		$u->activationcode = $this->basicrud->_random_string(50);
		if($u->save()){
			if(!$this->sendMailToUser($u))
			{
				$data["status_description"] = "Error to register";
				$data["status"] = 2;
				$this->load->view('signup/result_register',$data);
			}else{
				$data["status_description"] = $this->config->item('text_notification_register_user');
				$data["status"] = 1;
				$this->load->view('signup/result_register',$data);
			}
		}else{
			$data['errors'] = $u->error->string;
			$this->load->view('signup/index',$data);
		}
	}


	private function sendMailToUser($u)
	{
		$data_config = array();
		$check = TRUE;
		$this->load->library('email');
		
		//notificacion de nuevo registro of user
		$data_config['p_from'] = $this->config->item('email_from');
		$data_config['p_from_name'] = $this->config->item('email_from_name');
		$data_config['p_to'] = $u->email;
		$data_config['p_subject'] = $this->config->item('email_subject_register_new_user');
		$p_message = $this->config->item('email_header1_msg_register_new_user');
		$p_message.= $this->config->item('email_header2_msg_register_new_user');
		$p_message.= $u->surname." ".$u->name."</h3>";
		$p_message.= $this->config->item('email_body3_msg_register_new_user');
		$p_message.= anchor("/signup/confirm/".$u->activationcode,"Register Confirm")."<br><br>";
		$p_message.= $this->config->item('email_body4_msg_register_new_user');
		$p_message.= $this->config->item('email_body5_msg_register_new_user');
		$data_config['p_message'] = $p_message;

		if($data['error_email']=$this->basicrud->sendmailAdvanced($data_config))
			$check = false;
		
		return $check;
	}

	/**
	 * This function confirm the registration of user 
	 *
	 * @param string $activationcode	
	 * @return void
	 */
	public function confirm() 
	{
		//obtener activation code of url
		$activationcode = $this->uri->segment(3);
		
		if($activationcode == ""){
			$data["status_description"] = $this->config->item('user_register_error');
			$data["status"] = 2;
			$this->load->view("signup/confirm_register",$data);
		}
		
		//verificar si coincide activationcode con el almancenado en la base de datos
		//Ademas se agrega verificacion de user_status_code => 1 "activado"
		$u = new User();
		$u->get_by_activationcode($activationcode);
		$u->where('activationcode', $activationcode)->where('user_status_code',4)->get();
		if ($u->exists())
        {
        		$u->user_status_code = 1; // enabled 
				//actualizar estado de usuario a enabled
				if($u->save())
				{ 
					$data["status_description"] = $this->config->item('user_register_confirm');
					$data["status"] = 1;
					$this->load->view("signup/confirm_register",$data);
				}
				else
				{
					$data["status_description"] = $this->config->item('user_register_error');
					$data["status"] = 2;
					$this->load->view("signup/confirm_register",$data);
				}
		}else{
			show_404('page',FALSE);
		}
	}

}

?>