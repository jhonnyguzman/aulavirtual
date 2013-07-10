<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

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

class CI_Login
{
	
	function getCss()
	{
		$array = array(
			'login',
			'ui-cizacl/jquery-ui-1.10.3.custom'
		);
		$data = '';
		foreach($array as $value)	{
			$data .= '<link href="'.base_url().'assets/css/cizacl/'.$value.'.css" rel="stylesheet" type="text/css" />';
		}
		return $data;
	}
	
	function getScripts()
	{
		$array = array(
			'jquery-1.10.1.min',
			'jquery-ui-1.10.3.custom.min'
		);
		$data = '';
		foreach($array as $value)	{
			$data .= '<script type="text/javascript" src="'.base_url().'assets/js/cizacl/'.$value.'.js"></script>';
		}
		$data .= '<script type="text/javascript" src="'.site_url('login_js/scripts').'"></script>';
		return $data;
	}

    function __get($var)    {
        static $CI;
        (is_object($CI)) OR $CI = get_instance();
        return $CI->$var;
    }
}