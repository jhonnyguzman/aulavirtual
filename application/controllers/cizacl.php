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

class Cizacl extends CI_Controller	{
	
	public function __construct()
	{
		parent::__construct();
		$this->lang->load('cizacl',$this->config->item('language'));
		if(!class_exists('CI_cizacl'))
			show_error($this->lang->line('library_not_loaded'));
		$this->load->model('cizacl_mdl');
	}
	
	public function index()	{
		
		/*if($this->cizacl->check_isAllowed($this->session->userdata("role_id"), 'cizacl', 'index')){
			echo "tiene permisos";
		}else{
			echo "No tiene permisos";
		}*/

		$data['summary'] = '<p align="center" class="summary">'.$this->lang->line('accounts').': <strong>'.$this->db->count_all_results('users').'</strong></p>';
		$data['summary'] .= '<p>&nbsp;</p>';
		$this->db->order_by('name');
		$query = $this->db->get('roles');
		if($query->num_rows())	{
			$data['summary'] .= '<p align="center" class="summary">';
			foreach($query->result() as $row)	{
				$this->db->where('role_id = '.$row->id);
				$data['summary'] .= $row->name.': <strong>'.$this->db->count_all_results('users').'</strong>, ';
			}
			$data['summary'] = substr($data['summary'],0,-2);
			$data['summary'] .= '</p>';
		}
		$data['summary'] .= '<p>&nbsp;</p>';
		$this->db->order_by('name');
		$query = $this->db->get('user_status');
		if($query->num_rows())	{
			$data['summary'] .= '<p align="center" class="summary">';
			foreach($query->result() as $row)	{
				$this->db->where('user_status_code = '.$row->code);
				$data['summary'] .= ucwords(str_replace(array('enabled','disabled','blocked'),array($this->lang->line('enabled'),$this->lang->line('disabled'),$this->lang->line('blocked')),$row->name)).': <strong>'.$this->db->count_all_results('users').'</strong>, ';
			}
			$data['summary'] = substr($data['summary'],0,-2);
			$data['summary'] .= '</p>';
		}
		$data['summary'] .= '<p>&nbsp;</p>';
		$this->db->order_by('resource_controller');
		$data['summary'] .= '<p align="center" class="summary">'.$this->lang->line('controllers').': <strong>'.$this->db->count_all_results('resources').'</strong>, ';
		$this->db->where('resource_function IS NOT NULL');
		$this->db->order_by('resource_function');
		$data['summary'] .= $this->lang->line('functions').': <strong>'.$this->db->count_all_results('resources').'</strong></p>';
		$this->load->view('cizacl/main', $data);
	}
	
	//Users
	public function users()
	{
		$this->load->view('cizacl/users');
	}
	
	public function user_view($id)
	{
		$this->db->from('users as u');
		$this->db->from('user_profiles as up');
		$this->db->from('roles as r');
		$this->db->from('user_status as us');
		$this->db->where('u.id = '.$id);
		$this->db->where('u.id = up.user_id');
		$this->db->where('role_id = r.id');
		$this->db->where('up.user_status_code = user_status_code');
		$query = $this->db->get();
		$data['row'] = $query->row();
		
		$this->load->view('cizacl/user_view',$data);
	}
	
	public function user_add()
	{
		$this->load->helper('form');

		$this->db->order_by('name');
		$query = $this->db->get('roles');
		$roles[0] = $this->lang->line('select_option');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;
		
		$this->db->order_by('name');
		$query = $this->db->get('user_status');
		$status[0] = $this->lang->line('select_option');
		foreach($query->result() as $row)
			$status[$row->id] = $this->lang->line(strtolower($row->name));
		
		$data['body'] = array(
			'title'	=> $this->lang->line('add_user')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('add'),
			'hidden'		=> array(
				'oper'		=> 'add'
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name',
			),
			'surname'		=> array(
				'name'		=> 'surname',
				'id'		=> 'surname',
			),
			'email'			=> array(
				'name'		=> 'email',
				'id'		=> 'email',
				'size'		=> 40
			),
			'username'		=> array(
				'name'		=> 'username',
				'id'		=> 'username',
			),
			'pwd'			=> array(
				'name'		=> 'pwd',
				'id'		=> 'pwd',
				'size'		=> 16
			),
			'role'		=> array(
				'name'		=> 'role',
				'attributes'=> 'id = "role"',
				'options'	=> $roles,
				'selected'	=> 2
			),
			'status'		=> array(
				'name'		=> 'status',
				'attributes'=> 'id = "status"',
				'options'	=> $status,
				'selected'	=> 1
			)
		);
		
		$this->load->view('cizacl/user_oper',$data);
	}

	public function user_edit($id)
	{
		$this->load->helper('form');
		
		$this->db->order_by('order');
		$query = $this->db->get('roles');
		$roles[0] = $this->lang->line('select_option');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;
		
		$this->db->order_by('name');
		$query = $this->db->get('user_status');
		$status[0] = $this->lang->line('select_option');
		foreach($query->result() as $row)
			$status[$row->id] = $this->lang->line(strtolower($row->name));
		
		$this->db->from('users');
		$this->db->where('id = '.$id);
		$query = $this->db->get();
		$row = $query->row();

		$data['body'] = array(
			'title'	=> $this->lang->line('edit_user')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('edit'),
			'hidden'		=> array(
				'oper'		=> 'edit',
				'id'		=> $row->id
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name',
				'value'		=> $row->name
			),
			'surname'		=> array(
				'name'		=> 'surname',
				'id'		=> 'surname',
				'value'		=> $row->surname
			),
			'email'			=> array(
				'name'		=> 'email',
				'id'		=> 'email',
				'size'		=> 40,
				'value'		=> $row->email
			),
			'username'		=> array(
				'name'		=> 'username',
				'id'		=> 'username',
				'value'		=> $row->username
			),
			'pwd'			=> array(
				'name'		=> 'pwd',
				'id'		=> 'pwd',
			),
			'role'		=> array(
				'name'		=> 'role',
				'attributes'=> 'id = "role"',
				'options'	=> $roles,
				'selected'	=> $row->role_id
			),
			'status'		=> array(
				'name'		=> 'status',
				'attributes'=> 'id = "status"',
				'options'	=> $status,
				'selected'	=> $row->user_status_code
			)
		);
		
		$this->load->view('cizacl/user_oper',$data);
	}

	public function users_op()
	{
		if($this->input->post('oper') == 'add')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[50]');
			$this->form_validation->set_rules('surname', $this->lang->line('surname'), 'required|max_length[50]');
			$this->form_validation->set_rules('email', $this->lang->line('email'), 'required|valid_email|max_length[100]');
			$this->form_validation->set_rules('username', $this->lang->line('username'), 'required|valid_username|max_length[80]');
			$this->form_validation->set_rules('pwd', $this->lang->line('password'), 'required|min_length[5]|max_length[16]|');
			$this->form_validation->set_rules('role', $this->lang->line('role'), 'required|valid_option');
			$this->form_validation->set_rules('status', $this->lang->line('state'), 'required|valid_option');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$addnew = array(
					'username'		=> $this->input->post('username',true),
					'password'		=> md5($this->input->post('pwd',true)),
					'role_id'	=> $this->input->post('role',true),
					'user_status_code'	=> $this->input->post('status',true),
					'name'				=> $this->input->post('name',true),
					'surname'			=> $this->input->post('surname',true),
					'email'			=> $this->input->post('email',true),
					'added'			=> mktime(),
					'added_by'			=> $this->session->userdata('user_id')
				);
				if($this->db->insert('users',$addnew))	{
					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				}
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'edit')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[50]');
			$this->form_validation->set_rules('surname', $this->lang->line('surname'), 'required|max_length[50]');
			$this->form_validation->set_rules('email', $this->lang->line('email'), 'required|valid_email|max_length[100]');
			$this->form_validation->set_rules('username', $this->lang->line('username'), 'required|max_length[80]');
			$this->form_validation->set_rules('pwd', $this->lang->line('password'), 'min_length[5]|max_length[16]|');
			$this->form_validation->set_rules('role', $this->lang->line('role'), 'required|valid_option');
			$this->form_validation->set_rules('status', $this->lang->line('state'), 'required|valid_option');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$update = array(
					'id'			=> $this->input->post('id',true),
					'username'			=> $this->input->post('username',true),
					'role_id'			=> $this->input->post('role',true),
					'user_status_code'	=> $this->input->post('status',true),
					'name'				=> $this->input->post('name',true),
					'surname'			=> $this->input->post('surname',true),
					'email'				=> $this->input->post('email',true),
					'edited'			=> mktime(),
					'edited_by'			=> $this->session->userdata('user_id')
				);
				$pwd = $this->input->post('pwd');
				if(!empty($pwd))	{
					$update['password'] = md5($this->input->post('pwd',true));
				}
				if($this->db->update('users', $update, 'id = '.$this->input->post('id')))	{
					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				}
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'del')	{
			$this->db->where('id = '.$this->input->post('id',true));
			$query = $this->db->get('users');
			if($query->num_rows())	{
				$row = $query->row();
				if((string)$row->added_by !== "0")	{	// Protect system's data
					if($this->db->delete('users', array('id' => $this->input->post('id'))))
						die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
					else
						die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
				}
				else
					show_error($this->lang->line('system_data'));
			}
		}
	}
	
	public function users_load_data()
	{
		$data = new stdClass();
		$page	= $this->input->post('page');
		$limit	= $this->input->post('rows');
		$sidx	= $this->input->post('sidx');
		$sord	= $this->input->post('sord');
		
		$count = $this->db->count_all_results('users');
		
		$total_pages = $count > 0 ? ceil($count/$limit) : 0;
		
		if ($page > $total_pages)
			$page=$total_pages;
		
		$start = $limit*$page - $limit;
		if($start < 0)
			$start = 0;
		
		if($this->input->post('_search')=='true')	{
			$json = json_decode($this->input->post('filters'),true);
			
			foreach($json['rules'] as $key=>$value)	{
				if($json['groupOp'] == 'AND')
					$this->db->where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
				else
					$this->db->or_where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
			}
		}
		$this->db->select("u.*, us.name as user_status_name, r.name as role_name");
		$this->db->from('users as u');
		$this->db->from('user_status as us');
		$this->db->from('roles as r');
		$this->db->where('u.role_id = r.id');
		$this->db->where('u.user_status_code = us.code');
		$this->db->order_by($sidx,$sord);
		$this->db->limit($limit,$start);
		$query = $this->db->get();
		
		$data->page = (string)$page;
		$data->total = (string)$total_pages;
		$data->records = (string)$count;
		$i = 0;
		foreach($query->result() as $row)	{
			$data->rows[$i]['id'] = $row->id;
			$data->rows[$i]['cell'] = array(
				$row->id,
				$row->surname,
				$row->name,
				$row->email,
				$row->role_name,
				$row->user_status_name,
				$this->cizacl_mdl->mktime_format($row->lastaccess),
				$this->cizacl_mdl->getUser($row->added_by),
				$row->added_by
			);
			$i++;
		}
		echo json_encode($data);
	}
	
	//Sessions
	public function sessions()
	{
		$this->load->view('cizacl/sessions');
	}
	
	public function sessions_op()
	{
		if($this->input->post('oper') == 'del')	{
			$id = explode(',',$this->input->post('id'));
			foreach($id as $value)	{
				if($this->db->delete('session', array('id' => $value)))
					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				else	{
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
				}
			}
		}
	}
	
	public function sessions_load_data()
	{
		$data = new stdClass();
		$page	= $this->input->post('page');
		$limit	= $this->input->post('rows');
		$sidx	= $this->input->post('sidx');
		$sord	= $this->input->post('sord');
		
		$count = $this->db->count_all_results('sessions');
		
		$total_pages = $count > 0 ? ceil($count/$limit) : 0;
		
		if ($page > $total_pages)
			$page = $total_pages;
		
		$start = $limit*$page - $limit;
		
		if($start < 0)
			$start = 0;
		
		if($this->input->post('_search')=='true')	{
			$json = json_decode($this->input->post('filters'),true);
			
			foreach($json['rules'] as $key=>$value)	{
				if($json['groupOp'] == 'AND')
					$this->db->where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
				else
					$this->db->or_where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
			}
		}
		
		$this->db->order_by($sidx,$sord);
		$this->db->limit($limit,$start);
		$query = $this->db->get('sessions');

		$data->page = (string)$page;
		$data->total = (string)$total_pages;
		$data->records = (string)$count;
		$i = 0;
		foreach($query->result() as $row)	{
			$array = unserialize($row->user_data);
			$data->rows[$i]['id'] = $row->session_id;
			$data->rows[$i]['cell'] = array(
				$this->cizacl_mdl->getUser($array['user_id']),
				$row->session_id,
				$row->ip_address,
				$row->user_agent,
				date('d/m/Y H:i:s',$row->last_activity),
			);
			$i++;
		}
		echo json_encode($data);
	}
	
	//ACL
	public function management()
	{
		$this->load->view('cizacl/management');
	}
	
	public function role_add()
	{
		$this->load->helper('form');
		
		$array = json_decode($this->cizacl_mdl->getResources());
		$resources[0] = $this->lang->line('select_option');
		foreach($array->rows as $value)	{
			$resources[$value->value] = $value->name;
		}
		
		$this->db->order_by('order');
		$query = $this->db->get('roles');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;

		$data['body'] = array(
			'title'	=> $this->lang->line('add_role')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('add'),
			
			'hidden'		=> array(
				'oper'		=> 'add'
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name'
			),
			'inherit'	=> array(
				'name'		=> 'inherit_id[]',
				'attributes'=> 'id = "inherit_id[]"',
				'options'	=> $roles,
				'selected'	=> ''
			),
			'redirect'	=> array(
				'name'		=> 'redirect',
				'attributes'=> 'id = "redirect"',
				'options'	=> $resources,
				'selected'	=> ''
			),
			'description'		=> array(
				'name'		=> 'description',
				'id'		=> 'description',
			),
			'default'		=> array(
				'name'		=> 'default',
				'attributes'=> 'id = "default"',
				'options'	=> array(
					0		=> $this->lang->line('no'),
					1		=> $this->lang->line('yes')
				),
				'selected'	=> 0
			),
			'order'			=> array(
				'name'		=> 'order',
				'id'		=> 'order',
				'value'		=> 998,
				'size'		=> 3
			)
		);
		
		$this->load->view('cizacl/role_oper',$data);
	}

	public function role_edit()
	{
		$this->load->helper('form');

		$array = json_decode($this->cizacl_mdl->getResources());
		$resources[0] = $this->lang->line('select_option');
		foreach($array->rows as $value)	{
			$resources[$value->value] = $value->name;
		}
		
		$this->db->order_by('order');
		$query = $this->db->get('roles');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;
		
		$this->db->where('id = '.$this->uri->segment(3));
		$query = $this->db->get('roles');
		$row = $query->row();
		
		$data['body'] = array(
			'title'	=> $this->lang->line('edit_role')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('edit'),
			
			'hidden'		=> array(
				'oper'		=> 'edit',
				'id'		=> $row->id
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name',
				'value'		=> $row->name
			),
			'inherit'	=> array(
				'name'		=> 'inherit_id[]',
				'attributes'=> 'id = "inherit_id[]"',
				'options'	=> $roles,
				'selected'	=> json_decode($row->inherit_id)
			),
			'redirect'	=> array(
				'name'		=> 'redirect',
				'attributes'=> 'id = "redirect"',
				'options'	=> $resources,
				'selected'	=> $row->redirect
			),
			'description'		=> array(
				'name'		=> 'description',
				'id'		=> 'description',
				'value'		=> $row->description
			),
			'default'		=> array(
				'name'		=> 'default',
				'attributes'=> 'id = "default"',
				'options'	=> array(
					0		=> $this->lang->line('no'),
					1		=> $this->lang->line('yes')
				),
				'selected'	=> $row->default
			),
			'order'			=> array(
				'name'		=> 'order',
				'id'		=> 'order',
				'size'		=> 3,
				'value'		=> $row->order
			)
		);
		
		$this->load->view('cizacl/role_oper',$data);
	}
	
	public function roles_op()
	{
		if($this->input->post('oper') == 'add')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[20]');
			$this->form_validation->set_rules('redirect', $this->lang->line('redirect'), 'required|valid_option');
			$this->form_validation->set_rules('description', $this->lang->line('description'), 'max_length[255]');
			$this->form_validation->set_rules('order', $this->lang->line('order'), 'required|integer|max_length[3]');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$inherit_id = $this->cizacl_mdl->check_null($this->input->post('inherit_id',true));
				if(!empty($inherit_id))
					$inherit_id = json_encode($inherit_id);
				else
					$inherit_id = NULL;
							
				$addnew = array(
					'name'			=> $this->input->post('name',true),
					'inherit_id'	=> $inherit_id,
					'redirect'		=> $this->input->post('redirect',true),
					'description'	=> $this->input->post('description',true),
					'default'		=> $this->input->post('default',true),
					'order'		=> $this->input->post('order',true)
				);
				if($this->db->insert('roles',$addnew))	{
					if($this->input->post('default') == 1)
						$this->db->update('roles', array('default' => 0), 'id <> '.$this->db->insert_id());

					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				}
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'edit')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[20]');
			$this->form_validation->set_rules('redirect', $this->lang->line('redirect'), 'required|valid_option');
			$this->form_validation->set_rules('description', $this->lang->line('description'), 'max_length[255]');
			$this->form_validation->set_rules('order', $this->lang->line('order'), 'required|integer|max_length[3]');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$inherit_id = $this->input->post('inherit_id',true);
				if(!empty($inherit_id))
					$inherit_id = json_encode($inherit_id);
				else
					$inherit_id = NULL;
				
				$update = array(
					'name'			=> $this->input->post('name',true),
					'inherit_id'	=> $inherit_id,
					'redirect'		=> $this->input->post('redirect',true),
					'description'	=> $this->input->post('description',true),
					'default'		=> $this->input->post('default',true),
					'order'		=> $this->input->post('order',true)
				);
				if($this->db->update('roles', $update, 'id = '.$this->input->post('id')))	{
					if($this->input->post('default',true) == 1)
						$this->db->update('roles', array('default' => 0), 'id <> '.$this->input->post('id'));

					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				}
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'del')	{
			$id = explode(',',$this->input->post('id',true));
			foreach($id as $value)	{
				$this->db->where('role_id = '.$value);
				$query = $this->db->get('users');
				if($query->num_rows())	{
					$users = array();
					foreach($query->result() as $row)
						$users[] = $row->user_id;
				}
				
				if(isset($users) && !empty($users))	{
					foreach($users as $user_id)	{
						$this->db->delete('users', array('id' => $user_id));
						$this->db->delete('user_profiles', array('user_id ' => $user_id));
					}
				}
				
				$this->db->delete('roles', array('id' => $value));
				$this->db->delete('rules', array('role_id' => $value));
			}
		}
	}
	
	public function roles_load_data()
	{
		$data = new stdClass();
		$page	= $this->input->post('page');
		$limit	= $this->input->post('rows');
		$sidx	= $this->input->post('sidx');
		$sord	= $this->input->post('sord');
		
		$count = $this->db->count_all_results('roles');
		
		$total_pages = $count > 0 ? ceil($count/$limit) : 0;
		
		if ($page > $total_pages)
			$page = $total_pages;
		
		$start = $limit*$page - $limit;
		
		if($start < 0)
			$start = 0;
		
		if($this->input->post('_search')=='true')	{
			$json = json_decode($this->input->post('filters'),true);
			
			foreach($json['rules'] as $key=>$value)	{
				if($json['groupOp'] == 'AND')
					$this->db->where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
				else
					$this->db->or_where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
			}
		}
		
		$this->db->order_by($sidx,$sord);
		$this->db->order_by('inherit_id');
		$this->db->limit($limit,$start);
		$query = $this->db->get('roles');

		$data->page = (string)$page;
		$data->total = (string)$total_pages;
		$data->records = (string)$count;
		$i = 0;
		foreach($query->result() as $row)	{
			$row->inherit = array();
			if($row->inherit_id)	{
				foreach(json_decode($row->inherit_id) as $inherit_id)	{
					$this->db->where('id = '.$inherit_id);
					$subquery = $this->db->get('roles');
					$subrow = $subquery->row();
					$row->inherit[] = $subrow->name;
				}
			}
			
			$row->default = $row->default == 1 ? true : false;
			
			$data->rows[$i]['id'] = $row->id;
			$data->rows[$i]['cell'] = array(
				$row->id,
				$row->name,
				implode(", ", $row->inherit),
				$row->redirect,
				$row->description,
				$row->order,
				$row->default,
			);
			$i++;
		}
		echo json_encode($data);
	}

	public function resource_add()
	{
		$this->load->helper('form');
		
		$this->db->where('resource_function');
		$this->db->order_by('resource_controller');
		$query = $this->db->get('resources');
		$controllers[0] = $this->lang->line('select_option');
		foreach($query->result() as $controller)	{
			$controllers[strtolower($controller->resource_controller)] = $controller->resource_controller;
		}

		$data['body'] = array(
			'title'	=> $this->lang->line('add_resource')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('add'),
			
			'hidden'		=> array(
				'oper'		=> 'add'
			),
			'type'			=> array(
				'name'		=> 'type',
				'attributes'=> 'id = "type"',
				'options'	=> array(
					'controller'	=> $this->lang->line('controller'),
					'function'		=> $this->lang->line('function')
				),
				'selected'	=> ''
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name'
			),
			'controller'	=> array(
				'name'		=> 'controller',
				'attributes'=> 'id = "controller"',
				'options'	=> $controllers,
				'selected'	=> '0'
			),
			'description'		=> array(
				'name'		=> 'description',
				'id'		=> 'description',
				'rows'		=> 3,
				'cols'		=> 45
			)
		);
		
		$this->load->view('cizacl/resource_oper',$data);
	}

	public function resource_edit()
	{
		$this->load->helper('form');

		$this->db->where('resource_function');
		$this->db->order_by('resource_controller');
		$query = $this->db->get('resources');
		$controllers[0] = $this->lang->line('select_option');
		foreach($query->result() as $controller)	{
			$controllers[strtolower($controller->resource_controller)] = $controller->resource_controller;
		}

		$this->db->where('id = '.$this->uri->segment(3));
		$query = $this->db->get('resources');
		$row = $query->row();
		
		if($row->type == 'controller')
			$name = $row->resource_controller;
		else
			$name = $row->resource_function;
		
		$data['body'] = array(
			'title'	=> $this->lang->line('edit_resource')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1'
			),
			'submit'		=> $this->lang->line('edit'),
			
			'hidden'		=> array(
				'oper'		=> 'edit',
				'id'		=> $row->id
			),
			'type'			=> array(
				'name'		=> 'type',
				'attributes'=> 'id = "type"',
				'options'	=> array(
					'controller'	=> $this->lang->line('controller'),
					'function'		=> $this->lang->line('function')
				),
				'selected'	=> $row->type
			),
			'name'			=> array(
				'name'		=> 'name',
				'id'		=> 'name',
				'value'		=> $name
			),
			'controller'	=> array(
				'name'		=> 'controller',
				'attributes'=> 'id = "controller"',
				'options'	=> $controllers,
				'selected'	=> $row->resource_controller
			),
			'description'		=> array(
				'name'		=> 'description',
				'id'		=> 'description',
				'rows'		=> 3,
				'cols'		=> 45,
				'value'		=> $row->description
			)
		);
		
		$this->load->view('cizacl/resource_oper',$data);
	}
	
	public function resources_op()
	{
		if($this->input->post('oper') == 'add')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[50]');
			if($this->input->post('type') == 'function')
				$this->form_validation->set_rules('controller', $this->lang->line('controller'), 'valid_option');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				if($this->input->post('type') == 'controller')	{
					$addnew = array(
						'type'			=> $this->input->post('type',true),
						'resource_controller'	=> strtolower($this->input->post('name',true)),
						'resource_function'		=> NULL,
						'description'	=> $this->input->post('description',true),
						'added_on'		=> mktime(),
						'added_by'		=> $this->session->userdata('user_id')
					);
				}
				else	{
					$addnew = array(
						'type'			=> $this->input->post('type',true),
						'resource_controller'	=> $this->input->post('controller',true),
						'resource_function'		=> strtolower($this->input->post('name',true)),
						'description'	=> $this->input->post('description',true),
						'added_on'		=> mktime(),
						'added_by'		=> $this->session->userdata('user_id')
					);
				}
				if($this->db->insert('resources',$addnew))
					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'edit')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_rules('name', $this->lang->line('name'), 'required|max_length[50]');
			if($this->input->post('type') == 'function')
				$this->form_validation->set_rules('controller', $this->lang->line('controller'), 'valid_option');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				if($this->input->post('type',true) == 'controller')	{
					$update = array(
						'type'			=> $this->input->post('type',true),
						'resource_controller'	=> strtolower($this->input->post('name',true)),
						'resource_function'		=> NULL,
						'description'	=> $this->input->post('description',true),
						'edited_on'	=> mktime(),
						'edited_by'	=> $this->session->userdata('user_id')
					);
				}
				else	{
					$update = array(
						'type'			=> $this->input->post('type',true),
						'resource_controller'	=> $this->input->post('controller',true),
						'resource_function'		=> strtolower($this->input->post('name',true)),
						'description'	=> $this->input->post('description',true),
						'edited_on'	=> mktime(),
						'edited_by'	=> $this->session->userdata('user_id')
					);
				}
				if($this->db->update('resources', $update, 'id = '.$this->input->post('id',true)))
					die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
				else
					die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
			}
		}
		elseif($this->input->post('oper') == 'del')	{
			$this->db->where('id = '.$this->input->post('id',true));
			$query = $this->db->get('resources');
			if($query->num_rows())	{
				$row = $query->row();
				if((string)$row->added_by !== "0")	{	// Protect system's data
					if($row->type == 'controller')	{
						if($this->db->delete('resources', array('resource_controller' => $row->resource_controller)))
							die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
						else
							die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
					}
					else	{
						if($this->db->delete('resources', array('id' => $this->input->post('id',true))))
							die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
						else
							die($this->cizacl->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));
					}
				}
				else
					show_error($this->lang->line('system_data'));
			}
		}

	}
	
	public function resources_load_data()
	{
		$data = new stdClass();
		$page	= $this->input->post('page');
		$limit	= $this->input->post('rows');
		$sidx	= $this->input->post('sidx');
		$sord	= $this->input->post('sord');
		
		$count = $this->db->count_all_results('resources');

		$total_pages = $count > 0 ? ceil($count/$limit) : 0;
		
		if ($page > $total_pages)
			$page = $total_pages;
		
		$start = $limit*$page - $limit;
		
		if($start < 0)
			$start = 0;
		
		if($this->input->post('_search')=='true')	{
			$json = json_decode($this->input->post('filters'),true);
			
			foreach($json['rules'] as $key=>$value)	{
				if($json['groupOp'] == 'AND')
					$this->db->where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
				else
					$this->db->or_where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
			}
		}
		
		$this->db->order_by($sidx,$sord);
		$this->db->order_by('resource_function');
		$this->db->limit($limit,$start);
		$query = $this->db->get('resources');

		$data->page = (string)$page;
		$data->total = (string)$total_pages;
		$data->records = (string)$count;
		$i = 0;
		foreach($query->result() as $row)	{
			$data->rows[$i]['id'] = $row->id;
			$data->rows[$i]['cell'] = array(
				$row->id,
				$row->resource_controller,
				$row->resource_function,
				$row->description,
				$row->added_by,
			);
			$i++;
		}
		echo json_encode($data);
	}

	public function rule_add()
	{
		$this->load->helper('form');

		$this->db->order_by('order');
		$query = $this->db->get('roles');
		$roles[0]		= $this->lang->line('select_option');
		$roles['NULL']	= $this->lang->line('all_roles');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;

		$data['body'] = array(
			'title'	=> $this->lang->line('add_rule')
		);
		
		$data['form'] = array(
			'action'		=> '#',
			'attributes'	=> array(
				'name'		=> 'form1',
				'id'		=> 'form1',
				'oper'		=> 'add'
			),
			'submit'		=> $this->lang->line('add'),
			
			'hidden'		=> array(
				'oper'		=> 'add'
			),
			'role'	=> array(
				'name'		=> 'role_id',
				'attributes'=> 'id = "role_id"',
				'options'	=> $roles,
				'selected'	=> ''
			)
		);
		
		$this->load->view('cizacl/rule_oper',$data);
	}

	public function rule_edit()
	{
		$this->load->helper('form');

		$this->db->order_by('order');
		$query = $this->db->get('roles');
		$roles[0]		= $this->lang->line('select_option');
		$roles['NULL']	= $this->lang->line('all_roles');
		foreach($query->result() as $row)
			$roles[$row->id] = $row->name;

		$this->db->where('id = '.$this->uri->segment(3));
		$data['query'] = $this->db->get('rules');
		$row = $data['query']->row();
		
		if($row->role_id == NULL)
			$row->role_id = 'NULL';
		
		$data['body'] = array(
			'title'	=> $this->lang->line('edit_rule')
		);
		
		$data['form'] = array(
			'action'			=> '#',
			'attributes'		=> array(
				'name'			=> 'form1',
				'id'			=> 'form1',
				'oper'			=> 'edit'
			),
			'submit'			=> $this->lang->line('edit'),
			
			'hidden'			=> array(
				'oper'			=> 'edit',
				'id'			=> $row->role_id,
			),
			'role'				=> array(
				'name'			=> 'cizacl_role_id',
				'attributes'	=> 'id = "role_id"',
				'options'		=> $roles,
				'selected'		=> $row->role_id
			)
		);
		
		$this->load->view('cizacl/rule_oper',$data);
	}

	public function rules_op()
	{
		if($this->input->post('oper') == 'add')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_message('required', $this->lang->line('valid_rule'));
			$this->form_validation->set_rules('role_id', $this->lang->line('role'), 'valid_option');
			$this->form_validation->set_rules('type', $this->lang->line('rules'), 'required');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$type_array			= $this->input->post('type',true);
				$controller_array	= $this->input->post('controller',true);
				$function_array		= $this->input->post('function',true);
				$status_array		= $this->input->post('status',true); 
				$description_array	= $this->input->post('description',true);
				
				foreach($type_array as $id => $type)	{
					foreach($controller_array[$id] as $tkey => $tvalue)	{
						if(strtolower($controller_array[$id][$tkey]) == 'null')
							$controller_array[$id][$tkey] = NULL;
					}
					if(strtolower($controller_array[$id][0]) == 'null')
						$controller_array[$id] = json_encode(array(NULL));
					else
						$controller_array[$id] = json_encode($controller_array[$id]);
					
					foreach($function_array[$id] as $tkey => $tvalue)	{
						if(strtolower($function_array[$id][$tkey]) == 'null')
							$function_array[$id][$tkey] = NULL;
					}
					if(strtolower($function_array[$id][0])  == 'null')
						$function_array[$id] = NULL;
					else
						$function_array[$id] = json_encode($function_array[$id]);
					
					$addnew = array(
						'role_id'				=> $this->cizacl_mdl->check_null($this->input->post('role_id',true)),
						'type'						=> $type,
						'resource_controller'	=> $controller_array[$id],
						'resource_function'		=> $function_array[$id],
						'status'						=> $status_array[$id],
						'description'					=> $description_array[$id]
					);
					$this->db->insert('rules',$addnew);
					unset($addnew);
				}
				die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
			}
		}
		elseif($this->input->post('oper') == 'edit')	{
			$this->load->library('form_validation');
			
			$this->form_validation->set_message('required', $this->lang->line('valid_rule'));
			$this->form_validation->set_rules('role_id', $this->lang->line('role'), 'valid_option');
			$this->form_validation->set_rules('type', $this->lang->line('rules'), 'required');
			
			if ($this->form_validation->run() == false)	{
				die($this->cizacl->json_msg('error',$this->lang->line('attention'),validation_errors("<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>","</p>"),true));
			}
			else	{
				$this->db->where('role_id = '.$this->input->post('id',true));
				$this->db->delete('rules');
				
				$type_array			= $this->input->post('type',true);
				$controller_array	= $this->input->post('controller',true);
				$function_array	= $this->input->post('function',true);
				$status_array		= $this->input->post('status',true); 
				$description_array	= $this->input->post('description',true);
				
				foreach($type_array as $id => $type)	{
					foreach($controller_array[$id] as $tkey => $tvalue)	{
						if(strtolower($controller_array[$id][$tkey]) == 'null')
							$controller_array[$id][$tkey] = NULL;
					}
					if(strtolower($controller_array[$id][0]) == 'null')
						$controller_array[$id] = json_encode(array(NULL));
					else
						$controller_array[$id] = json_encode($controller_array[$id]);
					
					foreach($function_array[$id] as $tkey => $tvalue)	{
						if(strtolower($function_array[$id][$tkey]) == 'null')
							$function_array[$id][$tkey] = NULL;
					}
					if(strtolower($function_array[$id][0])  == 'null')
						$function_array[$id] = NULL;
					else
						$function_array[$id] = json_encode($function_array[$id]);
					
					$addnew = array(
						'role_id'				=> $this->cizacl_mdl->check_null($this->input->post('cizacl_role_id',true)),
						'type'						=> $type,
						'resource_controller'	=> $controller_array[$id],
						'resource_function'		=> $function_array[$id],
						'status'						=> $status_array[$id],
						'description'					=> $description_array[$id]
					);
					$this->db->insert('rules', $addnew);
					unset($addnew);
				}
				die($this->cizacl->json_msg('success',$this->lang->line('completed'),$this->lang->line('operation_done')));
			}
		}
		elseif($this->input->post('oper') == 'del')	{
			$id = explode(',',$this->input->post('id'));
			foreach($id as $value)	{
				$this->db->delete('rules', array('id' => $value));
			}
		}
	}
	
	public function rules_load_data()
	{
		$data = new stdClass();
		$page	= $this->input->post('page');
		$limit	= $this->input->post('rows');
		$sidx	= $this->input->post('sidx');
		$sord	= $this->input->post('sord');
		
		$count = $this->db->count_all_results('rules');
		
		$total_pages = $count > 0 ? ceil($count/$limit) : 0;
		
		if ($page > $total_pages)
			$page = $total_pages;
		
		$start = $limit*$page - $limit;
		
		if($start < 0)
			$start = 0;
		
		if($this->input->post('_search')=='true')	{
			$json = json_decode($this->input->post('filters'),true);
			
			foreach($json['rules'] as $key=>$value)	{
				if($value['data'] == 'All' || $value['data'] == 'all')
					$value['data'] = 'null';
				if($json['groupOp'] == 'AND')
					$this->db->where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
				else
					$this->db->or_where($value['field'].' '.$this->cizacl_mdl->jqgrid_operator($value['op'],$value['data']));
			}
		}
		
		$this->db->from('rules');
		$this->db->order_by('role_id');
		$this->db->order_by($sidx,$sord);
		$this->db->limit($limit,$start);
		$query = $this->db->get();

		$data->page = (string)$page;
		$data->total = (string)$total_pages;
		$data->records = (string)$count;
		$i = 0;
		foreach($query->result() as $row)	{
			$role_id = $row->role_id;
			if(!empty($role_id))	{
				$this->db->where('id = '.$row->role_id);
				$subquery	= $this->db->get('roles');
				$subrow		= $subquery->row();
			}
			else	{
				$subrow->id	= NULL;
				$subrow->name	= $this->lang->line('all_users');
			}
			$row->resource_controller = json_decode($row->resource_controller);
			if(empty($row->resource_controller[0]))
				$row->resource_controller[0] = $this->lang->line('all');
			else	{
				foreach($row->resource_controller as $key => $value)
					if(empty($value[$key])) $row->resource_controller[$key] = $this->lang->line('all');
			}
			$row->resource_function = json_decode($row->resource_function);
			if(empty($row->resource_function[0]))
				$row->resource_function[0] = $this->lang->line('all');
			else	{
				foreach($row->resource_function as $key => $value)
					if(empty($value[$key])) $row->resource_function[$key] = $this->lang->line('all');
			}
			$row->status = $row->status ? $this->lang->line('enabled') : $this->lang->line('disabled');
			$data->rows[$i]['id'] = $row->id;
			$data->rows[$i]['cell'] = array(
				$row->id,
				ucwords($row->type),
				$subrow->id,
				$subrow->name,
				implode(', ', $row->resource_controller),
				implode(', ', $row->resource_function),
				$row->status,
				$row->description,
			);
			$i++;
		}
		echo json_encode($data);
	}
	
	//jQuery Loader
	public function getControllers($null='')
	{
		echo $this->cizacl_mdl->getControllers();
	}
	
	public function getFunctions($null='')
	{
		echo $this->cizacl_mdl->getFunctions();
	}
	
	public function getRules($id)
	{
		echo $this->cizacl_mdl->getRules($id);
	}
	
	public function getResources()
	{
		echo $this->cizacl_mdl->getResources();
	}
}