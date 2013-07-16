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

class Contents extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function text_add(){
		echo $this->load->view("content/text_add",array("lesson_id" => $this->input->post("lesson_id")));
	}

	public function text_create()
	{
		$post = $this->input->post(NULL,TRUE);
		$result = array();
		$lesson = new Lesson();
		$lesson->where("id", $post['lesson_id'])->get();
		if($lesson->exists()){
			
			$ct = new Content_text();
			$ct->lesson_id = $lesson->id;
			$ct->text_html = $post["text_html"];
			if($ct->save()){
				$result['content_text'] = array('id' => $ct->id, 'text_html' => $ct->text_html);
				$result['message_status'] = 'success';
				$result['message_description'] = 'Contenido creado correctamente';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
			}else{
				$result['message_status'] = 'error';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $ct->error->string);
			}

		}else{
			//show_404('page',FALSE);
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}

	public function text_edit()
	{
		$data = array();
		$lesson = new Lesson();
		$lesson->where("id", $this->input->post('lesson_id'))->get();
		if($lesson->exists()){
			$ct = new Content_text();
			$ct->where("lesson_id", $lesson->id)->get();
			if($ct->exists()){
				$data['message_status'] = 'success';
				$data['content_text'] = $ct;
				echo $this->load->view("content/text_edit",$data);
			}else{
				$data['message_status'] = 'error';
				echo $this->load->view("content/text_edit",$data);
			}
		}else{
			$data['message_status'] = 'error';
			echo $this->load->view("content/text_edit",$data);
		}
	}

	public function text_update()
	{
		$post = $this->input->post(NULL,TRUE);
		$result = array();
		$lesson = new Lesson();
		$lesson->where("id", $post['lesson_id'])->get();
		if($lesson->exists()){
			$ct = new Content_text();
			$ct->where("id", $post['id'])->get();
			if($ct->exists()){
				$ct->lesson_id = $lesson->id;
				$ct->text_html = $post["text_html"];
				if($ct->save()){
					$result['content_text'] = array('id' => $ct->id, 'text_html' => $ct->text_html,'lesson_id' => $ct->lesson_id);
					$result['message_status'] = 'success';
					$result['message_description'] = 'Contenido actualizado correctamente';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
				}else{
					$result['message_status'] = 'error';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $ct->error->string);
				}
			}else{
				$result['message_status'] = 'error';
				$result['message_description'] = 'Request failed!!';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
			}
		}else{
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}

	private function test(){
		echo "ffd";
	}
}