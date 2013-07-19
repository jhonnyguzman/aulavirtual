<?php 

/**
 * Clase BasiCrud 
 * 
 * Esta clase contiene funciones de uso general de la aplicacion. 
 * Por ejemplos funciones de formateo de fechas, funciones de 
 * paginación de resultados, funciones de de configuración de campos a mostrar 
 * en las vistas, funciones de configuración de campos por los cuales filtrar 
 * en las vistas. 
 * Esta configurada para que se autocargue cada ves que se inicie la aplicación,
 * por los que los metodos de la misma pueden ser llamados desde cualquier controlador, 
 * vista o modelo.
 * 
 * @package libraries
 * @author applicacion
 * @version  1.0  
 */

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BasiCrud {
	
	
	function __construct() 
	{
		$CI = & get_instance();			
	}
	
	/**
	 * Método para formatear una fecha legible para seres humanos
	 * Este  método recibe una fecha y realiza el formatéo al formato dd/mm/aaaa
	 *
	 * @param date $date		aaaa-mm-dd H:i:s	 
	 * @return date $d			dd/mm/aaaa
	 */
	function formatDateToHuman($date = '') 
	{	
		//$datestring = "%d/%m/%Y - %h:%i %a";
		$datestring = "%d/%m/%Y";
		if($date != '') return mdate($datestring,strtotime($date));
		else return '';
	}
	
	/**
	 * Método para formatear una fecha y hora legible para seres humanos 
	 * Este  método recibe unq fecha  y realiza el formatéo  al formato dd/mm/aaaa H:i:s
	 *
	 * @param date $date 		aaaa-mm-dd H:i:s
	 * @return date $d 			dd/mm/aaaa H:i:s
	 */
	function formatDateToHumanWithTime($date = '') 
	{
		$datestring = "%d/%m/%Y - %h:%i:%s";
		if($date != '') return mdate($datestring,strtotime($date));			
		else return '';
	}
	
	/**
	 * Método para formatear fecha
	 * Este método genera la fecha actual en formato aaaa-mm-dd hh:mm:ss y retorna la misma
	 *
	 * @return string $date
	 */
	function formatDateToBD() 
	{	
		$datestring = "%Y-%m-%d %H:%i:%s";
		$time = time();
	  return mdate($datestring, $time);
	}
	

	/**
	 * Metodo para formatear un fecha
	 * Este metodo genera la fecha actual en formato aaaa-mm-dd  y retorna la misma
	 *
	 * @return string $date
	 */
	function getDateToBDWithOutTime() 
	{	
		$datestring = "%Y-%m-%d";
		$time = time();
	  return mdate($datestring, $time);
	}
	
	

	/**
	 * Este metodo toma un fecha con formato 00/00/0000 
	 * y lo transforma a 0000-00-00 antes de guardar en 
	 *	la bd
	 *
	 * @param string $date
	 * @return string $date
	 */
	 function getFormatDateToBD($date) {
	 	 	 	
	 	//elimina los espacios en blanco de la fecha ingresada
		$date = str_replace(" ","",$date);  
	
		$parte1=substr($date, 0, 2);
		$parte2=substr($date, 3, 2);
		$parte3=substr($date, 6, 4);
		$new_date = ($parte3."/".$parte2."/".$parte1);
		$new_date{4} = '-';
		$new_date{7} = '-';
	
		return $new_date;
	 }
	 
	/**
	 * This function getting all the fields for search of 
	 * setting file
	 *
	 * @access public
	 * @param  array		$fields       		all the fields of the table
	 * @param  string		$nameConfig       name of file config. No is required
	 * @return array 		      				fields for search
	 */
	function getFieldSearch($fields = array(),$nameConfig = '')
	{
		//code here
		$CI = & get_instance();
			
		$fieldSearch = array(); 
		foreach($fields as $field){ 
			if($CI->config->item("search_by_".$field."",$nameConfig)==1){ 
				$fieldSearch[]=$field; 
			} 
		}
		return $fieldSearch;
	}
	
	
	/**
	 * This function getting all the fields to show in the result list 
	 * of setting file 
	 *
	 * @param  array		$fields       		all the fields of the table
	 * @param  string		$nameConfig       name of file config. No is required
	 * @return array 		      				fields for search
	 */
	function getFieldToShow($fields = array(), $nameConfig = '')
	{
		//code here
		$CI = & get_instance();	
		
		$fieldShow = array(); 
		foreach($fields as $field){ 
			if($CI->config->item("show_".$field."",$nameConfig)==1){ 
				$fieldShow[]=$field; 
			} 
		}
		return $fieldShow;
	}


	/**
	 * This function get the paged data of table
	 *
	 * @param  array	$options       name of model, amount result per page
	 * @param  array	$fieldSearch   filters: fields
	 * @return string 		      	paged data 
	 */
	function getPagination($options = array(),$fieldSearch = array())
	{
		//code here
		$CI = & get_instance();	
		$data = "";

		$config['base_url'] = base_url().$CI->router->class."/".$CI->router->method;
		
		if(isset($fieldSearch) && count($fieldSearch)>0){
			if(isset($options['nameMethod']))
				$config['total_rows'] = $CI->$options['nameModel']->$options['nameMethod']($fieldSearch);
			else
				$config['total_rows'] = $CI->$options['nameModel']->get($fieldSearch);
		}else {
			if(!$fieldSearch['count']) $fieldSearch['count'] = true; 
			$config['total_rows'] = $CI->$options['nameModel']->get($fieldSearch);	
		}
   
	   	(empty($options['uri_seg'])) ? $config['uri_segment'] = 3 : $config['uri_segment'] = $options['uri_seg'];
	   
	   	$config['per_page'] = $options['perpage'];
	   
		//firt page	   	
	   	$config['first_link'] = 'Primero';
	   	$config['first_tag_open'] = '<li>';
	   	$config['first_tag_close'] = '</li>';
		//next page	   	
	   	$config['next_link'] = 'Siguiente';
	   	$config['next_tag_open'] = '<li>';
	   	$config['next_tag_close'] = '</li>';
	   	//previous page
	   	$config['prev_link'] = 'Atr&aacute;s';
	   	$config['prev_tag_open'] = '<li>';
		$config['prev_tag_close'] = '</li>';
		//last page	   	
	   	$config['last_link'] = '&Uacute;ltimo';
	   	$config['last_tag_open'] = '<li>';
	   	$config['last_tag_close'] = '</li>';

	   	//num tag 	   	
	   	$config['num_tag_open'] = '<li>';
	   	$config['num_tag_close'] = '</li>';
	   	
	   	$config['full_tag_open'] = "<ul>";
	   	$config['full_tag_close'] = "</ul>";

	   	$config['cur_tag_open'] = '<li class="active"><a href="#">';
	   	$config['cur_tag_close'] = '</a></li>';

	  
	    	
	   	$CI->pagination->initialize($config);
	   	$links = $CI->pagination->create_links();
	   	//$num_pages = $CI->pagination->num_pages;
	   
	   	if($links) {
	   		//$data= "Registros encontrados:&nbsp;".$config['total_rows']."&nbsp;|&nbsp;P&aacute;gina ".$CI->pagination->cur_page."&nbsp;de&nbsp;".$num_pages."&nbsp;|&nbsp;".$links;  
	   		$data = $links;  
	   	} else $data = null;

	   	return $data; 

	}
	

	
	
	/**
	 * Get either a Gravatar URL or complete image tag for a specified email address.
	 *
	 * @param string $email The email address
	 * @param string $s Size in pixels, defaults to 80px [ 1 - 512 ]
	 * @param string $d Default imageset to use [ 404 | mm | identicon | monsterid | wavatar ]
	 * @param string $r Maximum rating (inclusive) [ g | pg | r | x ]
	 * @param boole $img True to return a complete IMG tag False for just the URL
	 * @param array $atts Optional, additional key/value attributes to include in the IMG tag
	 * @return String containing either just a URL or a complete image tag
	 * @source http://gravatar.com/site/implement/images/php/
	 */
	function get_gravatar( $email, $s = 80, $d = 'mm', $r = 'g', $img = false, $atts = array() ) 
	{
		$url = 'http://www.gravatar.com/avatar/';
		$url .= md5( strtolower( trim( $email ) ) );
		$url .= "?s=$s&d=$d&r=$r";
		if ( $img ) {
			$url = '<img src="' . $url . '"';
			foreach ( $atts as $key => $val )
				$url .= ' ' . $key . '="' . $val . '"';
			$url .= ' />';
		}
		return $url;
	}
	
	
	/**
	 * This function generate a random string
	 *
	 * @param  integer	$lenght       lenght of string to generate
	 * @return string 		      	  string generated 
	 */
	function _random_string($lenght)
	{
		//code here
		$len = $lenght;
		$base = "ABCDEFGHYJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwz123456789";
		$max = strlen($base)-1;
		$activatecode = '';
		mt_srand((double)microtime()*1000000);
		while (strlen($activatecode)<$len+1){
			$activatecode.= $base{mt_rand(0, $max)}; 
		}
		return $activatecode;
		
	}
	
	
	/**
	 * This function send a mail 
	 *
	 * @param  string	$p_from        email from 
	 * @param  string	$p_from_name   who send the mail 
	 * @param  string	$p_to       	email to
	 * @param  string	$p_subject     email subject 
	 * @param  string	$p_message     email message
	 * @return booleam 		      	True, if mail is sent successfully
	 */
	function sendmail($p_from="turnvy@gmail.com", $p_from_name="Admin", $p_to, $p_subject="Confirmaci&oacute;n de registro", $p_message ) 
	{
		//code here
		$CI = & get_instance();	
		
		//config email parameters
		$CI->email->from($p_from, $p_from_name);
		$CI->email->to($p_to);
		$CI->email->subject($p_subject);
		$CI->email->message($p_message);
				
		if(!$CI->email->send())
		{
			return $CI->email->print_debugger(); 
		}
		else 
		{
			return "";
		}
		
	}


	/**
	 * This function send a mail with advanced parameters
	 *
	 * @param  arrays	$$options        options the email config 
	 * @return booleam 		      	True, if mail is sent successfully
	 */
	function sendmailAdvanced($options = array() ) 
	{
		//code here
		$CI = & get_instance();	
		
		//config email parameters
		$CI->email->from($options['p_from'], $options['p_from_name']);
		$CI->email->to($options['p_to']);
		if(isset($options['p_cc'])) $CI->email->cc($options['p_cc']);
		if(isset($options['p_bcc'])) $CI->email->bcc($options['p_bcc']);
		$CI->email->subject($options['p_subject']);
		$CI->email->message($options['p_message']);
				
		if(!$CI->email->send()) return $CI->email->print_debugger(); 
		else return '';
	}
	
	
	
	/**
	 * This function make a captcha 
	 *
	 * @return image 		  A image generated
	 */
	function _make_captcha()
   {
   	//code here
		$CI = & get_instance();			
	   $CI->load->helper('captcha');

	   $vals = array(
	      'img_path' => './captcha/', // PATH for captcha ( *Must mkdir (htdocs)/captcha )
	      'img_url' => base_url().'captcha/', // URL for captcha img
	      'img_width' => 200, // width
	      'img_height' => 60, // height
	      // 'font_path'     => '../system/fonts/2.ttf',
	      // 'expiration' => 7200 ,
	   );

	   // Create captcha
	   $cap = create_captcha($vals);
	    
	   // Write to DB
	   if ($cap) 
	   {
	     $data = array(
	        'captcha_id' => '',
	        'captcha_time' => $cap['time'],
	        'ip_address' => $CI->input->ip_address(),
	        'word' => $cap['word'] ,
	        );
	     $query = $CI->db->insert_string( 'captcha', $data );
	     $CI->db->query( $query );
	   }
	   else
	   {
	     return "Captcha not work" ;
	   }
	   
	   return $cap['image'] ;
  }
  
  
  /**
	* This function check if captcha is correct
	*
	* @param  string	$p_captcha        Captcha entede for user 
	* @param  string	$p_ip_address     Ip address of user 
	* @return true 	if captcha is correct
	*/
  function _check_captcha($p_captcha,$p_ip_address)
  {
  	  //code here
	  $CI = & get_instance();	
		
     //Delete old data ( 2hours)
     $expiration = time()-7200 ;
     $sql = "DELETE FROM captcha WHERE captcha_time < ? ";
     $binds = array($expiration);
     $query = $CI->db->query($sql, $binds);
 
     //checking input
     $sql = "SELECT COUNT(*) AS count FROM captcha WHERE word = ? AND ip_address = ? AND captcha_time > ?";
     $binds = array($p_captcha, $p_ip_address, $expiration);
     $query = $CI->db->query($sql, $binds);
     $row = $query->row();
 
     if ($row->count > 0)
     {
        return true;
     }
     
     return false;
 
  }
  
  
  	/**
	 * This function format the time between two date
	 *
	 * @param  integer	$time       time en minutes
	 * @return string 		      	string generated 
	 */
	function _format_time($time)
	{
		//code here
		if($time >=1440){
					
		}elseif($time >=60){
			$tmp_time = $time / 60;
			$arr_time = explode('.', $tmp_time);
			$real_time = $arr_time[0];			 
			$real_min = $time % 60;
		}else{
			$real_min = $time;
		}
  
		if($real_min == 0){				
			$real_min = '';
		}elseif($real_min == 1) {
			$real_min.= ' minuto';
		}else{
			$real_min.= ' minutos';
		}
		
		if(isset($real_time)){
			if($real_time == 1){
				$real_time.=' hora';	
			}else {
				$real_time.=' horas';
			}	
		}
		
		if(isset($real_time)) return $real_time.' '.$real_min;
		else return $real_min;
	}
	
	
	/**
	 * This function add minutes to a particular date
	 * format:  dd/mm/yyyy hh-nn-ss
	 *
	 * @param  string		$dateStr    format dd/mm/yyyy hh-nn-ss
	 * @param  string		$minToSum   eg. 10,20,30, etc.
	 * @return string 		      	new date 
	 */
	function _addMinToDate($dateStr, $minToAdd)
	{
	  $dateStr = str_replace("/", " ", $dateStr);
	  $dateStr = str_replace(":", " ", $dateStr);
		
	  $dateSource = explode(" ", $dateStr);
		
	  $day = $dateSource[0];
	  $month = $dateSource[1];
	  $year = $dateSource[2];
		
	  $hours = $dateSource[3];
	  $minutes = $dateSource[4];
	  $seconds = $dateSource[5];
		
	  // Add the minutes
	  $minutes = ((int)$minutes) + ((int)$minToAdd); 
		
	  // Assingn the modified date to a new variable
	  $newDate = date("Y-m-d H:i:s",mktime($hours,$minutes,$seconds,$month,$day,$year));
		
	  return $newDate;
	}
	
	
	/* Agregar a una fecha dias, meses o años */
	function date_add($givendate,$day=0,$mth=0,$yr=0)
	{
	  $cd = strtotime($givendate);
	  return date('Y-m-d', mktime(date('h',$cd), date('i',$cd), date('s',$cd), date('m',$cd)+$mth,  date('d',$cd)+$day, date('Y',$cd)+$yr));
	}
	 
	 
	/* calcular la diferencia entre dos fechas */
	function date_diff($start_date,$end_date,$format = 'd')
	{
	  $start_date = strtotime($start_date);
	  $end_date = strtotime($end_date);
 
	  switch ($format)
	  {
	     //seconds
	     case "s":
	         return floor(($end_date-$start_date));
	     //minutes
	     case "i":
	          return floor(($end_date-$start_date)/60);
	     //hours
	     case "h":
	          return floor(($end_date-$start_date)/3600);
	     //days
	     case "d":
	          return floor(($end_date-$start_date)/86400);
	     //months
	     case "m":
	          return floor(($end_date-$start_date)/2628000);
	     //years
	     case "y":
	          return floor(($end_date-$start_date)/31536000);
	     //days
	     default:
	          return floor(($end_date-$start_date)/86400);
	     }
	}
	 
	/* conocer la hora exacta de un determinado timezone */
	function get_date($timezone = 'America/New_York', $full_date_time = false)
	{
	    date_default_timezone_set($timezone);
	    $date = ($full_date_time) ? date('D,F j, Y, h:i:s A') : date('Y-m-d');
	    date_default_timezone_set('UTC');
	    return $date;
	}
	
	
	function array_remove_keys($array, $keys = array()) 
	{ 
	    // If array is empty or not an array at all, don't bother 
	    // doing anything else. 
	    if(empty($array) || (! is_array($array))) { 
	        return $array; 
	    } 
	  
	    // If $keys is a comma-separated list, convert to an array. 
	    if(is_string($keys)) { 
	        $keys = explode(',', $keys); 
	    } 
	  
	    // At this point if $keys is not an array, we can't do anything with it. 
	    if(! is_array($keys)) { 
	        return $array; 
	    } 
	  
	    // array_diff_key() expected an associative array. 
	    $assocKeys = array(); 
	    foreach($keys as $key) { 
	        $assocKeys[$key] = true; 
	    } 
	  
	    return array_diff_key($array, $assocKeys); 
	} 
	

	function calcTotal($cantidad, $precio)
	{
		return $cantidad * $precio;
	}


	function timesince($original) 
	{
		$ta = array(
			array(31536000, "Año", "Años"),
			array(2592000, "Mes", "Meses"),
			array(604800, "Semana", "Semanas"),
			array(86400, "Día", "Días"),
			array(3600, "Hora", "Horas"),
			array(60, "Minuto", "Minutos"),
			array(1, "Segundo", "Segundos")
		);
		$since = time() - strtotime($original);
		$res = "";
		$lastkey = 0;
		for( $i=0; $i<count($ta); $i++ )
		{
			$cnt = floor($since / $ta[$i][0]);
			if ($cnt != 0) 
			{
				$since = $since - ($ta[$i][0] * $cnt);
				if($res == "")
				{
					$res .= ($cnt == 1) ? "1 {$ta[$i][1]}" : "{$cnt} {$ta[$i][2]}";
					$lastkey = $i;
				} 
				else if ($ta[0] >= 60 && ($i - $lastkey) == 1 )
				{
					$res .= ($cnt == 1) ? " y 1 {$ta[$i][1]}" : " y {$cnt} {$ta[$i][2]}";
					break;
				} else {
					break;
				}
			}
		}
		return $res;
	}


	function getMeses()
	{
		$meses = array(
			'1' => 'Enero',
			'2' => 'Febrero',
			'3' => 'Marzo',
			'4' => 'Abril',
			'5' => 'Mayo',
			'6' => 'Junio',
			'7' => 'Julio',
			'8' => 'Agosto',
			'9' => 'Septiembre',
			'10' => 'Octubre',
			'11' => 'Noviembre',
			'12' => 'Diciembre');
		return $meses;
	}

	function getAnios()
	{
		$anios = array(
			'1' => '2011',
			'2' => '2012',
			'3' => '2013',
			'4' => '2014',
			'5' => '2015',
			'6' => '2016',
			'7' => '2017',
			'8' => '2018',
			'9' => '2019',
			'10' => '2020',
			'11' => '2021',
			'12' => '2022');
		return $anios;
	}

	function getMesDescripcion($mes = '')
	{
		$meses = $this->getMeses();
		return $meses[$mes];

	}

	function calcularMeses($fecha_inicio, $fecha_fin)
	{
		$fechas = array();

		$periodo_inicio_seg = strtotime($fecha_inicio);
		$periodo_fin_seg = strtotime($fecha_fin);


		$contador=$periodo_inicio_seg;
		while ($contador<=$periodo_fin_seg) 
		{	
			$fecha = array('mes' => date("m", $contador), 'anio' => date("Y", $contador));
			$fechas[] = $fecha;
			$fecha_parcial = date("d-m-Y", $contador);
		    $parcial = strtotime("$fecha_parcial +1 month");
		    $contador = $contador + ($parcial - strtotime("$fecha_parcial"));
		}	

		return $fechas;
	}


	/**
	 * Esta funcion obtiene los perfiles de docentes sin asignar 
	 *
	 * @param  array		$array1    array de todos los perfiles de docentes cargados en el sistema
	 * @param  array		$array2    array de los perfiles asignados a un docente
	 * @return array 		      	perfiles sin asignar 
	 */
	function getPerfilesSinAsignar($array1 = array(), $array2 = array())
	{
		$arrayR = $array1;
		$indices = array();
		foreach ($arrayR as $keyR => $valueR) {
			foreach ($array2 as $key => $value) {
				if($value->perfil_id == $valueR->id)
				{
					$indices[] = $keyR; 
				}
			}		
		}

		for ($i=0; $i < count($indices); $i++) { 
			unset($arrayR[$indices[$i]]);
		}

		return $arrayR;

	}



	/**
	 * Esta funcion obtiene los titulos sin asignar a un docentes 
	 *
	 * @param  array		$array1    array de todos los titulos de docentes cargados en el sistema
	 * @param  array		$array2    array de los titulos asignados a un docente
	 * @return array 		      	titulos sin asignar 
	 */
	function getTitulosSinAsignar($array1 = array(), $array2 = array())
	{
		$arrayR = $array1;
		$indices = array();
		foreach ($arrayR as $keyR => $valueR) {
			foreach ($array2 as $key => $value) {
				if($value->titulo_id == $valueR->id)
				{
					$indices[] = $keyR; 
				}
			}		
		}

		for ($i=0; $i < count($indices); $i++) { 
			unset($arrayR[$indices[$i]]);
		}

		return $arrayR;

	}


	/**
	 * Esta funcion iguala un arreglo que contiene los caracteres 
	 * de las columnas de excel
	 *
	 * @param  integer   contador de columna
	 * @return integer   columna
	 */
	function entradaColumna($col_ent)
	{
		$hdc = array(
			0 => "A", 1 => "B", 2 => "C", 3 => "D", 
			4 => "E", 5 => "F", 6 => "G", 7 => "H", 
			8 => "I", 9 => "J", 10 => "K", 11 => "L", 
			12 => "M", 13 => "N", 14 => "O", 15 => "P", 
			16 => "Q", 17 => "R", 18 => "S", 19 => "T", 
			20 => "U", 21 => "V", 22 => "W", 23 => "X", 
			24 => "Y", 25 => "Z");
		return ($col_ent < 26) ? $hdc[$col_ent] : $hdc[(int)($col_ent/26)-1].$hdc[($col_ent % 26)];
	}


	public function checkDatosOrigen($field)
	{
		$estado = false;
		$data[]='escuela_origen_nombre';
		$data[]='escuela_origen_id';
		$data[]='periodo_origen_id';
		$data[]='periodo_origen_fecha_inicio';
		$data[]='periodo_origen_fecha_fin';
		$data[]='resolucion_periodo_origen';
		$data[]='matricula_periodo_origen';
		$data[]='periodo_origen_cantidad_horas';
		$data[]='periodo_origen_costo_hora';
		$data[]='horas_sin_usar';
		$data[]='horas_sin_usar_restantes';


		for ($i=0; $i < count($data); $i++) { 
			if($data[$i] == $field) $estado = true;
		}

		return $estado;

	}

	public function getCaracteresAlfabeticos()
	{
		$caracteres = array(
				"A" => "A",
				"B" => "B",
				"C" => "C",
				"D" => "D",
				"E" => "E",
				"F" => "F",
				"G" => "G",
				"H" => "H",
				"I" => "I",
				"J" => "J",
				"K" => "K",
				"L" => "L",
				"M" => "M",
				"N" => "N",
				"Ñ" => "Ñ",
				"O" => "O",
				"P" => "P",
				"Q" => "Q",
				"R" => "R",
				"S" => "S",
				"T" => "T",
				"U" => "U",
				"V" => "V",
				"W" => "W",
				"X" => "X",
				"Y" => "Y",
				"Z" => "Z"
			);

		return $caracteres;
	}


	public function gen_uuid() 
	{
	    return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
	        // 32 bits for "time_low"
	        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

	        // 16 bits for "time_mid"
	        mt_rand( 0, 0xffff ),

	        // 16 bits for "time_hi_and_version",
	        // four most significant bits holds version number 4
	        mt_rand( 0, 0x0fff ) | 0x4000,

	        // 16 bits, 8 bits for "clk_seq_hi_res",
	        // 8 bits for "clk_seq_low",
	        // two most significant bits holds zero and one for variant DCE1.1
	        mt_rand( 0, 0x3fff ) | 0x8000,

	        // 48 bits for "node"
	        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
	    );
	}


	/**
	 * This function create a directory if it no exists. 
	 *
	 * @access	public
	 * @param	string url		the url where create a directoru
	 * @param	string name 	name of the directory
	 * @return	boolean
	 */
	 function createDir($url,$name) {
	 	
	 	$mapa = directory_map($url,TRUE);
	 	
	 	$status = array();
	 	foreach($mapa as $key => $value){
			if($value == $name){
				$status[] = 1;	
			}		
	 	}
	 	
	 	if(count($status) == 0){
			if(mkdir($url.''.$name, 0777)) return true;
			else return false;
		}else {
			return true;	
		}	 
		
	 }


	/*public function custom_json_encode($arr)
	{
	        //convmap since 0x80 char codes so it takes all multibyte codes (above ASCII 127). So such characters are being "hidden" from normal json_encoding
	        array_walk_recursive($arr, function (&$item, $key) { if (is_string($item)) $item = mb_encode_numericentity($item, array (0x80, 0xffff, 0, 0xffff), 'UTF-8'); });
	        return mb_decode_numericentity(json_encode($arr), array (0x80, 0xffff, 0, 0xffff), 'UTF-8');

	}*/


	public function getPlatformGK($platforms)
	{
		$pl = array();
		if(count($platforms) > 0){
			for($i = 0; $i < count($platforms); $i++){
				if($platforms[$i]->_id != EYESONTV_PLATFORM){
					$pl[] = $platforms[$i];
				}
			}
		}

		return $pl;
	}

	public function getCustomApplications($applications = array())
	{
		$CI = & get_instance();	
		$CI->load->model('gesturesets_model');		
		$data = array();
		foreach ($applications as $f) {
			$data_application = new stdClass();
			$data_application->_id = $f->_id;
			$data_application->name = $f->name;
			$data_application->description = $f->description;
			$data_application->platform_id = $f->platform_id;
			$data_application->user_id = $f->user_id;
			$data_application->htmlset_id = $f->htmlset_id;
			$data_application->created_at = $f->created_at;
			$data_application->updated_at = $f->updated_at;
			$data_application->gesturesets = array();
			$gesturesets = $CI->gesturesets_model->get(array("application_id" => $f->_id));
			if(count($gesturesets) > 0){
				$arrGestureSets = array();
				foreach ($gesturesets as $g) {
					$data_gestureset = new stdClass();
					$data_gestureset->_id = $g->_id;
					$data_gestureset->application_id = $g->application_id;
					$data_gestureset->name = $g->name;
					$data_gestureset->domain = $g->domain;
					$data_gestureset->uiid = $g->uiid;
					$data_gestureset->help = $g->help;
					$data_gestureset->created_at = $g->created_at;
					$data_gestureset->updated_at = $g->updated_at;
					$arrGestureSets[] = $data_gestureset;
				}
				$data_application->gesturesets = $arrGestureSets;
			}

			$data[] = $data_application;

		}
		return $data;
	}

	public function mktime_format($input,$format='Y-m-d H:i:s')
	{
		if(!empty($input))
			return date($format, $input);
		else
			return '-';
	}

	public function cretateHtmlMsg($message_status = '', $message_description = '', $errors = '')
	{
		$html = "";
		if($message_status == 'error'){
          $html.="<div class='alert alert-error'>";
          $html.="<a class='close' data-dismiss='alert' href='#''>×</a>";
          $html.=$errors;
          $html.="</div>";
        }elseif($message_status == 'success'){
          $html.="<div class='alert alert-success'>";
          $html.="<a class='close' data-dismiss='alert' href='#''>×</a>";
          $html.=$message_description;
          $html.="</div>";
        }
	   
	   return $html;
	}
}
