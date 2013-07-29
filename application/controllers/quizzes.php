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

class Quizzes extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function create()
	{
		$result = array();
		$chapter = new Chapter();
		$chapter->where("id", $this->input->post('chapter_id'))->get();
		if($chapter->exists()){
			$quiz = new Quiz();
			$quiz->title = $this->input->post("title");
			$quiz->description = $this->input->post("description");
			$quiz->order = $this->input->post("order");
			$quiz->chapter_id = $this->input->post("chapter_id");
			
			if($quiz->save()){
				$result['quiz'] = array('id' => $quiz->id, 'title' => $quiz->title, 'description' => $quiz->description, 'order' => $quiz->order, 'chapter_order' => $quiz->chapter->order);
				$result['message_status'] = 'success';
				$result['message_description'] = 'Autoevaluación creada correctamente';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
			}else{
				$result['message_status'] = 'error';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $quiz->error->string);
			}

		}else{
			//show_404('page',FALSE);
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}


	public function update()
	{
		$result = array();
		$chapter = new Chapter();
		$chapter->where("id", $this->input->post('chapter_id'))->get();
		if($chapter->exists())
		{
			$lesson = new Lesson();
			$lesson->where("id", $this->input->post('id') )->get();
			if($lesson->exists()){
				$lesson->name = $this->input->post("name");
				$lesson->order = $this->input->post("order");
				$lesson->chapter_id = $this->input->post("chapter_id");
				if($lesson->save()){
					$result['lesson'] = array('id' => $lesson->id, 'name' => $lesson->name, 'order' => $lesson->order, 'chapter_order' => $lesson->chapter->order);
					$result['message_status'] = 'success';
					$result['message_description'] = 'Tema actualizado correctamente';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
				}else{
					$result['message_status'] = 'error';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $lesson->error->string);
				}
			}else{
				$result['message_status'] = 'error';
				$result['message_description'] = 'Request failed!!';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
			}

		}else{
			//show_404('page',FALSE);
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}


	public function delete()
	{
		$result = array();
		$lesson = new Lesson();
		$lesson->where("id", $this->input->post('id') )->get();
		if($lesson->exists()){
			$lesson->delete();
			$result['message_status'] = 'success';
			$result['message_description'] = 'Tema eliminado correctamente';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
		}else{
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}
}

?>