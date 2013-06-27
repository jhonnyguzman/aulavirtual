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

class Course_thumbnails extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}


	//Observacion: Metodo Incompleto. Le falta completar la busqueda del ID del curso modificar la imagen
	public function index()
	{

		$course_image = new Course_thumbnail();
		
		//TODO: Completar la busqueda del id del curso
		//Pregunta, Como obtengo el ID del Curso en cuestion? 		
		//podria ser asi?    $data['course_thumbnail'] = $course_image->where('course_id', $course_id )->get();
		$data['course_thumbnail'] = $course_image->where('course_id', $course_id )->get();
		
		//$data['user_thumbnail'] = $user_avatar->where('user_id',$this->session->userdata('user_id'))->get();


		$this->load->view('course_thumbnail/index',$data);	
	}


	public function update()
	{
		//$ua = new User_thumbnail();
		$ua = new Course_thumbnail();
		$ua->where('course_id', $course_id)->get();
		if($ua->exists())
		{
			$result = $this->do_upload($ua->where('course_id', $course_id)->get());
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('course_thumbnail/index',$data);
        	}else{
        		$ua->course_id = $ua->where('course_id', $course_id)->get();
        		$ua->file_name = $result['data']['file_name'];
	        	$ua->file_type = $result['data']['file_type'];
	        	$ua->file_size = $result['data']['file_size'];
	        	if($ua->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen Principal del Curso actualizada correctamente."); 
	        		redirect('course_thumbnails');
	        	}else{
	        		$data['errors'] = $ua->error->string;
					$this->load->view('course_thumbnail/index',$data);
	        	}
        	}	
			}else{
        	$result = $this->do_upload($ua->where('course_id', $course_id)->get());
        	if($result['error']){
        		$data['errors'] = $result['error'];
				$this->load->view('course_thumbnail/index',$data);
        	}else{
        		$ua_new = new Course_thumbnail();
        		$ua->course_id = $ua->where('course_id', $course_id)->get();
        		$ua_new->file_name = $result['data']['file_name'];
	        	$ua_new->file_type = $result['data']['file_type'];
	        	$ua_new->file_size = $result['data']['file_size'];
	        	if($ua_new->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen Principal del Curso actualizada correctamente."); 
	        		redirect('course_thumbnails');
	        	}else{
	        		$data['errors'] = $ua_new->error->string;
					$this->load->view('course_thumbnail/index',$data);
	        	}
        	}
        }
	}


	public function do_upload($course_id)
	{
		$result = array();
		$config['upload_path'] 		= './uploads/course_thumbnails/';
		$config['allowed_types'] 	= 'gif|jpg|png';
		$config['max_size']			= '300';
		$config['max_width']  		= '500';
		$config['max_height']  		= '600';
		$config['overwrite']  		= TRUE;
		$config['file_name']  		= 'course_thumbnail_'.$course_id;

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

}