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
	    	<div>
		    	<div class="page-header">
				  <h3>Informaci&oacute;n B&aacute;sica <small>Agrega y modifica los elementos b&aacute;sicos de tu curso</small></h3>
				</div>
			</div>
	    	<?php echo $this->load->view("default/_result_messages"); ?>
	    	<form action="<?=site_url('courses/update_basics')?>" method="post" name="updateInfoBasic" id="updateInfoBasic">
				    <?php if(isset($errors)): ?>
	                  <div class="alert alert-error">
	                    <a class="close" data-dismiss="alert" href="#">×</a>
	                        <?=$errors?>
	                  </div>    
	                <?php endif; ?>
	                <input type="hidden" name="id" value="<?=$course->id?>">
				    <label>Titulo:</label>
				    <input type="text" name="title" value="<?=$course->title?>">
				    <label>Subtitulo:</label>
				    <textarea name="subtitle" class="span8" style="height:150px;" placeholder="Ej: Guía alfabética para crear imágenes y clips asombrosos con la versión más reciente del software favorito del sector."><?=$course->subtitle?></textarea>
				    <label>Idioma:</label>
				    <select name="language_id" class="select-chosen">
				    	<?php foreach($languages as $l): ?>
				    		<?php if($l->id == $course->language_id): ?>
				    			<option value="<?=$l->id?>" selected><?=$l->name?></option>
				    		<?php else: ?>
				    			<option value="<?=$l->id?>"><?=$l->name?></option>
				    		<?php endif; ?>
				    	<?php endforeach; ?>
				    </select><br><br>
				    <label>Categoria:</label>
				    <select name="course_category_id" class="select-chosen">
				    	<?php foreach($course_categories as $c): ?>
				    		<?php if($c->id == $course->course_category_id): ?>
				    			<option value="<?=$c->id?>" selected><?=$c->name?></option>
				    		<?php else: ?>
				    			<option value="<?=$c->id?>"><?=$c->name?></option>
				    		<?php endif; ?>
				    	<?php endforeach; ?>
				    </select><br><br>
				    <label>Palabras Claves:</label>
				    <input type="text" name="keywords" value="<?=$course->keywords?>"  class="span8" placeholder="Ej: photoshop, adobe premier, adobe ilustrator, etc"><br><br>
				    <button type="submit" class="btn btn-primary ">Guardar</button>
			</form>
	    </div>
	</div>
</div><!-- /row -->

<script type="text/javascript">
$(document).ready(function(){
	$(".select-chosen").chosen();
});
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>