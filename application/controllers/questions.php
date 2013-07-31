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

class Questions extends CI_Controller {
	function __construct() {
        parent::__construct();
    }

    public function tf_add(){
		echo $this->load->view("questions/tf_add",array("quiz_id" => $this->input->post("quiz_id")));
	}

	public function tf_create(){
		$post = $this->input->post(NULL,TRUE);
		$result = array();
		$quiz = new Quiz();
		$quiz->where("id", $post['quiz_id'])->get();
		if($quiz->exists()){
			$pos = new Question();
			$last_pos = $pos->where("quiz_id", $post['quiz_id'])->order_by("order","desc")->limit(1)->get();
			$question = new Question();
			$question->quiz_id = $quiz->id;
			$question->description = $post["description"];
			$question->result = $post["result"];
			$question->type = $post["type"];
			$question->order = $last_pos->order + 1;
			if($question->save()){
				$questions = new Question();
				$result['questions'] = $questions->where("quiz_id", $post['quiz_id'])->order_by("order","asc")->get()->all_to_array(
					array('id','description','result','order','type', 'type_description','quiz_id'));
				$result['message_status'] = 'success';
				$result['message_description'] = 'Pregunta creada correctamente';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
			}else{
				$result['message_status'] = 'error';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $question->error->string);
			}

		}else{
			//show_404('page',FALSE);
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
		$arrPos = array();
		$arrOrder = $this->input->post('arrOrder',TRUE);
		
		for ($i=0; $i < count($arrOrder); $i++) 
		{ 
			$id = explode("_", $arrOrder[$i]);
			$question = new Question();
			$question->where("id", $id[1])->get();
			if($question->exists()){
				$question->order = $i;
				if(!$question->save()){
					$arrStatus[] = 1;
				}	
			}else{
				$arrStatus[] = 1;
			}
			$arrPos[] = $i;
		}

		if(count($arrStatus) > 0){
			$result['message_status'] = 'error';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '');
		}else{
			$result["pos"] = $arrPos;
			$result['message_status'] = 'success';
			$result['message_description'] = 'Orden de la Pregunta actualizado correctamente';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
		}

		echo json_encode($result);
	}
}	