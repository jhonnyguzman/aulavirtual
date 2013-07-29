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

	public function my_courses()
	{
		$courses = new Course();
		$courses->where("owner_id", $this->session->userdata("user_id"))->get();
		
		$courses_user = new Course_user();
		// 1 - estudiante
		// 2 - profesor
		// 3 - institucion
		$category = 1; 
		$courses_user->where("user_category_id", $category)->where("user_id", $this->session->userdata("user_id"))->get();
		
		$data["courses"] = $courses;
		$data["courses_user"] = $courses_user;
		$data["progress"] = $this->_progress(); 
		$data["error_evaluation"] = $this->_error_evaluations();

		$this->load->view("courses/my_courses",$data);
	}


	private function _progress(){

		//TODO: Crear una manera de medir el porcentaje de prograso de un usuario para un curso
		$progress = mt_rand(1,100);	
		return $progress;
	}

	private function _error_evaluations(){

		//TODO: 
		$error_evaluation = mt_rand(1,20);	
		return $error_evaluation;
	}



	public function learn($course_id = "")
	{
		if($course_id != ""){

			$c = new Course_user();
			$c->where("course_id",$course_id)->where("user_id", $this->session->userdata("user_id"))->get();;
			if($c->exists()){
				$chapters = new Chapter();
				$lesson = new Lesson();
				//$content_text = new Content_text();

				$chapters->where("course_id",$course_id);
				$lesson->where("chapter_id",$chapters->id);

				$data["chapters"] = $chapters;
				$data["lesson"] = $lesson;
				$data["course_user"] = $c;
				$data["progress"] = $this->_progress(); 
				$data["error_evaluation"] = $this->_error_evaluations();
			

				$this->load->view("courses/learn",$data);
			}else{
				show_404('page',FALSE);
				//echo "NO EXISTO EL CURSO: " .$course_id;
			}
		}else{
			show_404('page',FALSE);
			//echo "El id del curso es distinto de vacio:" .$course_id; 
		}
	}


	public function newTitle()
	{
		$this->load->view("courses/newtitle");
	}

	public function course_new()
	{
		$languages = new Language();
		$course_categories = new Course_category();
		$moneys = new Money();
		$data['languages'] = $languages->get();
		$data['course_categories'] = $course_categories->get();
		$data['moneys'] = $moneys->get();
		$this->load->view("courses/new",$data);	
	}

	public function course_create()
	{
		$flag = FALSE;
		$post = $this->input->post(NULL,TRUE);
		if (!empty($_FILES['course_thumbnail']['name'])) {
			$result = $this->do_upload();
			$flag = TRUE;
		}
    	if($flag == TRUE && isset($result['error'])){
    		$languages = new Language();
			$course_categories = new Course_category();
			$moneys = new Money();
			$data['languages'] = $languages->get();
			$data['course_categories'] = $course_categories->get();
			$data['moneys'] = $moneys->get();
    		$data['errors'] = $result['error'];
			$this->load->view("courses/new",$data);
    	}else{
    		$c = new Course();
			$c->title = $post["title"];
			$c->owner_id = $this->session->userdata("user_id");
			$c->subtitle = $post["subtitle"];
			$c->keywords = $post["keywords"];
			$c->course_category_id = $post["course_category_id"];
			$c->language_id = $post["language_id"];
			$c->summary = $this->input->post("summary",TRUE);
			$c->price = $post["price"];
			$c->money_id = $post["money_id"];
			if($c->save()){
					if($flag){
		        		$ct = new Course_thumbnail();
		        		$ct->course_id = $c->id;
		        		$ct->file_name = $result['data']['file_name'];
			        	$ct->file_type = $result['data']['file_type'];
			        	$ct->file_size = $result['data']['file_size'];
						$ct->save();
					}		        	
		        	redirect("courses/course-manage/".$c->id);
			}else{
				$languages = new Language();
				$course_categories = new Course_category();
				$moneys = new Money();
				$data['languages'] = $languages->get();
				$data['course_categories'] = $course_categories->get();
				$data['moneys'] = $moneys->get();
				$data['errors'] = $c->error->string;
				$this->load->view("courses/new",$data);
			}
    	}	
		
		
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


	public function edit_price($course_id = "")
	{
		if($course_id != ""){
			$c = new Course();
			$c->where("id", $course_id)->where("owner_id", $this->session->userdata("user_id"))->get();
			if($c->exists()){				
				$data["course"] = $c;				
				$this->load->view("courses/edit_price",$data);
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}

	public function update_price()
	{
		$post = $this->input->post(NULL,TRUE);
		$c = new Course();
		$c->where("id", $this->input->post('id') )->where("owner_id", $this->session->userdata("user_id"))->get();
		if($c->exists()){
			$c->summary = $this->input->post("summary",TRUE);
			$c->instruction = $this->input->post("instruction");
			$c->price = $post["price"];
			if($c->save()){
				$this->session->set_flashdata('flashConfirm', "Precio del Curso actualizado correctamente."); 
				redirect("courses/course-edit-price/".$c->id);
			}else{
				
				$data["course"] = $c;
				$data['errors'] = $c->error->string;
				$this->load->view("courses/edit_price",$data);
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

	

	public function edit_curriculum($course_id = "")
	{
		if($course_id != ""){
			$c = new Course();
			$c->where("id", $course_id)->where("owner_id", $this->session->userdata("user_id"))->get();
			if($c->exists()){
				$data["course"] = $c;
				$this->load->view("courses/edit_curriculum",$data);
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}


	public function do_upload()
	{
		$result = array();
		$config['upload_path'] 		= './uploads/course_thumbnails/';
		$config['allowed_types'] 	= 'gif|jpg|png';
		$config['max_size']			= '300';
		$config['max_width']  		= '500';
		$config['max_height']  		= '600';
		$config['overwrite']  		= TRUE;
		$config['file_name']  		= 'course_thumbnail_'.random_string('unique');

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload('course_thumbnail'))
		{
			$result["error"] = $this->upload->display_errors();
		}
		else
		{
			$result['data'] = $this->upload->data();
			$result['data']['file_name'] = $config['file_name'].$result['data']['file_ext'];
		}

		return $result;
	}








	//private functions here

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