<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	<div class="row">
		<div class="page-header">
          <h2>Nuevo Curso</h2>
        </div>
	</div>
	<div class="row">
		<div class="span12">
			<?php if(isset($errors)): ?>
		        <div class="alert alert-error">
		          <a class="close" data-dismiss="alert" href="#">×</a>
		              <?=$errors?>
		        </div>    
		    <?php endif; ?>
		    
	        <form action="<?=site_url('courses/course_create')?>" method="post" name="formCreateCourse" id="formCreateCourse" enctype="multipart/form-data">
	          <div class="row">
	          		<div class="row">
		          		<div class="span6">
		          				<label>¿Qu&eacute; quieres ense&ntilde;ar?</label>
		          				<input type="text" name="title" class="span12" placeholder="Ej. Introducci&oacute;n a la Programaci&oacute;n en Java" required>
		          			<label>Subtitulo:</label>
				    		<textarea name="subtitle" class="span12" style="height:50px;" placeholder="Ej: Guía alfabética para crear imágenes y clips asombrosos con la versión más reciente del software favorito del sector."></textarea>
		          		</div>
		          		<div class="span6">
		          			<label>Idioma:</label>
						    <select name="language_id" class="select-chosen">
						    	<?php foreach($languages as $l): ?>
						    			<option value="<?=$l->id?>"><?=$l->name?></option>
						    	<?php endforeach; ?>
						    </select>
						    <label>Categoria:</label>
						    <select name="course_category_id" class="select-chosen">
						    	<?php foreach($course_categories as $c): ?>
						    			<option value="<?=$c->id?>"><?=$c->name?></option>
						    	<?php endforeach; ?>
						    </select>
		          		</div>
		          	</div>
	          		<div class="row">
	          			<div class="span6">
	          				
						    <label>Palabras Claves:</label>
						    <input type="text" name="keywords" value=""  class="span12" placeholder="Ej: photoshop, adobe premier, adobe ilustrator, etc">
						    <label>Sumario del curso:</label>
				    		<textarea name="summary" class="span12" style="height:200px;"></textarea>
	          			</div>
	          			<div class="span6">
	          				<label>Precio:</label>
            				<div class="input-prepend input-append">
							  <select name="money_id" class="span3">
							  	<?php foreach($moneys as $m): ?>
								  <option value="<?=$m->id?>"><?=$m->name?></option>
								<?php endforeach; ?>
							  </select>
							  <input name="price" class="span6" id="appendedPrependedInput" type="text">
							  <span class="add-on">.00</span>
							</div>
							<div class="page-header">
					  		    <h3>Im&aacute;gen del Curso <small>Personaliza la Imagen Principal del Curso aqui</small></h3>
					  		</div>
							<label>Seleccione Im&aacute;gen:</label>
    			    		<input type="file" name="course_thumbnail">
					  		<div class="well well-large">
								<h4 class="blue">Sugerencia</h4>
								Tu imagen, clara y sin pixelar, debe tener un tamaño mínimo de 480x270. Si quieres que tenga un aspecto genial en iPad o tablet, hazla de 960x540.
							</div>
	          			</div>
	          		</div>
	          		<div class="row">
	          			<button type="submit" class="btn btn-primary ">Crear</button>
	          		</div>
	          </div>
	        </form>
		</div>
	</div>
</div>
<?php echo $this->load->view("default/_footer_manage"); ?>