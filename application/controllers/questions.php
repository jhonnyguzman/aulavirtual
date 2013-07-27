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
			$question = new Question();
			$question->quiz_id = $quiz->id;
			$question->description = $post["description"];
			$question->result = $post["result"];
			$question->type = $post["type"];
			if($question->save()){
				$result['question'] = array('id' => $question->id, 'description' => $question->description, 'result' => $question->result,'order' => $question->order, 'type' => $question->type, 'type-description' => $this->basicrud->getQuestionTypeDescription($question->type));
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
}	