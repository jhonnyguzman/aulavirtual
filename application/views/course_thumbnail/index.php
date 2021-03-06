<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	
  <div class="span3">
		<?php echo $this->load->view("profile/left_menu"); ?>
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

    	<form action="<?=site_url('course_thumbnails/update')?>" method="post" name="updateCourseThumbnail" id="updateCourseThumbnail" enctype="multipart/form-data">
			    <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
			    <label>Seleccione Im&aacute;gen:</label>
			    <input type="file" name="course_thumbnail">
			    <br>
			    <button type="submit" class="btn btn-primary">Guardar</button>
		</form>
    </div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>