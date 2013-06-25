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

}