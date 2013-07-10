<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	<div class="span3">
		<?php echo $this->load->view("profile/left_menu"); ?>
	</div>
    <div class="span9">
    	<?php echo $this->load->view("default/_result_messages"); ?>
    	<form action="<?=site_url('profiles/update')?>" method="post" name="updateProfile" id="updateProfile">
			  <fieldset>
			    <legend>Mi Perfil</legend>
			    <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
			    <label>Informaci&oacute;n B&aacute;sica:</label>
			    <input type="text" name="desingnation" value="<?=$user->desingnation?>">
			    <label>Nombre:</label>
			    <input type="text" name="name" value="<?=$user->name?>">
			    <label>Apellido:</label>
			    <input type="text" name="surname" value="<?=$user->surname?>">
			    <label>Biograf&iacute;a:</label>
			    <textarea name="biography"><?=$user->biography?></textarea>
			    <label>Idioma:</label>
			    <select name="language_id">
			    	<?php foreach($languages as $l): ?>
			    		<?php if($l->id == $user->language_id): ?>
			    			<option value="<?=$l->id?>" selected><?=$l->name?></option>
			    		<?php else: ?>
			    			<option value="<?=$l->id?>"><?=$l->name?></option>
			    		<?php endif; ?>
			    	<?php endforeach; ?>
			    </select><br>
			    <button type="submit" class="btn btn-primary">Guardar</button>
			  </fieldset>
		</form>
    </div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>