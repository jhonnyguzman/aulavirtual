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

class Profiles extends CI_Controller {

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
		$this->load->view('profile/index',$data);	
	}


	public function update()
	{
		$post = $this->input->post(NULL,TRUE);
		$u = new Profile();
		$u->where('id', $this->session->userdata("user_id"))->get();
		if ($u->exists())
        {
        	$u->name = $post['name'];
        	$u->surname = $post['surname'];
        	$u->desingnation = $post['desingnation'];
        	$u->biography = $post['biography'];
        	$u->language_id = $post['language_id'];
        	if($u->save()){
        		$this->session->set_flashdata('flashConfirm', "Perfil Actualizado correctamente."); 
        		redirect('profiles');
        	}else{
        		$languages = new Language();
				$data['languages'] = $languages->get();
				$this->load->view('profile/index',$data);
        	}
        }else{
        	show_404('page',FALSE);
        }

		//$data['languages'] = $languages->get();
		//$this->load->view('profile/index',$data);	
	}




public function edit_password()
	{
		$u = new Profile();
		$u->where('id', $this->session->userdata("id"))->get();
		if ($u->exists())
        {
        	$result = $this->update_password($this->session->userdata('id'));
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('profile/edit_password',$data);
        	}else{
        		$u->id = $this->session->userdata('id');
        		$u->password = $result['password'];
	        	if($u->save()){
	        		$this->session->set_flashdata('flashConfirm', "Contraseña actualizada correctamente."); 
	        		redirect('profiles');
	        	}else{
	        		$data['errors'] = $u->error->string;
					$this->load->view('profile/edit_password',$data);
	        	}
        	}
        }else{
        	$result = $this->update_password($this->session->userdata('id'));
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('profile/edit_password',$data);
        	}else{
        		$u_new = new Profile();
        		$u_new->id = $this->session->userdata('id');
        		$u_new->password = $result['password'];
	        	if($u_new->save()){
	        		$this->session->set_flashdata('flashConfirm', "Contraseña actualizada correctamente."); 
	        		redirect('profiles');
	        	}else{
	        		$data['errors'] = $u_new->error->string;
					$this->load->view('profile/edit_password',$data);
	        	}
        	}
        }
	}


	public function update_password()
	{
		//$post = $this->input->post(NULL,TRUE);
		$u = new Profile();
		$u->where('id', $this->session->userdata("id"))->get();
		if($u->exists()){
			$u->password = $post["password"];
			if($c->save()){
				$this->session->set_flashdata('flashConfirm', "Contraseña actualizada correctamente."); 
				redirect("profiles");
			}else{
				
				$data["users"] = $u;
				$data['errors'] = $u->error->string;
				$this->load->view("profiles/edit_password",$data);
			}
		}else{
			//show_404('page',FALSE);
		}
	}



public function edit_preferences($user_id = "")
	{
		if($user_id != ""){
			$c = new User();
			$c->where('id', $this->session->userdata("id"))->get();
			if($c->exists()){
				$user_preferences = new User_preference();				
				$data["user"] = $c;				
				$data["user_preferences"] = $user_preferences->where("user_id", $c->id)->get();
				$data["user_preferences_count"] = $user_preferences->result_count();
				
				$this->load->view("profiles/edit_preferences",$data);
			}else{
				//show_404('page',FALSE);
				echo "error 1";
			}
		}else{
			//show_404('page',FALSE);
			echo "aqui estamos";
			$nuevo = new User();
			$nuevo->id =5;
			$as = $nuevo->id;
			echo $as;
		}
	}



public function update_preferences()
	{
		$c = new User();
		$c->where('id', $this->session->userdata("id"))->get();
		
		if($c->exists()){
			// $c->summary = $this->input->post("summary",TRUE);
			// $c->instruction = $this->input->post("instruction");
			
			if($c->save()){
				$this->savePreferences($c->id);				
				$this->session->set_flashdata('flashConfirm', "Preferencia del usuario actualizada correctamente."); 
				
				redirect("profiles/profile-edit-preferences/".$c->id);
			
			}else{
				$user_preferences = new User_preference();				
				$data["user"] = $c;				
				$data["user_preferences"] = $user_preferences->where("user_id", $c->id)->get();
				$data["user_preferences_count"] = $user_preferences->result_count();				
				$data['errors'] = $c->error->string;
				
				$this->load->view("profiles/edit_preferences",$data);
			}
		}else{
			show_404('page',FALSE);
		}
	}




	//private functions here

	private function savePreferences($user_id)
	{
		$arr_preferences = explode(",",$this->input->post("preferences"));

		//delete all preferences
		$user_preferences = new User_preference();
		$user_preferences->where("user_id", $user_id)->get();
		$user_preferences->delete_all();

		//add new preferences
		if(count($arr_preferences) > 0){
			foreach ($arr_preferences as $p) {
				$prefenrece = new User_preference();
				$prefenrece->description = $p;
				$prefenrece->user_id = $user_id;
				$preference->save();
			}
		}
	}



///////////////////// EXAMPLE

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
			// $c->summary = $this->input->post("summary",TRUE);
			// $c->instruction = $this->input->post("instruction");
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



	/////////////////  END OF EXAMPLE









}