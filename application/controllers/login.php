<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * CIzACL
 * 
 * @copyright	Copyright (c) Schizzoweb Web Agency
 * @website		http://www.schizzoweb.com
 * @version		1.2
 * @revision	2011-07-20
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/

class Login extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->lang->load('cizacl',$this->config->item('language'));
		if(!class_exists('CI_Cizacl'))
			show_error($this->lang->line('library_not_loaded'));
		$this->load->library('cizacl');
		$this->load->library('login');
		$this->load->model('login_mdl');
		$this->load->model('cizacl_mdl');
	}

	function index()
	{
		$this->load->view('cizacl/login');
	}

	function check_login()
	{
		$this->load->library('form_validation');
		
		$this->form_validation->set_rules('username', $this->lang->line('username'), 'required');
		$this->form_validation->set_rules('password', $this->lang->line('password'), 'required');
		
		if ($this->form_validation->run() == false)	{
			die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
		}
		else	{
			$this->load->model('login_mdl');
			$check_user_login = $this->login_mdl->check_user_login($this->input->post('username',true),$this->input->post('password',true));
			
			if($check_user_login)	{
				if($this->login_mdl->check_user_disabled($this->input->post('username',true),$this->input->post('password',true)))
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('user_disabled'),true));
				elseif($this->login_mdl->check_user_block($this->input->post('username',true),$this->input->post('password',true)))	{
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('user_block'),true));
				}
				else	{
					$this->db->select("u.*, r.name as role_name, r.inherit_id, r.redirect, r.description, r.default, r.order");
					$this->db->from('users as u');
					$this->db->from('roles as r');
					$this->db->where('username',$this->input->post('username',true));
					$this->db->where('password',md5($this->input->post('password',true)));
					$this->db->where('u.role_id = r.id');
					$query = $this->db->get();
					$row = $query->row();
			
					// In caso di primo accesso
					$user_lastaccess = !empty($row->lastaccess) ? $this->cizacl_mdl->mktime_format($row->lastaccess) : '-';
			
					$session = array(
						'logged_in'				=> true, 
						'user_email'			=> $row->email,
						'user_id'				=> $row->id,
						'user_name'				=> $row->name,
						'user_surname'			=> $row->surname,
						'user_lastaccess'		=> $row->lastaccess,
						'role_id'	=> $row->role_id
					);
					
					$this->db->update('users', array('lastaccess ' => mktime()), 'id = '.$row->id);
					
					$this->session->set_userdata($session);
					die($this->cizacl->json_msg('success',$this->lang->line('wait'),$this->lang->line('login_progress'),false,site_url($row->redirect)));
				}
			}
			else
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('user_not_found')));

		}
	}
	
	function logout()
	{
		$this->session->sess_destroy();
		redirect();
	}
	
}
