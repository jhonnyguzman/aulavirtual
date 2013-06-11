<?php

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

class Cizacl_Mdl extends CI_Model	{
	
	function __construct()
	{
		parent::__construct();
	}
	
	function mktime_format($input,$format='Y-m-d H:i:s')
	{
		if(!empty($input))
			return date($format, $input);
		else
			return '-';
	}

	function jqgrid_operator($input,$input2)	{
		switch ($input)	{
			case "bw":
				$data = "LIKE '".$input2."%'";
				break;
			case "bn":
				$data = "NOT LIKE '".$input2."%'";
				break;
			case "in":
				$data = "1=1";
				break;
			case "ni":
				$data = "1=1";
				break;
			case "eq":
				if(is_numeric($input2))
					$data = "= ".$input2;
				else
					$data = "= '".$input2."'";
				break;
			case "ne":
				$data = "<> ".$input2;
				break;
			case "lt":
				$data = "< ".$input2;
				break;
			case "le":
				$data = "<= ".$input2;
				break;
			case "gt":
				$data = "> ".$input2;
				break;
			case "ge":
				$data = ">= ".$input2;
				break;
			case "ew":
				$data = "LIKE '%".$input2."'";
				break;
			case "cn":
				$data = "LIKE '%".$input2."%'";
				break;
			case "nc":
				$data = "NOT LIKE '%".$input2."%'";
				break;
		}
		return $data;
	}

	function getResources()
	{
		$this->db->where('type','controller');
		$this->db->order_by('controller');
		$query = $this->db->get('resources');
		
		foreach($query->result() as $row)	{
			$data->rows[] = array(
				'value'	=> $row->controller,
				'name'	=> $row->controller
			);
			$this->db->where('controller',$row->controller);
			$this->db->where('type','function');
			$this->db->order_by('function');
			$subquery = $this->db->get('resources');

			foreach($subquery->result() as $subrow)	{
				$data->rows[] = array(
					'value'	=> $row->controller . '/' . $subrow->function,
					'name'	=> $row->controller . '/' . $subrow->function,
				);
			}
			
		}
		
		if(!empty($data->rows))
			$data->response = true;
		else
			$data->response = false;
		
		return json_encode($data);
	}
	
	
	function getFunctions()
	{
		$this->db->where('type','function');
		$this->db->group_by('function');
		$this->db->order_by('function');
		$query = $this->db->get('resources');
		
		$data->rows[] = array(
			'id'		=> NULL,
			'value'		=> NULL,
			'name'		=> $this->lang->line('all')
		);
		
		foreach($query->result() as $row)	{
			$data->rows[] = array(
				'id'	=> $row->id,
				'value'	=> $row->function,
				'name'	=> $row->function
			);
		}
		
		if(!empty($data->rows))
			$data->response = true;
		else
			$data->response = false;
		
		return json_encode($data);
	}
	
	function getFunctionId($name)
	{
		$this->db->where('function',$name);
		$this->db->where('type','function');
		$this->db->group_by('function');
		$this->db->order_by('function');
		$this->db->limit(1);
		$query = $this->db->get('resources');
		
		if($query->num_rows())	{
			$row = $query->row();
			return $row->id;
		}
		else
			$data->response = 'null';
	}
	
	function getControllers()
	{
		$this->db->where('type','controller');
		$this->db->order_by('controller');
		$query = $this->db->get('resources');
		
		$data->rows[] = array(
			'id'		=> NULL,
			'value'		=> NULL,
			'name'		=> $this->lang->line('all')
		);
		
		foreach($query->result() as $row)	{
			$data->rows[] = array(
				'id'	=> $row->id,
				'value'	=> $row->controller,
				'name'	=> $row->controller
			);
		}
		
		if(!empty($data->rows))
			$data->response = true;
		else
			$data->response = false;
		
		return json_encode($data);
	}
	
	function getControllerId($name)
	{
		$this->db->where('controller',$name);
		$this->db->where('type','controller');
		$this->db->order_by('controller');
		$this->db->limit(1);
		$query = $this->db->get('resources');
		
		if($query->num_rows())	{
			$row = $query->row();
			return $row->id;
		}
		else
			$data->response = 'null';
	}
	
	function getDefaultUser($role_id)
	{
		if (empty($role_id))	{
			$this->db->where('default = 1');
			$query = $this->db->get('roles');
			if($query->num_rows())	{
				$role = $query->row();
				return $role->id;
			}
			else
				return false;
		}
		else
			return $this->session->userdata('role_id');
	}
	
	function getRules($id='NULL')
	{
		if(empty($id) || strtolower($id) == 'null')
			$this->db->where('role_id');
		else
			$this->db->where('role_id = '.$id);
		$this->db->order_by('type');
		$this->db->order_by('resource_controller');
		$this->db->order_by('resource_function');
		$query = $this->db->get('rules');
		if($query->num_rows())	{
			$data->response = 'success';
			$i = 0;
			foreach($query->result() as $row)	{
				$data->rows[$i] = $row;
				$i++;
			}
		}
		else
			die($this->cmsm->json_msg('error',$this->lang->line('attention'),$this->lang->line('error')));

		return json_encode($data);
	}
	
	function getUser($id,$null='guest')
	{
		if(isset($id) && !is_numeric($id)) die();
		if((string)$id === "0")
			return '['.$this->lang->line('system').']';
		elseif(empty($id))	{
			if($null == 'guest')
				return '['.$this->lang->line('guest').']';
			else
				return '-';
		}
		elseif(isset($id))	{
			$this->db->where('user_id = '.$id);
			$query = $this->db->get('user_profiles');
			if($query->num_rows())	{
				$row = $query->row();
				return $row->surname . ' ' . $row->name;
			}
			else
				die();
		}
	}
	
	function getAbbr($root,$file)
	{
		$root			= str_replace('/',DIRECTORY_SEPARATOR,$root);
		$default_file	= str_replace('xx','en',$file);
		$file			= str_replace('xx',$this->config->item('language_abbr'),$file);
		$files			= array();
		
		if ($handle = opendir(FCPATH.DIRECTORY_SEPARATOR.$root)) {
			while (false !== ($list = readdir($handle))) {
				$files[] = $list;
			}
			closedir($handle);
			
			if(in_array($file,$files))
				return $this->config->item('language_abbr');
			else	{
				if(in_array($default_file,$files))
					return 'en';
				else
					echo show_error($this->lang->line('default_file_not_found'));
			}
			
		}
	}
	
	function check_null($input)
	{
		$var = $input;
		if(empty($var) || $var == 'NULL')
			return NULL;
		else
			return $var;
	}
}
