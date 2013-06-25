<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * AulaVirtual
 * 
 * @copyright	Copyright (c) Schizzoweb Web Agency
 * @version		1
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

class Courses extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$languages = new Language();
		$user = new Profile();
		$data['languages'] = $languages->get();
		$data['user'] = $user->where('id',$this->session->userdata('user_id'))->get();
		
		//TODO: Cargar vista de Courses		
		
		//$this->load->view('profile/index',$data);	
		
	}

	public function newTitle()
	{
		$this->load->view("courses/newtitle");
	}

	public function createTitle(){
		$c = new Course();
		$c->title = $this->input->post("title");
		$c->owner_id = $this->session->userdata("user_id");
		if($c->save()){
			redirect("courses/course-manage/".$c->id);
		}else{
			$data['errors'] = $c->error->string;
			$this->load->view("courses/newtitle",$data);
		}
	}

	public function manage($course_id = "")
	{
		if($course_id != ""){
			$c = new Course();
			$c->where("id", $course_id)->where("owner_id", $this->session->userdata("user_id"))->get();
			if($c->exists()){
				$data["course"] = $c;
				$this->load->view("courses/manage",$data);
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}

	public function create()
	{

		$u = new Course();
		$post = $this->input->post(NULL,TRUE);
		$u->name = $post['name'];
		$u->description = $post['description'];
		$u->concurrence = $post['concurrence'];
		$u->price = $post['price'];
		$u->course_category_id = $post['course_category_id'];
		$u->hours = $post['hours'];
		$u->timing = $post['timing'];
		$u->cost = $post['cost'];
		$u->discount = $post['discount'];
		$u->promo_date_to = $post['promo_date_to'];
		$u->quota = $post['quota'];
		$u->course_state_id = $post['course_state_id'];
		$u->languague_id = $post['languague_id'];
		$u->owner_id = $post['owner_id'];
		$u->added = $post['added'];
		$u->edited = $post['edited'];
		if($u->save()){
			if(!$this->sendMailToUser($u))
			{
				$data["status_description"] = "Error al crear el curso";
				$data["status"] = 2;
				//TODO: Cargar en la vista del Courses
				//$this->load->view('signup/result_register',$data);
			}else{
				$data["status_description"] = $this->config->item('text_notification_register_user');
				$data["status"] = 1;
				//TODO: Cargar en la vista del Courses
				//$this->load->view('signup/result_register',$data);
			}
		}else{
			$data['errors'] = $u->error->string;
			//TODO: Cargar en la vista del Courses
			//$this->load->view('signup/index',$data);
		}
	}



	private function sendMailToUser($u)
	{
		$data_config = array();
		$check = TRUE;
		$this->load->library('email');
		
		//notificacion de nuevo curso creado
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


}