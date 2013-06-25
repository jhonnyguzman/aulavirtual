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

class User_thumbnails extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$languages = new Language();
		$user_avatar = new User_thumbnail();
		$data['user_thumbnail'] = $user_avatar->where('user_id',$this->session->userdata('user_id'))->get();
		$this->load->view('user_thumbnail/index',$data);	
	}


	public function update()
	{
		$ua = new User_thumbnail();
		$ua->where('user_id', $this->session->userdata("user_id"))->get();
		if ($ua->exists())
        {
        	$result = $this->do_upload($this->session->userdata('user_id'));
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('user_thumbnail/index',$data);
        	}else{
        		$ua->user_id = $this->session->userdata('user_id');
        		$ua->file_name = $result['data']['file_name'];
	        	$ua->file_type = $result['data']['file_type'];
	        	$ua->file_size = $result['data']['file_size'];
	        	if($ua->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen de perfil actualizada correctamente."); 
	        		redirect('user_thumbnails');
	        	}else{
	        		$data['errors'] = $ua->error->string;
					$this->load->view('user_thumbnail/index',$data);
	        	}
        	}
        }else{
        	$result = $this->do_upload($this->session->userdata('user_id'));
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('user_thumbnail/index',$data);
        	}else{
        		$ua_new = new User_thumbnail();
        		$ua_new->user_id = $this->session->userdata('user_id');
        		$ua_new->file_name = $result['data']['file_name'];
	        	$ua_new->file_type = $result['data']['file_type'];
	        	$ua_new->file_size = $result['data']['file_size'];
	        	if($ua_new->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen de perfil actualizada correctamente."); 
	        		redirect('user_thumbnails');
	        	}else{
	        		$data['errors'] = $ua_new->error->string;
					$this->load->view('user_thumbnail/index',$data);
	        	}
        	}
        }
	}


	public function do_upload($user_id)
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