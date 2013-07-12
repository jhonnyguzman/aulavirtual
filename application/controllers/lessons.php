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

class Lessons extends CI_Controller {

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
			$lesson = new Lesson();
			$lesson->name = $this->input->post("name");
			$lesson->order = $this->input->post("order");
			$lesson->chapter_id = $this->input->post("chapter_id");
			
			if($lesson->save()){
				$result['lesson'] = array('id' => $lesson->id, 'name' => $lesson->name, 'order' => $lesson->order);
				$result['message_status'] = 'success';
				$result['message_description'] = 'Tema creado correctamente';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
			}else{
				$result['message_status'] = 'error';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $lesson->error->string);
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
					$result['lesson'] = array('id' => $lesson->id, 'name' => $lesson->name, 'order' => $lesson->order);
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

	public function updateorder()
	{
		$result = array();
		$arrStatus = array();
		$arrOrder = $this->input->post('arrOrder',TRUE);
		
		for ($i=0; $i < count($arrOrder); $i++) 
		{ 
			$id = explode("_", $arrOrder[$i]);
			$lesson = new Lesson();
			$lesson->where("id", $id[1])->get();
			if($lesson->exists()){
				$lesson->order = $i;
				if(!$lesson->save()){
					$arrStatus[] = 1;
				}	
			}else{
				$arrStatus[] = 1;
			}	
		}

		if(count($arrStatus) > 0){
			$result['message_status'] = 'error';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '');
		}else{
			$result['message_status'] = 'success';
			$result['message_description'] = 'Orden del Tema actualizado correctamente';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
		}

		echo json_encode($result);
	}
}