<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	<div class="span3">
		<?php echo $this->load->view("profile/left_menu"); ?>
	</div>
    <div class="span9">
    	<div class="page-header">
		  <h2>Im&aacute;gen de perfil <small>Personaliza tu avatar aqui</small></h2>
		</div>
    	<ul class="thumbnails">
            <li class="span4">
              <a href="#" class="thumbnail">
                <img src="<?=site_url()?>uploads/user_thumbnails/<?=$user_thumbnail->file_name?>" alt="">
              </a>
            </li>
        </ul>
    	<?php echo $this->load->view("default/_result_messages"); ?>

    	<form action="<?=site_url('user_thumbnails/update')?>" method="post" name="updateUserThumbnail" id="updateUserThumbnail" enctype="multipart/form-data">
			    <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
			    <label>Seleccione Im&aacute;gen:</label>
			    <input type="file" name="user_thumbnail">
			    <br>
			    <button type="submit" class="btn btn-primary">Guardar</button>
		</form>
    </div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>