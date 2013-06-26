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

	public function edit_basics($course_id = "")
	{
		if($course_id != ""){
			$c = new Course();
			$c->where("id", $course_id)->where("owner_id", $this->session->userdata("user_id"))->get();
			if($c->exists()){
				$languages = new Language();
				$course_categories = new Course_category();
				$data["course"] = $c;
				$data['languages'] = $languages->get();
				$data['course_categories'] = $course_categories->get();
				$this->load->view("courses/edit_basics",$data);
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}

	public function update_basics()
	{
		$post = $this->input->post(NULL,TRUE);
		$c = new Course();
		$c->where("id", $post['id'] )->where("owner_id", $this->session->userdata("user_id"))->get();
		if($c->exists()){
			$c->title = $post["title"];
			$c->subtitle = $post["subtitle"];
			$c->keywords = $post["keywords"];
			$c->course_category_id = $post["course_category_id"];
			$c->language_id = $post["language_id"];
			if($c->save()){
				$this->session->set_flashdata('flashConfirm', "Informaci&oacute;n Actualizada correctamente."); 
				redirect("courses/course-edit-basics/".$c->id);
			}else{
				$languages = new Language();
				$course_categories = new Course_category();
				$data['languages'] = $languages->get();
				$data["course"] = $c;
				$data['course_categories'] = $course_categories->get();
				$data['errors'] = $c->error->string;
				$this->load->view("courses/edit_basics",$data);
			}
		}else{
			show_404('page',FALSE);
		}
	}


	public function edit_details($course_id = "")
	{
		if($course_id != ""){
			$c = new Course();
			$c->where("id", $course_id)->where("owner_id", $this->session->userdata("user_id"))->get();
			if($c->exists()){
				$course_goals = new Course_goal();
				$course_audiences = new Course_audience();
				$course_requirements = new Course_requirement();
				$data["course"] = $c;
				$data["course_goals"] = $course_goals->where("course_id", $c->id)->get();
				$data["course_goals_count"] = $course_goals->result_count();
				$data["course_audiences"] = $course_audiences->where("course_id", $c->id)->get();
				$data["course_audiences_count"] = $course_audiences->result_count();
				$data["course_requirements"] = $course_requirements->where("course_id", $c->id)->get();
				$data["course_requirements_count"] = $course_requirements->result_count();
				$this->load->view("courses/edit_details",$data);
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}

	public function update_details()
	{
		$c = new Course();
		$c->where("id", $this->input->post('id') )->where("owner_id", $this->session->userdata("user_id"))->get();
		if($c->exists()){
			$c->summary = $this->input->post("summary",TRUE);
			$c->instruction = $this->input->post("instruction");
			if($c->save()){
				$this->saveGoals($c->id);
				$this->saveAudiences($c->id);
				$this->saveRequirements($c->id);
				$this->session->set_flashdata('flashConfirm', "Detalle de Curso actualizado correctamente."); 
				redirect("courses/course-edit-details/".$c->id);
			}else{
				$course_goals = new Course_goal();
				$course_audiences = new Course_audience();
				$course_requirements = new Course_requirement();
				$data["course"] = $c;
				$data["course_goals"] = $course_goals->where("course_id", $c->id)->get();
				$data["course_goals_count"] = $course_goals->result_count();
				$data["course_audiences"] = $course_audiences->where("course_id", $c->id)->get();
				$data["course_audiences_count"] = $course_audiences->result_count();
				$data["course_requirements"] = $course_requirements->where("course_id", $c->id)->get();
				$data["course_requirements_count"] = $course_requirements->result_count();
				$data['errors'] = $c->error->string;
				$this->load->view("courses/edit_details",$data);
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

	private function saveGoals($course_id)
	{
		$arr_goals = explode(",",$this->input->post("goals"));

		//delete all goals
		$course_goals = new Course_goal();
		$course_goals->where("course_id", $course_id)->get();
		$course_goals->delete_all();

		//add new goals
		if(count($arr_goals) > 0){
			foreach ($arr_goals as $g) {
				$goal = new Course_goal();
				$goal->description = $g;
				$goal->course_id = $course_id;
				$goal->save();
			}
		}
	}

	private function saveAudiences($course_id)
	{
		$str_audiences = explode(",",$this->input->post("audiences"));

		//delete all audiences
		$course_audiences = new Course_audience();
		$course_audiences->where("course_id", $course_id)->get();
		$course_audiences->delete_all();

		//add new audiences
		if(count($str_audiences) > 0){
			foreach ($str_audiences as $g) {
				$audience = new Course_audience();
				$audience->description = $g;
				$audience->course_id = $course_id;
				$audience->save();
			}
		}
	}

	private function saveRequirements($course_id)
	{
		$str_requirements = explode(",",$this->input->post("requirements"));

		//delete all requirements
		$course_requirements = new Course_requirement();
		$course_requirements->where("course_id", $course_id)->get();
		$course_requirements->delete_all();

		//add new requirements
		if(count($str_requirements) > 0){
			foreach ($str_requirements as $g) {
				$requirement = new Course_requirement();
				$requirement->description = $g;
				$requirement->course_id = $course_id;
				$requirement->save();
			}
		}
	}
}