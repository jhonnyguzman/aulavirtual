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


	public function edit($course_id)
	{
		if($course_id != "")
		{
			$course = new Course($course_id);
			if($course->exists())
			{
				$ct = new Course_thumbnail();
				$data['course_thumbnail'] = $ct->where('course_id', $course_id )->get();
				$data['course'] = $course; 
				$this->load->view('course_thumbnail/edit',$data);	
			}else{
				show_404('page',FALSE);
			}
		}else{
			show_404('page',FALSE);
		}
	}

	public function update()
	{
		$ct = new Course_thumbnail();
		$ct->where('course_id', $this->input->post("course_id"))->get();
		if($ct->exists())
		{
			$result = $this->do_upload($ct->course_id);
        	if($result['error']){
        		$data['course'] = new Course($ct->course_id);
        		$data['course_thumbnail'] = $ct;
        		$data['errors'] = $result['error'];
				$this->load->view('course_thumbnail/edit',$data);
        	}else{
        		$ct->course_id = $ct->course_id;
        		$ct->file_name = $result['data']['file_name'];
	        	$ct->file_type = $result['data']['file_type'];
	        	$ct->file_size = $result['data']['file_size'];
	        	if($ct->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen Principal del Curso actualizada correctamente."); 
	        		redirect('courses/course-edit-image/'.$ct->course_id);
	        	}else{
	        		$data['course'] = new Course($ct->course_id);
	        		$data['course_thumbnail'] = $ct;
	        		$data['errors'] = $ua->error->string;
					$this->load->view('course_thumbnail/edit',$data);
	        	}	
			}
		}else{
        	$result = $this->do_upload($this->input->post("course_id"));
        	if($result['error']){
        		$data['course'] = new Course($this->input->post("course_id"));
        		$data['errors'] = $result['error'];
				$this->load->view('course_thumbnail/edit',$data);
        	}else{
        		$ct_new = new Course_thumbnail();
        		$ct_new->course_id = $this->input->post("course_id");
        		$ct_new->file_name = $result['data']['file_name'];
	        	$ct_new->file_type = $result['data']['file_type'];
	        	$ct_new->file_size = $result['data']['file_size'];
	        	if($ct_new->save()){
	        		$this->session->set_flashdata('flashConfirm', "Imágen Principal del Curso actualizada correctamente."); 
	        		redirect('courses/course-edit-image/'.$ct_new->course_id);
	        	}else{
	        		$data['course'] = new Course($this->input->post("course_id"));
	        		$data['errors'] = $ct_new->error->string;
					$this->load->view('course_thumbnail/edit',$data);
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