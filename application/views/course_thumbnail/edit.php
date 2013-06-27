<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
  <div class="row">
    <div class="page-header">
        <h2><?=$course->title?></h2>
    </div>
  </div>
  <div class="row">
      <div class="span3">
        <?php echo $this->load->view("courses/left_menu"); ?>
      </div>
      
      <div class="span9">
      	<div class="page-header">
  		    <h3>Im&aacute;gen del Curso <small>Personaliza la Imagen Principal del Curso aqui</small></h3>
  		  </div>
      	<ul class="thumbnails">
              <li class="span4">
                <a href="#" class="thumbnail">
                  <img src="<?=site_url()?>uploads/course_thumbnails/<?=$course_thumbnail->file_name?>" alt="">
                </a>
              </li>
        </ul>
        <?php echo $this->load->view("default/_result_messages"); ?>

        	<form action="<?=site_url('courses/course-edit-update')?>" method="post" name="updateCourseThumbnail" id="updateCourseThumbnail" enctype="multipart/form-data">
    			    <?php if(isset($errors)): ?>
                <div class="alert alert-error">
                  <a class="close" data-dismiss="alert" href="#">×</a>
                      <?=$errors?>
                </div>    
              <?php endif; ?>
              <input type="hidden" name="course_id" value="<?=$course->id?>">
    			    <label>Seleccione Im&aacute;gen:</label>
    			    <input type="file" name="course_thumbnail">
    			    <br>
    			    <button type="submit" class="btn btn-primary">Guardar</button>
    		  </form>
      </div>
  </div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>
