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

class Contents extends CI_Controller {

	protected $path_img_upload_folder;
    protected $path_img_thumb_upload_folder;
    protected $path_url_img_upload_folder;
    protected $path_url_img_thumb_upload_folder;
    protected $delete_img_url;

    protected $path_url_pdf_upload_folder;
    protected $path_pdf_upload_folder;
    protected $delete_pdf_url;
    

  	function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));

		//Set relative Path with CI Constant
        $this->setPath_img_upload_folder("uploads/contents/videos/");
        $this->setPath_img_thumb_upload_folder("uploads/contents/videos/thumbnails/");

		//Delete img url
        $this->setDelete_img_url(base_url() . 'contents/deleteImage/');
 
		//Set url img with Base_url()
        $this->setPath_url_img_upload_folder(base_url() . "uploads/contents/videos/");
        $this->setPath_url_img_thumb_upload_folder(base_url() . "uploads/contents/videos/thumbnails/");

        //set url pdf with Base_url()
        $this->setPath_pdf_upload_folder("uploads/contents/pdfs/");
        $this->setPath_url_pdf_upload_folder(base_url() . "uploads/contents/pdfs/");

        //Delete url pdf
        $this->setDelete_pdf_url(base_url() . 'contents/deletePDF/');
  	}

	public function text_add(){
		echo $this->load->view("content/text_add",array("lesson_id" => $this->input->post("lesson_id")));
	}

	public function text_create()
	{
		$post = $this->input->post(NULL,TRUE);
		$result = array();
		$lesson = new Lesson();
		$lesson->where("id", $post['lesson_id'])->get();
		if($lesson->exists()){
			
			$ct = new Content_text();
			$ct->lesson_id = $lesson->id;
			$ct->text_html = $post["text_html"];
			if($ct->save()){
				$result['content_text'] = array('id' => $ct->id, 'text_html' => $ct->text_html);
				$result['message_status'] = 'success';
				$result['message_description'] = 'Contenido creado correctamente';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
			}else{
				$result['message_status'] = 'error';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $ct->error->string);
			}

		}else{
			//show_404('page',FALSE);
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}

	public function text_edit()
	{
		$data = array();
		$lesson = new Lesson();
		$lesson->where("id", $this->input->post('lesson_id'))->get();
		if($lesson->exists()){
			$ct = new Content_text();
			$ct->where("lesson_id", $lesson->id)->get();
			if($ct->exists()){
				$data['message_status'] = 'success';
				$data['content_text'] = $ct;
				echo $this->load->view("content/text_edit",$data);
			}else{
				$data['message_status'] = 'error';
				echo $this->load->view("content/text_edit",$data);
			}
		}else{
			$data['message_status'] = 'error';
			echo $this->load->view("content/text_edit",$data);
		}
	}

	public function text_update()
	{
		$post = $this->input->post(NULL,TRUE);
		$result = array();
		$lesson = new Lesson();
		$lesson->where("id", $post['lesson_id'])->get();
		if($lesson->exists()){
			$ct = new Content_text();
			$ct->where("id", $post['id'])->get();
			if($ct->exists()){
				$ct->lesson_id = $lesson->id;
				$ct->text_html = $post["text_html"];
				if($ct->save()){
					$result['content_text'] = array('id' => $ct->id, 'text_html' => $ct->text_html,'lesson_id' => $ct->lesson_id);
					$result['message_status'] = 'success';
					$result['message_description'] = 'Contenido actualizado correctamente';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
				}else{
					$result['message_status'] = 'error';
					$result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $ct->error->string);
				}
			}else{
				$result['message_status'] = 'error';
				$result['message_description'] = 'Request failed!!';
				$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
			}
		}else{
			$result['message_status'] = 'error';
			$result['message_description'] = 'Request failed!!';
			$result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
		}

		echo json_encode($result);
	}

	public function video_add(){
		echo $this->load->view("content/video_add",array("lesson_id" => $this->input->post("lesson_id")));
	}

    public function video_preview()
    {
        $video_url = $this->input->post("videourl");
        echo $this->load->view("content/video_preview",array("video_url" => $video_url));   
    }

    public function video_create_url()
    {
        $post = $this->input->post(NULL,TRUE);
        $result = array();
        $lesson = new Lesson();
        $lesson->where("id", $post['lesson_id'])->get();
        if($lesson->exists()){
            $cvu = new Content_video_url();
            $cvu->lesson_id = $lesson->id;
            $cvu->url = $post["video_url"];
            $cvu->type = $post['type'];
            if($cvu->save($lesson)){
                $result['content_video'] = array(
                    'id' => $cvu->id, 
                    'url' => $cvu->url, 
                    'type' => $cvu->type, 
                    'lesson_id' => $cvu->lesson_id);
                $result['message_status'] = 'success';
                $result['message_description'] = 'Video creado correctamente';
                $result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
            }else{
                $result['message_status'] = 'error';
                $result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $cvu->error->string);
            }

        }else{
            //show_404('page',FALSE);
            $result['message_status'] = 'error';
            $result['message_description'] = 'Request failed!!';
            $result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
        }

        echo json_encode($result);
    }

    public function video_create() 
    {
        $result = array();
        $lesson_id = $this->input->post("lesson_id");
        $name = random_string('unique').'_'.$lesson_id;
        //Your upload directory, see CI user guide
        $config['upload_path'] = $this->getPath_img_upload_folder();
  
        $config['allowed_types'] = 'avi|mp4|mov|MOV|qt|flv';
        $config['max_size'] = '200000000'; //200 mb
        $config['file_name'] = $name;

        //Load the upload library
        $this->load->library('upload', $config);

        if ($this->do_upload()) {
            $data = $this->upload->data();
            $name.=$data['file_ext'];
            //Get info 
            $info = new stdClass();    
            $info->name = $name;
            $info->size = $data['file_size'];
            $info->type = $data['file_type'];
            $info->url = $this->getPath_img_upload_folder() . $name;
            //I set this to original file since I did not create thumbs.  change to thumbnail directory if you do = $upload_path_url .'/thumbs' .$name
            $info->thumbnail_url = $this->getPath_img_thumb_upload_folder() . $name; 
            $info->delete_url = $this->getDelete_img_url() . $name;
            $info->delete_type = 'DELETE';

            $lesson = new Lesson();
            $lesson->where("id", $lesson_id)->get();
            if($lesson->exists()){
                $cv = new Content_video();
                $cv->lesson_id = $lesson->id;
                $cv->file_name = $name;
                $cv->file_type = $data['file_type'];
                $cv->file_size = $data['file_size'];
                $cv->type = 'local';
                if($cv->save($lesson)){
                    $result['content_video'] = array(
                        'id' => $cv->id, 
                        'file_name' => $cv->file_name,
                        'file_type' => $cv->file_type,
                        'file_size' => $cv->file_size, 
                        'type' => $cv->type, 
                        'url'=> site_url()."uploads/contents/videos/".$cv->file_name,
                        'lesson_id' => $cv->lesson_id);
                    $result['message_status'] = 'success';
                    $result['message_description'] = 'Video creado correctamente';
                    $result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
                }else{
                    $result['message_status'] = 'error';
                    $result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $cvu->error->string);
                }
            }else{
                //show_404('page',FALSE);
                $result['message_status'] = 'error';
                $result['message_description'] = 'Request failed!!';
                $result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
            }

            $result['upload_data'] = $info;
            //Return JSON data
            if (IS_AJAX) {   //this is why we put this in the constants to pass only json data
                echo json_encode($result);
                //this has to be the only the only data returned or you will get an error.
                //if you don't give this a json array it will give you a Empty file upload result error
                //it you set this without the if(IS_AJAX)...else... you get ERROR:TRUE (my experience anyway)
            } else {   // so that this will still work if javascript is not enabled
                $file_data['upload_data'] = $this->upload->data();
                echo json_encode($result);
            }
        } else {
            $result['error'] = $this->upload->display_errors('','');
            $result['message_status'] = 'error';
            $result['message_description'] = $this->upload->display_errors('','');
            $result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
            // the display_errors() function wraps error messages in <p> by default and these html chars don't parse in
            // default view on the forum so either set them to blank, or decide how you want them to display.  null is passed.
            echo json_encode($result);
        }

  }


  //Function for the upload : return true/false
  public function do_upload() {

        if (!$this->upload->do_upload()) {
            return false;
        } else {
            //$data = array('upload_data' => $this->upload->data());
            return true;
        }
  }

  public function pdf_preview()
  {
        $content_pdf_id = $this->input->post("content_pdf_id");
        echo $this->load->view("content/pdf_preview",array("content_pdf_id" => $content_pdf_id));   
  }

  public function pdf_preview_iframe($content_pdf_id = "")
  {
        if($content_pdf_id != ""){
            $content_pdf = new Content_pdf();
            $content_pdf->where("id", $content_pdf_id)->get();
            if($content_pdf->exists()){
                $pdf_url = $this->basicrud->builtUrlPDF($content_pdf);
                echo $this->load->view("content/pdf_preview_iframe",array("pdf_url" => $pdf_url));   
            }else{
                show_404(FALSE);
            }
        }else{
            show_404(FALSE);
        }
  }

  public function pdf_add(){
        echo $this->load->view("content/pdf_add",array("lesson_id" => $this->input->post("lesson_id")));
  }

  public function pdf_create()
  {
        $result = array();
        $lesson_id = $this->input->post("lesson_id");
        $name = random_string('unique').'_'.$lesson_id;
        //Your upload directory, see CI user guide
        $config['upload_path'] = $this->getPath_pdf_upload_folder();
  
        $config['allowed_types'] = 'pdf';
        $config['max_size'] = '200000000'; //200 mb
        $config['file_name'] = $name;

        //Load the upload library
        $this->load->library('upload', $config);

        if ($this->do_upload()) {
            $data = $this->upload->data();
            $name.=$data['file_ext'];
            //Get info 
            $info = new stdClass();    
            $info->name = $name;
            $info->size = $data['file_size'];
            $info->type = $data['file_type'];
            $info->url = $this->getPath_url_pdf_upload_folder() . $name;
            //I set this to original file since I did not create thumbs.  change to thumbnail directory if you do = $upload_path_url .'/thumbs' .$name
            //$info->thumbnail_url = $this->getPath_img_thumb_upload_folder() . $name; 
            $info->delete_url = $this->getDelete_pdf_url() . $name;
            $info->delete_type = 'DELETE';

            $lesson = new Lesson();
            $lesson->where("id", $lesson_id)->get();
            if($lesson->exists()){
                $cp = new Content_pdf();
                $cp->lesson_id = $lesson->id;
                $cp->file_name = $name;
                $cp->file_type = $data['file_type'];
                $cp->file_size = $data['file_size'];
                if($cp->save($lesson)){
                    $result['content_pdf'] = array(
                        'id' => $cp->id, 
                        'file_name' => $cp->file_name,
                        'file_type' => $cp->file_type,
                        'file_size' => $cp->file_size, 
                        'url'       => $this->getPath_url_pdf_upload_folder() . $name,
                        'lesson_id' => $cp->lesson_id);
                    $result['message_status'] = 'success';
                    $result['message_description'] = 'PDF creado correctamente';
                    $result['message_html'] = $this->basicrud->cretateHtmlMsg('success', $result['message_description']); 
                }else{
                    $result['message_status'] = 'error';
                    $result['message_html'] = $this->basicrud->cretateHtmlMsg('error', '', $cp->error->string);
                }
            }else{
                //show_404('page',FALSE);
                $result['message_status'] = 'error';
                $result['message_description'] = 'Request failed!!';
                $result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
            }

            $result['upload_data'] = $info;
            //Return JSON data
            if (IS_AJAX) {   //this is why we put this in the constants to pass only json data
                echo json_encode($result);
                //this has to be the only the only data returned or you will get an error.
                //if you don't give this a json array it will give you a Empty file upload result error
                //it you set this without the if(IS_AJAX)...else... you get ERROR:TRUE (my experience anyway)
            } else {   // so that this will still work if javascript is not enabled
                $file_data['upload_data'] = $this->upload->data();
                echo json_encode($result);
            }
        } else {
            $result['error'] = $this->upload->display_errors('','');
            $result['message_status'] = 'error';
            $result['message_description'] = $this->upload->display_errors('','');
            $result['message_html'] = $this->basicrud->cretateHtmlMsg('error',$result['message_description'],$result['message_description']);
            // the display_errors() function wraps error messages in <p> by default and these html chars don't parse in
            // default view on the forum so either set them to blank, or decide how you want them to display.  null is passed.
            echo json_encode($result);
        }
  }



  public function deleteImage() {

        //Get the name in the url
        $file = $this->uri->segment(3);
        
        $success = unlink($this->getPath_img_upload_folder() . $file);
        $success_th = unlink($this->getPath_img_thumb_upload_folder() . $file);

        //info to see if it is doing what it is supposed to 
        $info = new stdClass();
        $info->sucess = $success;
        $info->path = $this->getPath_url_img_upload_folder() . $file;
        $info->file = is_file($this->getPath_img_upload_folder() . $file);
        if (IS_AJAX) {//I don't think it matters if this is set but good for error checking in the console/firebug
            echo json_encode(array($info));
        } else {     //here you will need to decide what you want to show for a successful delete
            var_dump($file);
        }
    }

    public function get_files() {
        $this->get_scan_files();
    }

    public function get_scan_files() {
        $file_name = isset($_REQUEST['file']) ?
                basename(stripslashes($_REQUEST['file'])) : null;
        if ($file_name) {
            $info = $this->get_file_object($file_name);
        } else {
            $info = $this->get_file_objects();
        }
        header('Content-type: application/json');
        echo json_encode($info);
    }

    protected function get_file_object($file_name) {
        $file_path = $this->getPath_img_upload_folder() . $file_name;
        if (is_file($file_path) && $file_name[0] !== '.') {

            $file = new stdClass();
            $file->name = $file_name;
            $file->size = filesize($file_path);
            $file->url = $this->getPath_url_img_upload_folder() . rawurlencode($file->name);
            $file->thumbnail_url = $this->getPath_url_img_thumb_upload_folder() . rawurlencode($file->name);
            //File name in the url to delete 
            $file->delete_url = $this->getDelete_img_url() . rawurlencode($file->name);
            $file->delete_type = 'DELETE';
            
            return $file;
        }
        return null;
    }

    protected function get_file_objects() {
        return array_values(array_filter(array_map(
             array($this, 'get_file_object'), scandir($this->getPath_img_upload_folder())
                   )));
    }


    public function getPath_img_upload_folder() {
        return $this->path_img_upload_folder;
    }

    public function setPath_img_upload_folder($path_img_upload_folder) {
        $this->path_img_upload_folder = $path_img_upload_folder;
    }

    public function getPath_img_thumb_upload_folder() {
        return $this->path_img_thumb_upload_folder;
    }

    public function setPath_img_thumb_upload_folder($path_img_thumb_upload_folder) {
        $this->path_img_thumb_upload_folder = $path_img_thumb_upload_folder;
    }

    public function getPath_url_img_upload_folder() {
        return $this->path_url_img_upload_folder;
    }

    public function setPath_url_img_upload_folder($path_url_img_upload_folder) {
        $this->path_url_img_upload_folder = $path_url_img_upload_folder;
    }

    public function setPath_pdf_upload_folder($path_pdf_upload_folder) {
        $this->path_pdf_upload_folder = $path_pdf_upload_folder;
    }

    public function getPath_pdf_upload_folder() {
        return $this->path_pdf_upload_folder;
    }

    public function setPath_url_pdf_upload_folder($path_url_pdf_upload_folder) {
        $this->path_url_pdf_upload_folder = $path_url_pdf_upload_folder;
    }

    public function getPath_url_pdf_upload_folder() {
        return $this->path_url_pdf_upload_folder;
    }

    public function getPath_url_img_thumb_upload_folder() {
        return $this->path_url_img_thumb_upload_folder;
    }

    public function setPath_url_img_thumb_upload_folder($path_url_img_thumb_upload_folder) {
        $this->path_url_img_thumb_upload_folder = $path_url_img_thumb_upload_folder;
    }

    public function getDelete_img_url() {
        return $this->delete_img_url;
    }

    public function setDelete_img_url($delete_pdf_url) {
        $this->delete_pdf_url = $delete_pdf_url;
    }

    public function getDelete_pdf_url() {
        return $this->delete_pdf_url;
    }

    public function setDelete_pdf_url($delete_pdf_url) {
        $this->delete_pdf_url = $delete_pdf_url;
    }



}