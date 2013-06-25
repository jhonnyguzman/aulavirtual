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

class Signin extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function login()
	{
		$post = $this->input->post(NULL,TRUE);
		$u = new Login();

		$u->where('email', $post['email']);
		$u->where('password', md5($post['password']));
		$u->where('role_id',1);
		$u->where('user_status_code',1);
		$u->get();

		$u->error_message('login', 'Username or password invalid.');

		if($u->exists()){
			// In caso di primo accesso
			$lastaccess = !empty($u->lastaccess) ? $this->basicrud->mktime_format($u->lastaccess) : '-';
	
			$session = array(
				'logged_in'				=> true, 
				'user_email'			=> $u->email,
				'user_id'				=> $u->id,
				'user_name'				=> $u->name,
				'user_surname'			=> $u->surname,
				'user_lastaccess'		=> $lastaccess,
				'role_id'	=> $u->role_id
			);
					
			$u->lastaccess = mktime();
			$u->save();

			$this->session->set_userdata($session);
			redirect($u->role->redirect);
		}else{
			$data['errors'] = $u->error->string;
			$this->load->view('signin/index',$data);
		}
	}
}
?>