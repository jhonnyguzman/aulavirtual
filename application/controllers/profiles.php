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





// public function update()
// 	{
// 		$ua = new User_thumbnail();
// 		$ua->where('user_id', $this->session->userdata("user_id"))->get();
// 		if ($ua->exists())
//         {
//         	$result = $this->do_upload($this->session->userdata('user_id'));
//         	if($result['error']){
//         		$data['errors'] = $result['error'];
// 				$this->load->view('user_thumbnail/index',$data);
//         	}else{
//         		$ua->user_id = $this->session->userdata('user_id');
//         		$ua->file_name = $result['data']['file_name'];
// 	        	$ua->file_type = $result['data']['file_type'];
// 	        	$ua->file_size = $result['data']['file_size'];
// 	        	if($ua->save()){
// 	        		$this->session->set_flashdata('flashConfirm', "Imágen de perfil actualizada correctamente."); 
// 	        		redirect('user_thumbnails');
// 	        	}else{
// 	        		$data['errors'] = $ua->error->string;
// 					$this->load->view('user_thumbnail/index',$data);
// 	        	}
//         	}
//         }else{
//         	$result = $this->do_upload($this->session->userdata('user_id'));
//         	if($result['error']){
//         		$data['errors'] = $result['error'];
// 				$this->load->view('user_thumbnail/index',$data);
//         	}else{
//         		$ua_new = new User_thumbnail();
//         		$ua_new->user_id = $this->session->userdata('user_id');
//         		$ua_new->file_name = $result['data']['file_name'];
// 	        	$ua_new->file_type = $result['data']['file_type'];
// 	        	$ua_new->file_size = $result['data']['file_size'];
// 	        	if($ua_new->save()){
// 	        		$this->session->set_flashdata('flashConfirm', "Imágen de perfil actualizada correctamente."); 
// 	        		redirect('user_thumbnails');
// 	        	}else{
// 	        		$data['errors'] = $ua_new->error->string;
// 					$this->load->view('user_thumbnail/index',$data);
// 	        	}
//         	}
//         }
// 	}




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





	public function update_p98assword($user_id)
	{
		$result = array();
		$config['upload_path'] 		= './uploads/user_thumbnails/';
		$config['allowed_types'] 	= 'gif|jpg|png';
		$config['max_size']			= '300';
		$config['max_width']  		= '500';
		$config['max_height']  		= '600';
		$config['overwrite']  		= TRUE;
		$config['file_name']  		= 'user_thumbnail_'.$user_id;

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload('user_thumbnail'))
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










}